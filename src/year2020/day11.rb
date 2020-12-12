# frozen_string_literal: true

module Year2020
  class Day11
    OCCUPIED = '#'
    FREE = 'L'

    def part1(input)
      stable_seatmap(
        input.split("\n").map { |line| line.split('') }
      ).flatten.count(OCCUPIED)
    end

    def part2(_input)
      nil
    end

    private

    def stable_seatmap(seatmap)
      new_seatmap = exec_round(seatmap)

      return new_seatmap if new_seatmap == seatmap

      stable_seatmap(new_seatmap)
    end

    def exec_round(seatmap)
      seatmap.each_with_index.map do |row, y|
        row.each_with_index.map do |seat, x|
          next seat if seat == '.'

          occupied_adj = occupied_adjacent(seatmap, x, y)

          if seat == FREE && occupied_adj.zero?
            OCCUPIED
          elsif seat == OCCUPIED && occupied_adj >= 4
            FREE
          else
            seat
          end
        end
      end
    end

    def occupied_adjacent(seatmap, col, row)
      rows = [0, row - 1].max..[(row + 1), seatmap.size - 1].min
      cols = [0, col - 1].max..[(col + 1), seatmap.first.size - 1].min

      rows.sum do |y|
        cols.sum do |x|
          next 0 if x == col && y == row

          seatmap[y][x] == OCCUPIED ? 1 : 0
        end
      end
    end
  end
end
