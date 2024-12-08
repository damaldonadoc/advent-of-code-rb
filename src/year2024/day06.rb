# frozen_string_literal: true

require 'matrix'
require 'set'

module Year2024
  class Day06
    DIRECTIONS = {
      '^' => [-1, 0],
      '>' => [0, 1],
      'V' => [1, 0],
      '<' => [0, -1]
    }.freeze

    def part1(input)
      matrix = Matrix[*input.lines.map(&:chomp).map(&:chars)]
      initial_position = matrix.index { |el| el == '^' }

      predict_route(matrix, initial_position, DIRECTIONS['^']).size
    end

    def part2(input)
      nil
    end

    private

    def predict_route(matrix, position, direction)
      route = Set.new

      loop do
        obstacle_position = next_obstacle_position(matrix, position, direction)

        path = calculate_path(matrix, position, direction, obstacle_position)

        path.pop if obstacle_position

        route.merge(path)

        break if obstacle_position.nil?

        position = path.last
        direction = turn_right(direction)
      end

      route
    end

    def calculate_path(matrix, position, direction, target)
      if target.nil?
        bounds = [matrix.row_count - 1, matrix.column_count - 1]
        scale = direction.zip(bounds).map { |d, limit| d * limit }
        target = position.zip(direction, scale).map { |pos, dir, s| dir != 0 ? s : pos }
      end

      steps = [(target[0] - position[0]).abs, (target[1] - position[1]).abs].max

      (0..steps).map { |step| [position[0] + step * direction[0], position[1] + step * direction[1]] }
    end

    def next_obstacle_position(matrix, position, direction)
      Enumerator.produce(position) { |(row, col)| [row + direction[0], col + direction[1]] }
                .take_while { |row, col| within_bounds?(matrix, row, col) }
                .find { |row, col| matrix[row, col] == '#' }
    end

    def within_bounds?(matrix, row, col)
      col.between?(0, matrix.column_count - 1) && row.between?(0, matrix.row_count - 1)
    end

    def turn_right(direction)
      DIRECTIONS.values.rotate(DIRECTIONS.values.index(direction) + 1).first
    end
  end
end
