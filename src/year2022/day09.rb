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
      rope_state = {
        head_position: [0, 0],
        tail_position: [0, 0]
      }

      input.lines.map do |line|
        direction, moves = *line.split

        moves.to_i.times.map do
          move_rope!(direction, rope_state)[:tail_position]
        end
      end.flatten(1).uniq.count
    end

    def part2(_input)
      nil
    end

    private

    def move_rope!(direction, rope_state)
      new_head_position = [DIRECTIONS[direction], rope_state[:head_position]].transpose.map(&:sum)

      adjacent_pocitions = [-1, 0, 1].repeated_permutation(2).to_a.map do |d|
        [new_head_position, d].transpose.map(&:sum)
      end

      unless adjacent_pocitions.include?(rope_state[:tail_position])
        rope_state[:tail_position] =
          if new_head_position[0] == rope_state[:tail_position][0] ||
             new_head_position[1] == rope_state[:tail_position][1]

            [DIRECTIONS[direction], rope_state[:tail_position]].transpose.map(&:sum)
          else
            rope_state[:head_position]
          end

      end

      rope_state[:head_position] = new_head_position

      rope_state
    end
  end
end
