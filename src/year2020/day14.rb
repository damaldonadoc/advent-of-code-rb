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

    def part2(input)
      memory = {}
      mask = +''

      input.each_line(chomp: true) do |line|
        if line.include?('mask')
          mask = line.split(' = ').last
          next
        end

        _, address, value = line.match(/mem\[(\d+)\]\s=\s(\d+)/).to_a

        binary = format('%b', address).rjust(36, '0')

        modified_address =
          mask.chars.zip(binary.chars).each_with_object(+'') do |(m, b), acc|
            acc.concat(m == '0' ? b : m)
          end

        addresses =
          [0, 1].repeated_permutation(mask.count('X')).map do |perm|
            modified_address.gsub('X').with_index { |_, index| perm[index] }
          end

        addresses.each do |add|
          memory[add.to_i(2)] = value.to_i
        end
      end

      memory.values.sum
    end
  end
end
