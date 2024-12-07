# frozen_string_literal: true

module Year2024
  class Day05
    def part1(input)
      sections = input.split("\n\n")

      rule_map = sections[0].lines.each_with_object(Hash.new { |h, k| h[k] = [] }) do |line, map|
        first, last = line.strip.split('|').map(&:to_i)
        map[first] << last
      end

      updates = sections[1].lines.map { |line| line.strip.split(',').map(&:to_i) }

      valid_updates = updates.select do |update|
        indices = update.each_with_index.to_h
        update.all? do |page|
          rule_map.fetch(page, []).all? do |dependent|
            !indices.key?(dependent) || indices[page] < indices[dependent]
          end
        end
      end

      valid_updates.sum { |update| update[update.size / 2] }
    end

    def part2(input)
      nil
    end
  end
end
