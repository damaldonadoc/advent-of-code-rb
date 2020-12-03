# frozen_string_literal: true

module Year2020
  class Day02
    def part1(input)
      input.lines.sum do |line|
        valid_password_by_ocurrences?(format_line(line)) ? 1 : 0
      end
    end

    def part2(input)
      input.lines.sum do |line|
        valid_password_by_position?(format_line(line)) ? 1 : 0
      end
    end

    private

    def format_line(line)
      ocurrences, char, password = line.split(' ')
      a, b = ocurrences.split('-')

      {
        a: a.to_i,
        b: b.to_i,
        char: char.delete(':'),
        password: password
      }
    end

    def valid_password_by_ocurrences?(a:, b:, char:, password:)
      ocurrences = password.count(char)

      a <= ocurrences && ocurrences <= b
    end

    def valid_password_by_position?(a:, b:, char:, password:)
      (password[a - 1] == char) ^ (password[b - 1] == char)
    end
  end
end
