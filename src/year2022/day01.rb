# frozen_string_literal: true

module Year2022
  class Day01
    def part1(input)
      calories_by_elf(input).max
    end

    def part2(input)
      calories_by_elf(input).max(3).sum
    end

    private

    def calories_by_elf(input)
      input.split("\n\n").map { |c| c.split.map(&:to_i).sum }
    end
  end
end
