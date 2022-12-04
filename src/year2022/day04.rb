# frozen_string_literal: true

module Year2022
  class Day04
    def part1(input)
      input.lines.count do |pair|
        assignation1, assignation2 = assignations_from_pair(pair)

        assignation1.cover?(assignation2) || assignation2.cover?(assignation1)
      end
    end

    def part2(input)
      input.lines.count do |pair|
        assignation1, assignation2 = assignations_from_pair(pair)

        (assignation1.to_a & assignation2.to_a).any?
      end
    end

    private

    def assignations_from_pair(pair)
      pair.chomp.split(',').map do |section|
        Range.new(*section.split('-').map(&:to_i))
      end
    end
  end
end
