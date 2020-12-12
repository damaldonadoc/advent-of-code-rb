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

    def part2(input)
      stable_seatmap(
        input.split("\n").map { |line| line.split('') },
        :occupied_directions,
        5
      ).flatten.count(OCCUPIED)
    end

    private

    def stable_seatmap(seatmap,
                       occupied_method = :occupied_adjacent,
                       vacate_rate = 4)

      new_seatmap = exec_round(seatmap, occupied_method, vacate_rate)

      return new_seatmap if new_seatmap == seatmap

      stable_seatmap(new_seatmap, occupied_method, vacate_rate)
    end

    def exec_round(seatmap, occupied_method, vacate_rate)
      seatmap.each_with_index.map do |row, y|
        row.each_with_index.map do |seat, x|
          next seat if seat == '.'

          occupied = send(occupied_method, seatmap, x, y)

          if seat == FREE && occupied.zero?
            OCCUPIED
          elsif seat == OCCUPIED && occupied >= vacate_rate
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

    def occupied_directions(seatmap, col, row)
      directions = [
        [-1, -1], [-1, 0], [-1, 1],
        [0, -1], [0, 1],
        [1, -1], [1, 0], [1, 1]
      ]

      directions.sum do |dx, dy|
        any_occupied_in_direction?(seatmap, col, row, dx, dy) ? 1 : 0
      end
    end

    def any_occupied_in_direction?(seatmap, col, row, dx, dy)
      loop do
        col += dx
        row += dy

        if col == -1 || row == -1 ||
           col == seatmap.first.size || row == seatmap.size
          return false
        end

        return true if seatmap[row][col] == OCCUPIED
        return false if seatmap[row][col] == FREE
      end
    end
  end
end
