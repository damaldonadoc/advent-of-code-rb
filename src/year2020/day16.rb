# frozen_string_literal: true

module Year2020
  class Day16
    def part1(input)
      rules_str, _my_ticket, tickets = input.split("\n\n")

      rules = extract_rules(rules_str)

      tickets.lines.drop(1).map do |ticket|
        invalid_fields(rules, ticket.chomp)
      end.flatten.sum
    end

    def part2(_input)
      nil
    end

    private

    def extract_rules(rules_str)
      rules_str.each_line(chomp: true).each_with_object({}) do |r, acc|
        _, field, min_a, max_a, min_b, max_b =
          r.match(/([\w|\s]+):\s(\d+)-(\d+) or (\d+)-(\d+)/).to_a

        acc[field] = lambda { |n|
          n.between?(min_a.to_i, max_a.to_i) ||
            n.between?(min_b.to_i, max_b.to_i)
        }
      end
    end

    def invalid_fields(rules, ticket)
      ticket_fields = ticket.split(',').map(&:to_i)

      ticket_fields.select do |ticket_field|
        rules.none? do |_k, validation|
          validation.call(ticket_field)
        end
      end
    end
  end
end
