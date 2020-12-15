# frozen_string_literal: true

module Year2020
  class Day13
    def part1(input)
      earliest_timestamp = input.split.first.to_i
      bus_ids = input.split.last.split(',').map(&:to_i).reject(&:zero?)

      departs = bus_ids.each_with_object({}) do |bus_id, dep|
        dep[bus_id] = earliest_timestamp.fdiv(bus_id).ceil * bus_id
      end

      bus_id, bus_depart = departs.min_by { |_k, v| v }

      (bus_depart - earliest_timestamp) * bus_id
    end

    def part2(input)
      bus_ids = input.split.last.split(',').map(&:to_i)

      bus_ids.each_with_index.reduce([1, 1]) do |(timestamp, lcm), (bus_id, index)|
        next [timestamp, lcm] if bus_id.zero?

        loop do
          if ((timestamp + index) % bus_id).zero?
            lcm *= bus_id
            break
          end

          timestamp += lcm
        end

        [timestamp, lcm]
      end.first
    end
  end
end
