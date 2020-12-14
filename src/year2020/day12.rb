# frozen_string_literal: true

module Year2020
  class Day12
    INITIAL_DIRECTION = 90 # East

    INSTRUCTION_DEF = {
      'N' => { var: :y, multiplier: 1, direction: 0 },
      'S' => { var: :y, multiplier: -1, direction: 180 },
      'E' => { var: :x, multiplier: 1, direction: 90 },
      'W' => { var: :x, multiplier: -1, direction: 270 },
      'L' => { var: :direction, multiplier: -1 },
      'R' => { var: :direction, multiplier: 1 }
    }.freeze

    def part1(input)
      state = { x: 0, y: 0, direction: INITIAL_DIRECTION}

      input.split.each do |instruction|
        state = exec_instruction(instruction, state)
      end

      state[:x].abs + state[:y].abs
    end

    def part2(_input)
      nil
    end

    private

    def exec_instruction(instruction_str, state)
      action, value = instruction_str.split(//, 2)
      delta_state = state.dup

      instruction = if INSTRUCTION_DEF.keys.include?(action)
                      INSTRUCTION_DEF[action]
                    else
                      axis_for_direction(state[:direction])
                    end
      delta_state[instruction[:var]] += value.to_i * instruction[:multiplier]

      instruction[:var] == :direction &&
        delta_state[:direction] = normalize_direction(delta_state[:direction])

      delta_state
    end

    def axis_for_direction(direction)
      INSTRUCTION_DEF.select do |_k, v|
        return v if v.fetch(:direction) == direction.abs
      end
    end

    def normalize_direction(direction)
      direction - (direction / 360 + 0.5).floor * 360
    end
  end
end
