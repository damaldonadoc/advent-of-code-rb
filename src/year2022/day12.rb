# frozen_string_literal: true

require 'Matrix'

module Year2022
  class Day12
    START_MARK = 'S'
    GOAL_MARK = 'E'
    DIRECTIONS = [[1, 0], [0, 1], [-1, 0], [0, -1]].freeze

    def part1(input)
      height_matrix = Matrix[*input.lines.map { |line| line.strip.chars }]

      start_index = height_matrix.find_index(START_MARK)
      goal_index = height_matrix.find_index(GOAL_MARK)

      height_matrix[*start_index] = 'a'
      height_matrix[*goal_index] = 'z'

      start = { row: start_index[0], column: start_index[1], steps_from_start: 0, steps_to_goal: Float::INFINITY, neighbors: [] }
      goal = { row: goal_index[0], column: goal_index[1], neighbors: [] }

      open_set = [start]
      closed_set = []

      build_graph(height_matrix, start, goal)

      search_path(open_set, closed_set, goal).count
    end

    def part2(input)
      height_matrix = Matrix[*input.lines.map { |line| line.strip.chars }]

      goal_index = height_matrix.find_index(GOAL_MARK)
      height_matrix[*goal_index] = 'z'

      height_matrix.each_with_index.map do |val, row, column|
        # assumed it was any `a` on the edge
        next unless val == 'a' && column.zero?

        start = { row: row, column: column, steps_from_start: 0, steps_to_goal: Float::INFINITY, neighbors: [] }
        goal = { row: goal_index[0], column: goal_index[1], neighbors: [] }

        open_set = [start]
        closed_set = []

        build_graph(height_matrix, start, goal)

        search_path(open_set, closed_set, goal).count
      end.compact.min
    end

    private

    def build_graph(matrix, start, goal)
      nodes_map = {
        [start[:row], start[:column]] => start,
        [goal[:row], goal[:column]] => goal
      }
      matrix.each_with_index.each_with_object(nodes_map) do |(_val, row, column), acc|
        next if (start[:row] == row && start[:column] == column) || (goal[:row] == row && goal[:column] == column)

        acc[[row, column]] = { row:, column:, neighbors: [] }
      end

      nodes_map.each do |node_coords, node|
        val = matrix[*node_coords]

        # Matrix returns nil when requesting for an out of bounds element
        # so excluding only negatives
        neighbors_coords = DIRECTIONS.map { |d| [d, node_coords].transpose.map(&:sum) }
                                     .reject { |coord| coord.any?(&:negative?) }

        neighbors_coords.each do |(row, column)|
          # skip if out of bounds (nil) or if can't be "climbed"
          next if matrix[row, column].nil? || matrix[row, column].ord > val.ord + 1

          neighbor_node = nodes_map[[row, column]]

          node[:neighbors].append(neighbor_node)
        end
      end
    end

    def distance(origin, target)
      (
        (origin[:row] - target[:row]).pow(2) +
        (origin[:column] - target[:column]).pow(2)
      ).pow(0.5)
    end

    def search_path(open_set, closed_set, goal)
      while open_set.any?
        current = closest_node(open_set)

        return reconstruct_path(current) if current == goal

        open_set.delete(current)
        closed_set.append(current)

        (current[:neighbors] - closed_set).each do |neighbor|
          g_score = current[:steps_from_start] + distance(current, neighbor)

          if !open_set.include?(neighbor)
            open_set.append(neighbor)
            improving = true
          elsif g_score < neighbor[:steps_from_start]
            improving = true
          else
            improving = false
          end

          next unless improving

          neighbor[:prev] = current

          neighbor[:steps_from_start] = g_score

          neighbor[:steps_to_goal] = distance(neighbor, goal)
        end
      end

      []
    end

    def closest_node(set)
      set.min_by { |node| node[:steps_from_start] + node[:steps_to_goal] }
    end

    def reconstruct_path(node)
      node[:prev] ? reconstruct_path(node[:prev]) + [node] : []
    end
  end
end
