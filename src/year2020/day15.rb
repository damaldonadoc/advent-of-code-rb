# frozen_string_literal: true

module Year2020
  class Day15
    def part1(input)
      numbers = input.split(',').map(&:to_i)
      initial_history = Hash[
        numbers.map.with_index { |n, index| [n, [index + 1]] }
      ]

      play_game(
        initial_history,
        numbers.last,
        numbers.size + 1,
        2020
      ).last
    end

    def part2(input)
      numbers = input.split(',').map(&:to_i)
      initial_history = Hash[
        numbers.map.with_index { |n, index| [n, [index + 1]] }
      ]

      play_game(
        initial_history,
        numbers.last,
        numbers.size + 1,
        30_000_000
      ).last
    end

    private

    def play_game(history, last, turn, max_turns)
      return [history, last] if turn > max_turns

      current = if history[last].size < 2
                  0
                else
                  history[last].last(2).reduce(:-).abs
                end

      history[current] = history[current] ? history[current] << turn : [turn]

      play_game(history, current, turn + 1, max_turns)
    end
  end
end
