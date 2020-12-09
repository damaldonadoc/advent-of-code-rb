# frozen_string_literal: true

module Year2020
  class Day09
    def part1(input, preamble_size = 25)
      find_invalid(input.split("\n").map(&:to_i), preamble_size)
    end

    def part2(input, preamble_size = 25)
      numbers = input.split("\n").map(&:to_i)
      invalid = find_invalid(numbers, preamble_size)
      comb = find_invalid_combination(invalid, numbers).sort

      comb.first + comb.last
    end

    private

    def valid?(preamble, number)
      preamble.combination(2).each do |i, j|
        return true if number == i + j
      end

      false
    end

    def find_invalid(input, preamble_size)
      preamble = input.take(preamble_size)
      numbers = input.drop(preamble_size)

      numbers.each do |n|
        return n unless valid?(preamble, n)

        preamble.delete_at(0)
        preamble << n
      end
    end

    def find_invalid_combination(number, array)
      (2..(array.size - 1)).each do |i|
        array.each_cons(i) do |chunk|
          return chunk if chunk.sum == number
        end
      end
    end
  end
end
