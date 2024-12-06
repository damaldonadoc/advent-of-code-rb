# frozen_string_literal: true

require 'matrix'

module Year2024
  class Day04
    def part1(input)
      word = 'XMAS'
      directions = [[1, 0], [1, 1], [0, 1], [-1, 1]]

      matrix = Matrix.rows(input.lines.map { |line| line.strip.chars })
      width = matrix.column_count
      height = matrix.row_count

      (0...width).to_a.product((0...height).to_a).sum do |col, row|
        directions.count do |delta_col, delta_row|
          matches_word?(matrix, col, row, delta_col, delta_row, word) ||
            matches_word?(matrix, col, row, delta_col, delta_row, word.reverse)
        end
      end
    end

    def part2(input)
      matrix = Matrix.rows(input.lines.map { |line| line.strip.chars })
      width = matrix.column_count
      height = matrix.row_count

      (0...width).to_a.product((0...height).to_a).count do |col, row|
        x_mas_pattern?(matrix, col, row)
      end
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

    def x_mas_pattern?(matrix, col, row)
      word = 'MAS'
      directions = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

      directions.combination(2).any? do |(delta_col1, delta_row1), (delta_col2, delta_row2)|
        matches_word?(matrix, col - delta_col1, row - delta_row1, delta_col1, delta_row1, word) &&
          matches_word?(matrix, col - delta_col2, row - delta_row2, delta_col2, delta_row2, word)
      end
    end
  end
end
