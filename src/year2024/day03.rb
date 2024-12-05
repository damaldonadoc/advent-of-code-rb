# frozen_string_literal: true

module Year2024
  class Day03
    def part1(input)
      input
        .scan(/mul\(\s*\d+\s*,\s*\d+\s*\)/)
        .sum { |instruction| instruction.scan(/\d+/).map(&:to_i).reduce(:*) }
    end

    def part2(input)
      nil
    end
  end
end
