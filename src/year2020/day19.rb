# frozen_string_literal: true

module Year2020
  class Day19
    STACK_LIMIT = 10

    def part1(input)
      rules_str, messages = input.split("\n\n")
      rules = format_rules(rules_str)
      rule_exp = rule_expression(rules, '0')

      messages.scan(/^#{rule_exp}$/).count
    end

    def part2(input)
      rules_str, messages = input.split("\n\n")

      rules_str.gsub!('8: 42', '8: 42 | 42 8')
      rules_str.gsub!('11: 42 31', '11: 42 31 | 42 11 31')

      rules = format_rules(rules_str)
      rule_exp = rule_expression(rules, '0', {})

      messages.scan(/^#{rule_exp}$/).count
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

    def rule_expression(rules, key, prev_calls = {})
      rule = rules[key]
      return key if rule.nil?
      return rule if rule.is_a?(String)

      rule.map do |rule_key|
        prev_calls[rule_key] ||= 1
        prev_calls[rule_key] += 1

        # return the rule expression without the element that causes the loop
        # when reaching the recursive stack limit
        if key == rule_key && prev_calls[rule_key] == STACK_LIMIT
          rule.filter { |el| el.match?(/\d+/) && el != rule_key }.map do |k|
            rule_expression(rules, k, prev_calls)
          end.join
        else
          rule_expression(rules, rule_key, prev_calls)
        end
      end.join
    end
  end
end
