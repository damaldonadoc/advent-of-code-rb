# frozen_string_literal: true

module Year2020
  class Day03
    TREE = '#'

    def part1(input)
      x_move = 3
      y_move = 1

      trees_in_slope(input.lines, x_move, y_move)
    end

    def part2(input)
      moves = [
        { x: 1, y: 1 },
        { x: 3, y: 1 },
        { x: 5, y: 1 },
        { x: 7, y: 1 },
        { x: 1, y: 2 }
      ]

      moves.map do |move|
        trees_in_slope(input.lines, move[:x], move[:y])
      end.reduce(1, :*)
    end

    private

    def trees_in_slope(lines, x_move, y_move)
      filtered_lines = lines.each_with_index.reduce([]) do |acc, (line, index)|
        (index % y_move).zero? ? (acc + [line]) : acc
      end

      filtered_lines.each_with_index.sum do |line, index|
        chomped_line = line.chomp

        # move index to simulate pattern repetition
        at = (index * x_move) % chomped_line.size

        chomped_line[at] == TREE ? 1 : 0
      end
    end
  end
end
