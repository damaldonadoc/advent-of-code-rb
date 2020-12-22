# frozen_string_literal: true

module Year2020
  class Day17
    ACTIVE = '#'

    def part1(input)
      # get initial active points and add 3rd dimension
      active = initially_active(input).map { |point| point.push(0) }.to_set

      6.times do
        active = run_cycle(active)
      end

      active.count
    end

    def part2(input)
      # get initial active points and add 3rd and 4th dimensions
      active = initially_active(input).each { |point| point.push(0, 0) }.to_set

      6.times do
        active = run_cycle(active, 4)
      end

      active.count
    end

    private

    def initially_active(input)
      input.each_line(chomp: true)
           .with_object([]).with_index do |(line, active), y|
        line.chars.each_with_index do |char, x|
          active << [x, y] if char == ACTIVE
        end
      end
    end

    def run_cycle(prev_active, dimensions = 3)
      surrounding =
        prev_active.each_with_object(prev_active.dup) do |active_point, acc|
          [-1, 0, 1].repeated_permutation(dimensions).each do |direction|
            acc.add(active_point.zip(direction).map(&:sum))
          end
        end

      surrounding.each_with_object(Set.new) do |point, acc|
        active_neighbors = count_active_neighbors(prev_active, point, dimensions)

        if ([2, 3].include?(active_neighbors) && prev_active.include?(point)) ||
           (active_neighbors == 3 && !prev_active.include?(point))
          acc.add(point)
        end
      end
    end

    def count_active_neighbors(active_points, point, dimensions, max = 4)
      [-1, 0, 1].repeated_permutation(dimensions).reduce(0) do |acc, offset|
        neighbor = point.zip(offset).map(&:sum)

        next acc if point == neighbor

        acc += 1 if active_points.include?(neighbor)
        return acc if acc == max

        acc
      end
    end
  end
end
