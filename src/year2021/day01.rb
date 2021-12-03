# frozen_string_literal: true

module Year2021
  class Day01
    def part1(input)
      input.lines.map(&:to_i).each_cons(2).count { |x, y| x < y }
    end

    def part2(input)
      input.lines.map(&:to_i).each_cons(3).map(&:sum).each_cons(2)
           .count { |x, y| x < y }
    end
  end
end
