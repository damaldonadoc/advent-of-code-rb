# frozen_string_literal: true

module Year2020
  class Day01
    def part1(input)
      input.lines.map(&:to_i).combination(2) do |comb|
        return comb[0] * comb[1] if comb[0] + comb[1] == 2020
      end
    end

    def part2(input)
      input.lines.map(&:to_i).combination(3) do |comb|
        return comb[0] * comb[1] * comb[2] if comb[0] + comb[1] + comb[2] == 2020
      end
    end
  end
end
