# frozen_string_literal: true

module Year2021
  class Day02
    def part1(input)
      input.lines.each_with_object({ d: 0, h: 0 }) do |command, position|
        direction, units = command.split(' ')

        case direction
        when 'forward'
          position[:h] += units.to_i
        when 'up'
          position[:d] -= units.to_i
        when 'down'
          position[:d] += units.to_i
        end

        position
      end.each_value.reduce(:*)
    end

    def part2(_input)
      nil
    end
  end
end
