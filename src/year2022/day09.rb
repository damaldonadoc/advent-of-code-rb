# frozen_string_literal: true

module Year2022
  class Day09
    DIRECTIONS = {
      'U' => [0, 1],
      'D' => [0, -1],
      'R' => [1, 0],
      'L' => [-1, 0]
    }

    def part1(input)
      rope_state = [[0, 0]] * 2

      input.lines.map do |line|
        direction, moves = *line.split

        moves.to_i.times.map do
          move_rope!(direction, rope_state).last
        end
      end.flatten(1).uniq.count
    end

    def part2(input)
      rope_state = [[0, 0]] * 10

      input.lines.map do |line|
        direction, moves = *line.split

        moves.to_i.times.map do
          move_rope!(direction, rope_state).last
        end
      end.flatten(1).uniq.count
    end

    private

    def move_rope!(direction, rope_state)
      rope_state[0] = [DIRECTIONS[direction], rope_state[0]].transpose.map(&:sum)

      # update position of each knot based on head movement
      (0...(rope_state.size - 1)).each do |i|
        leading_knot = rope_state[i]
        trailing_knot = rope_state[i + 1]

        difference = [leading_knot, trailing_knot].transpose.map { |x| x.reduce(:-) }
        distance = difference.map(&:abs).sum.to_f

        next if distance.zero?

        delta = difference.map { |x| (x / distance).round }

        rope_state[i + 1] = [leading_knot, delta].transpose.map { |x| x.reduce(:-) }
      end

      rope_state
    end
  end
end
