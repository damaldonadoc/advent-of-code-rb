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
      state = { x: 0, y: 0, direction: INITIAL_DIRECTION }

      input.split.each do |instruction|
        state = exec_instruction(instruction, state)
      end

      state[:x].abs + state[:y].abs
    end

    def part2(input)
      state = { x: 0, y: 0, waypoint: { x: 10, y: 1 } }

      input.split.each do |instruction|
        state = exec_instruction_with_waypoint(instruction, state)
      end

      state[:x].abs + state[:y].abs
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

    def exec_instruction_with_waypoint(instruction_str, state)
      action, value = instruction_str.split(//, 2)
      delta_state = state.dup

      if INSTRUCTION_DEF.keys.include?(action)
        instruction = INSTRUCTION_DEF[action]

        if instruction[:var] == :direction
          delta_state[:waypoint] = calc_waypoint(action, value.to_i, delta_state[:waypoint])
        else
          delta_state[:waypoint][instruction[:var]] += value.to_i * instruction[:multiplier]
        end
      else
        delta_state[:x] += delta_state[:waypoint][:x] * value.to_i
        delta_state[:y] += delta_state[:waypoint][:y] * value.to_i
      end

      delta_state
    end

    def axis_for_direction(direction)
      INSTRUCTION_DEF.select do |_k, v|
        return v if v.fetch(:direction) == direction.abs
      end
    end

    def normalize_direction(direction)
      direction % 360
    end

    def calc_waypoint(action, value, waypoint)
      value *= action == 'R' ? 1 : -1

      case normalize_direction(value).to_i
      when 0
        waypoint
      when 90
        { x:  waypoint[:y], y: -waypoint[:x] }
      when 180
        { x: -waypoint[:x], y: -waypoint[:y] }
      when 270
        { x: -waypoint[:y], y: waypoint[:x] }
      end
    end
  end
end
