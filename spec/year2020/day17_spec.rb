# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day17 do
  it 'solves part1' do
    d = Year2020::Day17.new
    input = <<~TXT
      .#.
      ..#
      ###
    TXT

    expect(d.part1(input)).to eq(112)
  end

  it 'solves part2' do
    d = Year2020::Day17.new
    input = <<~TXT
      .#.
      ..#
      ###
    TXT

    expect(d.part2(input)).to eq(848)
  end
end
