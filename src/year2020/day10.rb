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

    def part2(input)
      rates = input.split("\n").map(&:to_i)
      device_rate = rates.max + 3

      rates = rates.push(device_rate).sort

      # create a Hash with rates as keys, '0' has 1 as value,
      # the rest of the keys has 0 as value
      rates_hash = Hash[[[0, 1]] + rates.map { |r| [r, 0] }]

      rates_hash.each do |rate, combinations|
        ((rate + 1)..(rate + 3)).each do |x|
          rates_hash[x] += combinations if rates_hash[x]
        end
      end

      rates_hash[device_rate]
    end
  end
end
