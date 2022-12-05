# frozen_string_literal: true

module Year2022
  class Day05
    def part1(input)
      stacks_chunk, instructions_chunk = *input.split("\n\n")

      crate_stacks = format_stacks(stacks_chunk)
      instructions = format_instructions(instructions_chunk)

      arrange_stack_map(crate_stacks, instructions)

      crate_stacks.map { |_, stack| stack.last }.join
    end

    def part2(input)
      stacks_chunk, instructions_chunk = *input.split("\n\n")

      crate_stacks = format_stacks(stacks_chunk)
      instructions = format_instructions(instructions_chunk)

      arrange_stack_map(crate_stacks, instructions, multiple_moves: true)

      crate_stacks.map { |_, stack| stack.last }.join
    end

    private

    def format_stacks(stacks_string)
      stack_keys = stacks_string.lines.pop.split.map(&:chomp)
      stack_map = Hash[stack_keys.map { |key| [key.to_i, []] }]

      stacks_string.lines.each_with_object(stack_map) do |line, map|
        line.chars.each_slice(4).map(&:join).each_with_index do |(crate), index|
          crate_id = crate.strip[1]

          map[index + 1].prepend(crate_id) if crate_id
        end
      end
    end

    def format_instructions(instructions_string)
      instructions_string.lines.map do |line|
        _, crates_to_move, _, source_stack, _, target_stack = *line.split.map(&:to_i)

        { crates_to_move: , source_stack: , target_stack: }
      end
    end

    def arrange_stack_map(stack_map, instructions, multiple_moves: false)
      instructions.each do |instruction|
        moving_crates = stack_map[instruction[:source_stack]].pop(instruction[:crates_to_move])

        moving_crates = moving_crates.reverse unless multiple_moves

        stack_map[instruction[:target_stack]].push(*moving_crates)
      end
    end
  end
end
