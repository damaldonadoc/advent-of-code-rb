# frozen_string_literal: true

module Year2020
  class Day06
    def part1(input)
      grouped_answers(input).sum do |group|
        group.chars.uniq.count
      end
    end

    def part2(_input)
      nil
    end

    private

    def grouped_answers(input)
      input.split("\n\n").map { |g| g.delete("\n") }
    end
  end
end
