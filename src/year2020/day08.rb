# frozen_string_literal: true

module Year2020
  class Day08
    def part1(input)
      _i, acc, _p = process_instructions(input.lines, 0, 0, [])

      acc
    end

    def part2(_input)
      nil
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
