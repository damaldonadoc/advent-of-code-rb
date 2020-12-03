# frozen_string_literal: true

module Year2020
  class Day01
    def part1(input)
      input.lines.reduce do |_acc, line|
        pair = input.lines.find { |x| line.to_i + x.to_i == 2020 }

        break line.to_i * pair.to_i if pair
      end
    end

    def part2(_input)
      nil
    end
  end
end
