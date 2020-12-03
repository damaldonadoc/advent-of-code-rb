# frozen_string_literal: true

module Year2020
  class Day03
    X_MOVES = 3
    TREE = '#'

    def part1(input)
      input.lines.each_with_index.sum do |line, index|
        chomped_line = line.chomp

        # move index to simulate pattern repetition
        at = (index * X_MOVES) % chomped_line.size

        chomped_line[at] == TREE ? 1 : 0
      end
    end

    def part2(_input)
      nil
    end
  end
end
