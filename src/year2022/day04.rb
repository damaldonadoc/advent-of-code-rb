# frozen_string_literal: true

module Year2022
  class Day04
    def part1(input)
      input.lines.keep_if do |pair|
        assignation1, assignation2 = *pair.chomp.split(',').map do |x|
          x.split('-').map(&:to_i)
        end

        assignation1 = Range.new(*assignation1)
        assignation2 = Range.new(*assignation2)

        assignation1.cover?(assignation2) || assignation2.cover?(assignation1)
      end.count
    end

    def part2(_input)
      nil
    end
  end
end
