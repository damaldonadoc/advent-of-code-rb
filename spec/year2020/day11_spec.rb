# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day11 do
  it 'solves part1' do
    d = Year2020::Day11.new
    input = <<~TXT
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    TXT

    expect(d.part1(input)).to eq(37)
  end

  it 'solves part2' do
    d = Year2020::Day11.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
