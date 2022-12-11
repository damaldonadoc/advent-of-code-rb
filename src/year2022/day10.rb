# frozen_string_literal: true

module Year2022
  class Day10
    CHECK_CYCLES = [20, 60, 100, 140, 180, 220].freeze
    COMMAND_CYCLES = {
      'noop' => 1,
      'addx' => 2
    }.freeze
    INITIAL_REGISTER = 1

    CRT_WIDTH = 40

    def part1(input)
      program = load_program(input)

      CHECK_CYCLES.sum do |cycle|
        signal_strength_at_cycle(program, cycle)
      end
    end

    def part2(input)
      program = load_program(input)

      draw_program(program)
    end

    private

    def load_program(input)
      input.lines.map do |line|
        command, value = *line.strip.split

        { command:, value: }
      end
    end

    def signal_strength_at_cycle(program, cycle)
      cycle * register_at_cycle(program, cycle)
    end

    def register_at_cycle(program, cycle)
      elapsed_cycles = 0

      executed_instructions = program.take_while do |instruction|
        elapsed_cycles += COMMAND_CYCLES[instruction[:command]]

        elapsed_cycles < cycle
      end

      INITIAL_REGISTER + executed_instructions.sum { |i| i[:value].to_i }
    end

    def cycles_to_process(program)
      program.sum { |instruction| COMMAND_CYCLES[instruction[:command]] }
    end

    def draw_program(program)
      crt_state = []

      sprite_position = 0
      cycles = 1..cycles_to_process(program)

      cycles.each do |cycle|
        sprite_position = (cycle - 1) % CRT_WIDTH

        crt_state.append(String.new) if sprite_position.zero?

        register = register_at_cycle(program, cycle)
        current_line = crt_state.last

        if ((register - 1)..(register + 1)).to_a.include?(sprite_position)
          current_line.concat('#')
        else
          current_line.concat('.')
        end
      end

      crt_state.join("\n")
    end
  end
end
