# frozen_string_literal: true

module Year2022
  class Day10
    CHECK_CYCLES = [20, 60, 100, 140, 180, 220].freeze
    COMMAND_CYCLES = {
      'noop' => 1,
      'addx' => 2
    }.freeze
    INITIAL_REGISTER = 1

    def part1(input)
      program = load_program(input)

      CHECK_CYCLES.sum do |cycle|
        signal_strength_at_cycle(program, cycle)
      end
    end

    def part2(_input)
      nil
    end

    private

    def load_program(input)
      input.lines.map do |line|
        command, value = *line.strip.split

        { command:, value: }
      end
    end

    def signal_strength_at_cycle(program, cycle)
      elapsed_cycles = 0

      executed_instructions = program.take_while do |instruction|
        elapsed_cycles += COMMAND_CYCLES[instruction[:command]]

        elapsed_cycles < cycle
      end

      register = INITIAL_REGISTER + executed_instructions.sum { |i| i[:value].to_i }

      cycle * register
    end
  end
end
