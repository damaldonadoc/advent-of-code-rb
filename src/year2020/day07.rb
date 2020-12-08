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

    def part2(input)
      bags_inside(
        format_rules(input.lines),
        'shiny gold'
      )
    end

    private

    def format_rules(lines)
      lines.reduce({}) do |acc, line|
        key, values = line.split(/ bags contain /)

        values_hash =
          values.scan(/(\d)([\w\s]*\s)*/).each_with_object({}) do |value, hash|
            hash.merge!({ value[1].strip => value[0] })
          end

        acc.merge({ key => values_hash })
      end
    end

    def find_containers(rules, colors, count)
      filtered_rules = rules.select do |_k, v|
        (v.keys & colors).empty?
      end

      return count if rules.size == filtered_rules.size

      count += rules.size - filtered_rules.size
      colors = rules.keys - filtered_rules.keys

      find_containers(filtered_rules, colors, count)
    end

    def bags_inside(rules, color)
      return 1 if rules[color].empty?

      rules[color].sum do |k, v|
        inside = bags_inside(rules, k)

        inside > 1 ? v.to_i + (v.to_i * inside) : v.to_i
      end
    end
  end
end
