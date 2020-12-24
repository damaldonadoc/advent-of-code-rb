# frozen_string_literal: true

module Year2020
  class Day20
    def part1(input)
      tiles = input.split("\n\n").each_with_object({}) do |tile, acc|
        acc.merge!(format_tile(tile))
      end

      layout = Hash.new { |hash, key| hash[key] = [] }

      tiles.keys.combination(2) do |tile_id1, tile_id2|
        next unless matching_edges?(tiles[tile_id1], tiles[tile_id2])

        layout[tile_id1].push(tile_id2)
        layout[tile_id2].push(tile_id1)
      end

      layout.keys.select { |tile_id| layout[tile_id].count == 2 }
            .map(&:to_i).reduce(:*)
    end

    def part2(_input)
      nil
    end

    private

    def format_tile(tile_str)
      tile_id = tile_str.lines[0].scan(/\d+/).first

      { tile_id => tile_str.lines[1..].map { |l| l.chomp.chars } }
    end

    def tile_edges(tile)
      {
        top: tile.first,
        bottom: tile.last,
        left: tile.map(&:first),
        right: tile.map(&:last)
      }
    end

    def matching_edges?(tile1, tile2)
      t1_edges = tile_edges(tile1)
      t2_edges = tile_edges(tile2)

      (t1_edges.values & (t2_edges.values + t2_edges.values.map(&:reverse))).any?
    end
  end
end
