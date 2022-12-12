# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day12 do
  it 'solves part1' do
    d = Year2022::Day12.new
    input = <<~TXT
      Sabqponm
      abcryxxl
      accszExk
      acctuvwj
      abdefghi
    TXT

    expect(d.part1(input)).to eq(31)
  end

  it 'solves part2' do
    d = Year2022::Day12.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
