# frozen_string_literal: true

module Year2024
  class Day01
    def part1(input)
      left_array, right_array = input.lines.map do |line|
        line.split.map(&:to_i)
      end.transpose.map(&:sort)

      left_array.each_with_index.reduce(0) do |sum, (left_item, i)|
        sum + (right_array[i] - left_item).abs
      end
    end

    def part2(input)
      nil
    end
  end
end
