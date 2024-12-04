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
      left_array, right_array = input.lines.map do |line|
        line.split.map(&:to_i)
      end.transpose

      right_counts = right_array.tally
      left_array.reduce(0) do |sum, left_item|
        sum + (left_item * right_counts[left_item].to_i)
      end
    end
  end
end
