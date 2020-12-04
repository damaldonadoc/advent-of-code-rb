# frozen_string_literal: true

module Year2020
  class Day04
    REQUIRED_KEYS = %w[byr ecl eyr hcl hgt iyr pid].freeze

    def part1(input)
      format_passports(input).sum do |passport|
        valid_passport?(passport) ? 1 : 0
      end
    end

    def part2(_input)
      nil
    end

    private

    def format_passports(input)
      input.split("\n\n").map { |p| p.gsub("\n", ' ') }
    end

    def valid_passport?(passport)
      keys = passport.split(' ').map { |entry| entry.split(':').first }

      (REQUIRED_KEYS - keys).empty?
    end
  end
end
