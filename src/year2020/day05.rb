# frozen_string_literal: true

module Year2020
  class Day05
    ROW_RANGE = (0..127).freeze
    COLUMN_RANGE = (0..7).freeze

    def part1(input)
      input.lines.map do |line|
        row(line) * COLUMN_RANGE.size + column(line)
      end.max
    end

    def part2(_input)
      nil
    end

    def row(code)
      string_range_binary_search(code.slice(0, 8), ROW_RANGE, 'F', 'B')
    end

    def column(code)
      string_range_binary_search(code.slice(7, 3), COLUMN_RANGE, 'L', 'R')
    end

    private

    def string_range_binary_search(string, range, first_char, last_char)
      string.chars.reduce(range) do |acc_range, char|
        half = (acc_range.last + acc_range.first).fdiv(2).round

        case char
        when first_char
          acc_range = acc_range.first..half
        when last_char
          acc_range = half..acc_range.last
        end

        acc_range
      end.first
    end
  end
end
