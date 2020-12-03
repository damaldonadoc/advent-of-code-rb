# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day02 do
  it 'solves part1' do
    d = Year2020::Day02.new
    input = <<~TXT
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    TXT

    expect(d.part1(input)).to eq(2)
  end

  it 'solves part2' do
    d = Year2020::Day02.new
    input = <<~TXT
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    TXT

    expect(d.part2('1-3 a: abcde')).to eq(1)
    expect(d.part2(input)).to eq(1)
  end
end
