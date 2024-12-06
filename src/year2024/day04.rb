# frozen_string_literal: true

require 'matrix'

module Year2024
  class Day04
    WORD = 'XMAS'
    DIRECTIONS = [[1, 0], [1, 1], [0, 1], [-1, 1]].freeze

    def part1(input)
      matrix = Matrix.rows(input.lines.map { |line| line.strip.chars })
      width = matrix.column_count
      height = matrix.row_count

      (0...width).to_a.product((0...height).to_a).sum do |col, row|
        DIRECTIONS.count do |delta_col, delta_row|
          matches_word?(matrix, col, row, delta_col, delta_row, WORD) ||
            matches_word?(matrix, col, row, delta_col, delta_row, WORD.reverse)
        end
      end
    end

    def part2(input)
      nil
    end

    private

    def matches_word?(matrix, col, row, delta_col, delta_row, word)
      word.chars.each_with_index.all? do |char, index|
        current_col = col + delta_col * index
        current_row = row + delta_row * index
        within_bounds?(matrix, current_col, current_row) && matrix[current_row, current_col] == char
      end
    end

    def within_bounds?(matrix, col, row)
      col.between?(0, matrix.column_count - 1) && row.between?(0, matrix.row_count - 1)
    end
  end
end
