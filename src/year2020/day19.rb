# frozen_string_literal: true

module Year2020
  class Day19
    def part1(input)
      rules_str, messages = input.split("\n\n")
      rules = format_rules(rules_str)
      rule_exp = rule_expression(rules, '0')

      messages.scan(/^#{rule_exp}$/).count
    end

    def part2(_input)
      nil
    end

    private

    def format_rules(rules)
      rules.each_line(chomp: true).with_object({}) do |line, hash|
        key, raw_value = line.split(': ')
        value =
          case raw_value
          when /\d/
            raw_value.prepend('( ').concat(' )').split
          when /"[a-z]"/
            raw_value[1, 1]
          end

        hash[key] = value
      end
    end

    def rule_expression(rules, key)
      rule = rules[key]
      return key if rule.nil?
      return rule if rule.is_a?(String)

      rule.map do |rule_key|
        rule_expression(rules, rule_key)
      end.join
    end
  end
end
