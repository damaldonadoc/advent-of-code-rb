# frozen_string_literal: true

module Year2022
  class Day06
    PACKET_MARKER_LENGTH = 4
    MESSAGE_MARKER_LENGTH = 14

    def part1(input)
      input.chars.each_cons(PACKET_MARKER_LENGTH).map(&:to_set)
           .find_index { |x| x.size == PACKET_MARKER_LENGTH } + PACKET_MARKER_LENGTH
    end

    def part2(input)
      input.chars.each_cons(MESSAGE_MARKER_LENGTH).map(&:to_set)
           .find_index { |x| x.size == MESSAGE_MARKER_LENGTH } + MESSAGE_MARKER_LENGTH
    end
  end
end
