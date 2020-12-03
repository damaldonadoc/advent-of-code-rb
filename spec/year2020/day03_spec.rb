# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day03 do
  it 'solves part1' do
    d = Year2020::Day03.new
    input = <<~TXT
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    TXT

    expect(d.part1(input)).to eq(7)
  end

  it 'solves part2' do
    d = Year2020::Day03.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
