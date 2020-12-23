# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day19 do
  it 'solves part1' do
    d = Year2020::Day19.new
    input = <<~TXT
      0: 4 1 5
      1: 2 3 | 3 2
      2: 4 4 | 5 5
      3: 4 5 | 5 4
      4: "a"
      5: "b"

      ababbb
      bababa
      abbbab
      aaabbb
      aaaabbb
    TXT

    expect(d.part1(input)).to eq(2)
  end

  it 'solves part2' do
    d = Year2020::Day19.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
