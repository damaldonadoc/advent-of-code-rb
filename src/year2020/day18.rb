# frozen_string_literal: true

module Year2020
  class Day18
    def part1(input)
      input.lines.sum do |line|
        eval_expression(line.chomp.delete(' ')).to_i
      end
    end

    def part2(_input)
      nil
    end

    def eval_expression(expression)
      subexp = +''
      operator_count = 0
      index = 0

      while index < expression.size
        char = expression[index]

        case char
        when '('
          parentheses_exp = extract_subexpression(expression[(index + 1)..])
          result = eval_expression(parentheses_exp)
          index += parentheses_exp.size

          subexp.concat(result)
        when /\d/
          subexp.concat(char)
        when /[+*]/
          if operator_count == 1
            subexp_res = eval_expression(subexp)

            subexp = subexp_res
            operator_count = 0
          end

          operator_count += 1
          subexp.concat(char)
        end

        index += 1
      end

      eval(subexp).to_s
    end

    private

    def extract_subexpression(expression)
      open_parentheses = 1

      expression.chars.each_with_index do |char, index|
        open_parentheses -= 1 if char == ')'
        open_parentheses += 1 if char == '('

        return expression[0..(index - 1)] if open_parentheses.zero?
      end
    end
  end
end
