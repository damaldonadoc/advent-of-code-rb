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

    def part2(input)
      my_ticket = input.split("\n\n")[1].split(',').map(&:to_i)

      sorted_fields(input)

      field_indexes =
        sorted_fields(input).each_with_object([]) do |(k, v), acc|
          acc << k if v.first.start_with?('departure')
        end

      field_indexes.reduce(1) do |acc, i|
        acc *= my_ticket.at(i).to_i
        acc
      end
    end

    def sorted_fields(input)
      rules_str, _, tickets = input.split("\n\n")

      rules = extract_rules(rules_str)

      valid_tickets =
        tickets.lines.drop(1).select do |ticket|
          invalid_fields(rules, ticket.chomp).empty?
        end

      settle_fields(
        possible_field_matches(rules, valid_tickets)
      )
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

    def possible_field_matches(rules, tickets)
      tickets.each_with_object({}) do |ticket, fields|
        ticket_fields = ticket.split(',').map(&:to_i)

        ticket_fields.select.with_index do |ticket_field, index|
          # initially assing all field names to all indexes
          fields[index] ||= rules.keys

          rules.each do |field, validation|
            # remove field name if field data is not valid
            fields[index].delete(field) unless validation.call(ticket_field)
          end
        end
      end
    end

    def settle_fields(possible_fields)
      taken_fields = []

      possible_fields.sort_by { |_k, v| v.size }
                     .each_with_object({}) do |(k, v), acc|
        acc[k] = v - taken_fields
        taken_fields += acc[k]
      end
    end
  end
end
