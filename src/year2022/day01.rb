# frozen_string_literal: true

module Year2022
  class Day01
    def part1(input)
      input.split("\n\n").map { |c| c.split.map(&:to_i).sum }.max
    end

    def part2(_input)
      nil
    end
  end
end
