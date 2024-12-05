# frozen_string_literal: true

module Year2024
  class Day03
    def part1(input)
      input
        .scan(/mul\(\s*\d+\s*,\s*\d+\s*\)/)
        .sum { |instruction| instruction.scan(/\d+/).map(&:to_i).reduce(:*) }
    end

    def part2(input)
      enabled = true

      input.scan(/do\(\)|don't\(\)|mul\(\d+,\d+\)/).sum do |instruction|
        if instruction.start_with?('mul')
          enabled ? instruction.scan(/\d+/).map(&:to_i).reduce(:*) : 0
        else
          enabled = (instruction == 'do()')
          0
        end
      end
    end
  end
end
