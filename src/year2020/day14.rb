# frozen_string_literal: true

module Year2020
  class Day14
    def part1(input)
      memory = {}
      mask = +''

      input.each_line(chomp: true) do |line|
        if line.include?('mask')
          mask = line.split(' = ').last
          next
        end

        _, address, decimal = line.match(/mem\[(\d+)\]\s=\s(\d+)/).to_a
        binary = format('%b', decimal).rjust(36, '0')

        memory[address] =
          mask.chars.zip(binary.chars).each_with_object(+'') do |(m, b), acc|
            acc.concat(m == 'X' ? b : m)
          end.to_i(2)
      end

      memory.values.sum
    end

    def part2(_input)
      nil
    end
  end
end
