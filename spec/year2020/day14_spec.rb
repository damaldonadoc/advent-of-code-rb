# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day14 do
  it 'solves part1' do
    d = Year2020::Day14.new
    input = <<~TXT
      mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
      mem[8] = 11
      mem[7] = 101
      mem[8] = 0
    TXT

    expect(d.part1(input)).to eq(165)
  end

  it 'solves part2' do
    d = Year2020::Day14.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
