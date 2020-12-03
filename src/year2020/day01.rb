# frozen_string_literal: true

module Year2020
  class Day01
    def part1(input)
      input.lines.reduce do |_acc, line|
        pair = input.lines.find { |x| line.to_i + x.to_i == 2020 }

        break line.to_i * pair.to_i if pair
      end
    end

    def part2(input)
      input.lines.each_with_index do |line, x|
        rest_of_lines = input.lines.drop(x + 1)
        break if rest_of_lines.size < 2

        rest_of_lines.each_with_index do |second_line, y|
          third_line = rest_of_lines.drop(y + 1).find do |temp_line|
            line.to_i + second_line.to_i + temp_line.to_i == 2020
          end

          return line.to_i * second_line.to_i * third_line.to_i if third_line
        end
      end
    end
  end
end
