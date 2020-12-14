# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day12 do
  it 'solves part1' do
    d = Year2020::Day12.new
    input = <<~TXT
      F10
      N3
      F7
      R90
      F11
    TXT

    expect(d.part1(input)).to eq(25)
  end

  it 'solves part2' do
    d = Year2020::Day12.new
    input = <<~TXT
      F10
      N3
      F7
      R90
      F11
    TXT

    expect(d.part2(input)).to eq(286)
  end
end
