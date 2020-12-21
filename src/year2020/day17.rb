# frozen_string_literal: true

module Year2020
  class Day17
    ACTIVE = '#'
    INACTIVE = '.'

    def part1(input)
      x, y, z = min_point = [-1, -1, 0]
      layout = initialize_layout(input, min_point)
      layout.default = INACTIVE

      size = input.lines.size
      x, y, z = -size, -size, -1

      1.upto(6) do
        layout = run_cycle(layout, [x, y, z])
        x -= 1
        y -= 1
        z -= 1
      end

      layout.count { |_k, v| v == ACTIVE }
    end

    def part2(_input)
      nil
    end

    private

    def initialize_layout(input, initial_point)
      x, y, z = initial_point

      input.each_line(chomp: true).with_object({}) do |line, layout|
        line.chars.each do |char|
          layout[[x, y, z]] = char
          x += 1
        end

        x = initial_point[0]
        y += 1
      end
    end

    def run_cycle(layout, starting_point)
      x, y, z = starting_point
      new_layout = layout.dup

      z.upto(-z) do |z_index|
        y.upto(-y) do |y_index|
          x.upto(-x) do |x_index|
            active_cubes = active_neighbors(layout, [x_index, y_index, z_index])

            new_layout[[x_index, y_index, z_index]] =
              if layout[[x_index, y_index, z_index]] == ACTIVE &&
                 [2, 3].include?(active_cubes)
                ACTIVE
              elsif layout[[x_index, y_index, z_index]] == INACTIVE &&
                    active_cubes == 3
                ACTIVE
              else
                INACTIVE
              end
          end
        end
      end

      new_layout
    end

    def active_neighbors(layout, point, max = 4)
      x, y, z = point
      active = 0

      (z - 1).upto(z + 1) do |z_index|
        (y - 1).upto(y + 1) do |y_index|
          (x - 1).upto(x + 1) do |x_index|
            next if point == [x_index, y_index, z_index]

            active += 1 if layout[[x_index, y_index, z_index]] == ACTIVE

            return active if active == max
          end
        end
      end

      active
    end

    def print_layout(layout)
      keys = layout.keys.sort
      min_x, min_y, min_z = keys.first
      max_x, max_y, max_z = keys.last

      min_z.upto(max_z) do |z|
        puts "\nz=#{z}"
        min_y.upto(max_y) do |y|
          min_x.upto(max_x) do |x|
            print layout[[x, y, z]]
          end
          puts "\n"
        end
      end
    end
  end
end
