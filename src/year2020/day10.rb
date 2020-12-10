# frozen_string_literal: true

module Year2020
  class Day10
    def part1(input)
      rates = input.split("\n").map(&:to_i)
      rates = rates.push(0, rates.max + 3).sort

      diff_count = rates.each_cons(2)
                        .with_object({ '1': 0, '3': 0 }) do |pair, hash|
        diff = pair.last - pair.first
        hash[diff.to_s.to_sym] += 1
      end

      diff_count[:'1'] * diff_count[:'3']
    end

    def part2(_input)
      nil
    end
  end
end
