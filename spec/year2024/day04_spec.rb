# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day04 do
  it 'solves part1' do
    d = Year2024::Day04.new
    input = <<~TXT
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
    TXT

    expect(d.part1(input)).to eq(18)
  end

  it 'solves part2' do
    d = Year2024::Day04.new
    input = <<~TXT
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
    TXT

    expect(d.part2(input)).to eq(9)
  end
end
