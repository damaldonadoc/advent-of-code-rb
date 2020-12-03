# frozen_string_literal: true

module Year2020
  class Day02
    def part1(input)
      input.lines.sum do |line|
        valid_password?(format_line(line)) ? 1 : 0
      end
    end

    def part2(_input)
      nil
    end

    private

    def format_line(line)
      ocurrences, char, password = line.split(' ')
      min, max = ocurrences.split('-')

      {
        min: min.to_i,
        max: max.to_i,
        char: char.delete(':'),
        password: password
      }
    end

    def valid_password?(min:, max:, char:, password:)
      ocurrences = password.count(char)

      min <= ocurrences && ocurrences <= max
    end
  end
end
