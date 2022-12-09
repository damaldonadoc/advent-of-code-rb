# frozen_string_literal: true

module Year2022
  class Day08
    def part1(input)
      grid = input.lines.map { |line| line.strip.chars.map(&:to_i) }

      width = grid.first.count
      height = grid.count

      visible_trees = (width * 2) + ((height - 2) * 2)

      (1...(height - 1)).each do |y|
        (1...(width - 1)).each do |x|
          visible_trees += 1 if visible?(grid, width, height, x, y)
        end
      end

      visible_trees
    end

    def part2(_input)
      nil
    end

    private

    def visible?(grid, height, width, *coordinates)
      x, y = coordinates
      target_tree = grid[y][x]

      # visible up or visible down or visible left or visible right
      (0..(y - 1)).none? { |delta_y| target_tree <= grid[delta_y][x] } ||
        ((y + 1)...height).none? { |delta_y| target_tree <= grid[delta_y][x] } ||
        (0..(x - 1)).none? { |delta_x| target_tree <= grid[y][delta_x] } ||
        ((x + 1)...width).none? { |delta_x| target_tree <= grid[y][delta_x] }
    end
  end
end
