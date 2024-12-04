# frozen_string_literal: true

module Year2024
  class Day02
    def part1(input)
      reports = input.lines.map { |line| line.split.map(&:to_i) }

      reports.count do |levels|
        safe_report?(levels)
      end
    end

    def part2(input)
      reports = input.lines.map { |line| line.split.map(&:to_i) }

      reports.count do |levels|
        safe_report?(levels) || levels.each_index.any? do |i|
          safe_report?(levels.reject.with_index do |_, idx|
            idx == i
          end)
        end
      end
    end

    private

    def safe_report?(levels)
      differences = levels.each_cons(2).map { |a, b| b - a }

      differences.all? { |d| d.abs.between?(1, 3) } &&
        (differences.all?(&:positive?) || differences.all?(&:negative?))
    end
  end
end
