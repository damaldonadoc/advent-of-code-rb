# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day10 do
  it 'solves part1' do
    d = Year2020::Day10.new
    input = <<~TXT
      28
      33
      18
      42
      31
      14
      46
      20
      48
      47
      24
      23
      49
      45
      19
      38
      39
      11
      1
      32
      25
      35
      8
      17
      7
      9
      4
      2
      34
      10
      3
    TXT

    expect(d.part1(input)).to eq(220)
  end

  it 'solves part2' do
    d = Year2020::Day10.new
    input = <<~TXT
      28
      33
      18
      42
      31
      14
      46
      20
      48
      47
      24
      23
      49
      45
      19
      38
      39
      11
      1
      32
      25
      35
      8
      17
      7
      9
      4
      2
      34
      10
      3
    TXT

    expect(d.part2(input)).to eq(19208)
  end
end
