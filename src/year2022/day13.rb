# frozen_string_literal: true

require 'JSON'

module Year2022
  class Day13
    def part1(input)
      pairs = input.split("\n\n").map { |p| p.strip.split("\n").map { |a| JSON.parse(a) } }

      pairs.each_with_index.reduce(0) do |acc, ((val1, val2), index)|
        compare(val1, val2).negative? ? acc + index + 1 : acc
      end
    end

    def part2(input)
      dividers = [[[2]], [[6]]]

      dividers_string = dividers.map(&:to_s).join("\n")

      input = (input + dividers_string).gsub("\n\n", "\n")

      packets = input.split("\n").map { |line| JSON.parse(line) }

      packets.sort! { |val1, val2| compare(val1, val2) }

      packets.each_with_index.reduce(1) do |acc, (packet, index)|
        dividers.include?(packet) ? acc * (index + 1) : acc
      end
    end

    private

    # -1 when message1 <  message2
    #  0 when message1 == message2
    #  1 when message1 >  message2
    def compare(message1, message2)
      (0...[message1.size, message2.size].max).each do |index|
        val1 = message1[index]
        val2 = message2[index]

        return -1 if val1.nil? && !val2.nil?
        return 1 if !val1.nil? && val2.nil?

        if val1.is_a?(Integer) && val2.is_a?(Integer)
          return -1 if val1 < val2
          return 1 if val1 > val2
        end

        in_order = compare([val1], val2) if val1.is_a?(Integer) && val2.is_a?(Array)
        in_order = compare(val1, [val2]) if val1.is_a?(Array) && val2.is_a?(Integer)
        in_order = compare(val1, val2) if val1.is_a?(Array) && val2.is_a?(Array)

        return in_order unless in_order.nil? || in_order.zero?
      end

      0
    end
  end
end
