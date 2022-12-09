# frozen_string_literal: true

module Year2022
  class Day08
    def part1(input)
      grid = input.lines.map { |line| line.strip.chars.map(&:to_i) }

      width = grid.first.count
      height = grid.count

      visible_trees = (width * 2) + ((height - 2) * 2)

      (1...(height - 1)).each do |y|
        (1...(width - 1)).each do |x|
          visible_trees += 1 if visible?(grid, width, height, x, y)
        end
      end

      visible_trees
    end

    def part2(input)
      grid = input.lines.map { |line| line.strip.chars.map(&:to_i) }

      width = grid.first.count
      height = grid.count

      (1...(height - 1)).map do |y|
        (1...(width - 1)).map do |x|
          scenic_score(grid, width, height, x, y)
        end
      end.flatten.max
    end

    private

    def visible?(grid, height, width, *coordinates)
      x, y = coordinates
      target_tree = grid[y][x]

      # visible up or visible down or visible left or visible right
      (0..(y - 1)).none? { |delta_y| target_tree <= grid[delta_y][x] } ||
        ((y + 1)...height).none? { |delta_y| target_tree <= grid[delta_y][x] } ||
        (0..(x - 1)).none? { |delta_x| target_tree <= grid[y][delta_x] } ||
        ((x + 1)...width).none? { |delta_x| target_tree <= grid[y][delta_x] }
    end

    def scenic_score(grid, height, width, *coordinates)
      x, y = coordinates
      target_tree = grid[y][x]

      viewing_distance_up = (0...y).to_a.reverse.reduce(0) do |acc, delta_y|
        break acc + 1 if target_tree <= grid[delta_y][x]

        acc + 1
      end

      viewing_distance_down = ((y + 1)...height).reduce(0) do |acc, delta_y|
        break acc + 1 if target_tree <= grid[delta_y][x]

        acc + 1
      end

      viewing_distance_left = (0...x).to_a.reverse.reduce(0) do |acc, delta_x|
        break acc + 1 if target_tree <= grid[y][delta_x]

        acc + 1
      end

      viewing_distance_right = ((x + 1)...width).reduce(0) do |acc, delta_x|
        break acc + 1 if target_tree <= grid[y][delta_x]

        acc + 1
      end

      viewing_distance_up * viewing_distance_down * viewing_distance_left * viewing_distance_right
    end
  end
end
