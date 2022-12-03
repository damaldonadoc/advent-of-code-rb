# frozen_string_literal: true

module Year2022
  class Day02
    OPONENT_PLAYS = { 'A' => 1, 'B' => 2, 'C' => 3 }.freeze
    MY_PLAYS = { 'X' => 1, 'Y' => 2, 'Z' => 3 }.freeze
    ROUND_SCORES = { win: 6, draw: 3, loss: 0 }.freeze

    def part1(input)
      input.lines.map(&:split).map do |oponent_play, my_play|
        outcome =
          case MY_PLAYS[my_play] - OPONENT_PLAYS[oponent_play]
          when -1, 2
            ROUND_SCORES[:loss]
          when 0
            ROUND_SCORES[:draw]
          when -2, 1
            ROUND_SCORES[:win]
          end

        MY_PLAYS[my_play] + outcome
      end.sum
    end

    def part2(input)
      input.lines.map(&:split).map do |oponent_play, desired_outcome|
        case desired_outcome
        when 'X'
          MY_PLAYS.values[OPONENT_PLAYS[oponent_play] - 2] + ROUND_SCORES[:loss]
        when 'Y'
          MY_PLAYS.values[OPONENT_PLAYS[oponent_play] - 1] + ROUND_SCORES[:draw]
        when 'Z'
          MY_PLAYS.values[OPONENT_PLAYS[oponent_play] - 3] + ROUND_SCORES[:win]
        end
      end.sum
    end
  end
end
