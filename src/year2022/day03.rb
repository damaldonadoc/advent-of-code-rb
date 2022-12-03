# frozen_string_literal: true

module Year2022
  class Day03
    def part1(input)
      input.lines.reduce(0) do |acc,rucksack|
        items_c1, items_c2 = rucksack.chars.each_slice(rucksack.size / 2).to_a

        duplicated_item = (items_c1 & items_c2).first

        offset = duplicated_item.ord > 90 ? 96 : 38

        acc + (duplicated_item.ord - offset)
      end
    end

    def part2(_input)
      nil
    end
  end
end
