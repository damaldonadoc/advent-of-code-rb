# frozen_string_literal: true

#
module Year2024
  class Day02
    def part1(input)
      reports = input.lines.map { |line| line.split.map(&:to_i) }

      reports.count do |levels|
        differences = levels.each_cons(2).map { |a, b| b - a }
        next false unless differences.all?(&:positive?) || differences.all?(&:negative?)

        differences.all? { |d| d.abs.between?(1, 3) }
      end
    end

    def part2(input)
      nil
    end
  end
end
