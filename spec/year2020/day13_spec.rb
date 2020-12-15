# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day13 do
  it 'solves part1' do
    d = Year2020::Day13.new
    input = <<~TXT
      939
      7,13,x,x,59,x,31,19
    TXT

    expect(d.part1(input)).to eq(295)
  end

  it 'solves part2' do
    d = Year2020::Day13.new
    input = <<~TXT
      anything
      7,13,x,x,59,x,31,19
    TXT

    expect(d.part2(input)).to eq(1_068_781)

    input = <<~TXT
      anything
      67,7,59,61
    TXT

    expect(d.part2(input)).to eq(754_018)

    input = <<~TXT
      anything
      67,x,7,59,61
    TXT

    expect(d.part2(input)).to eq(779_210)

    input = <<~TXT
      anything
      67,7,x,59,61
    TXT

    expect(d.part2(input)).to eq(1_261_476)

    input = <<~TXT
      anything
      1789,37,47,1889
    TXT

    expect(d.part2(input)).to eq(1_202_161_486)
  end
end
