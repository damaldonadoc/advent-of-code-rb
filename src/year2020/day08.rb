# frozen_string_literal: true

module Year2020
  class Day08
    def part1(input)
      _i, acc, _p = process_instructions(input.lines, 0, 0, [])

      acc
    end

    def part2(input)
      jump_instructions =
        input.lines.each_with_index.each_with_object([]) do |(line, index), acc|
          acc << index if line.include?('jmp')
        end

      jump_instructions.each do |i|
        lines = input.lines.dup
        lines[i] = lines[i].gsub('jmp', 'nop')

        index, acc, _p = process_instructions(lines, 0, 0, [])

        return acc if index == lines.size
      end
    end

    private

    def process_instructions(instructions, index, acc, processed)
      instruction, param = instructions[index].split(' ')

      acc += param.to_i if instruction == 'acc'
      index += instruction == 'jmp' ? param.to_i : 1

      if processed.include?(index) || index == instructions.size
        [index, acc, processed]
      else
        processed << index
        process_instructions(instructions, index, acc, processed)
      end
    end
  end
end
