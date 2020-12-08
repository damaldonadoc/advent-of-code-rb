# frozen_string_literal: true

module Year2020
  class Day07
    def part1(input)
      find_containers(
        format_rules(input.lines),
        ['shiny gold'],
        0
      )
    end

    def part2(_input)
      nil
    end

    private

    def format_rules(lines)
      lines.reduce({}) do |acc, line|
        key, values = line.split(/ bags contain /)
        acc.merge(
          {
            key => values.scan(/\d([\w\s]*\s)*/).flatten.map(&:strip)
          }
        )
      end
    end

    def find_containers(rules, colors, count)
      filtered_rules = rules.select do |_k, v|
        (v & colors).empty?
      end

      return count if rules.size == filtered_rules.size

      count += rules.size - filtered_rules.size
      colors = rules.keys - filtered_rules.keys

      find_containers(filtered_rules, colors, count)
    end
  end
end
