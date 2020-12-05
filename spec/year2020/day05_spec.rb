# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day05 do
  it 'returns the seat row number for a given code' do
    d = Year2020::Day05.new

    expect(d.row('BFFFBBFRRR')).to eq(70)
    expect(d.row('FFFBBBFRRR')).to eq(14)
    expect(d.row('BBFFBBFRLL')).to eq(102)
  end

  it 'returns the seat column number for a given code' do
    d = Year2020::Day05.new

    expect(d.column('BFFFBBFRRR')).to eq(7)
    expect(d.column('FFFBBBFRRR')).to eq(7)
    expect(d.column('BBFFBBFRLL')).to eq(4)
  end

  it 'solves part1' do
    d = Year2020::Day05.new
    input = <<~TXT
      BFFFBBFRRR
      FFFBBBFRRR
      BBFFBBFRLL
    TXT

    expect(d.part1(input)).to eq(820)
  end

  it 'solves part2' do
    d = Year2020::Day05.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
