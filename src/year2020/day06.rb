# frozen_string_literal: true

module Year2020
  class Day06
    QUESTION_LIST = ('a'..'z').freeze

    def part1(input)
      grouped_answers(input).sum do |group|
        group.chars.uniq.count
      end
    end

    def part2(input)
      group_answers_by_person(input).sum do |group|
        group.reduce(QUESTION_LIST.to_a) do |acc, answer|
          acc & answer.chars
        end.size
      end
    end

    private

    def grouped_answers(input)
      input.split("\n\n").map { |g| g.delete("\n") }
    end

    def group_answers_by_person(input)
      input.split("\n\n").map(&:split)
    end
  end
end
