# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day09 do
  it 'solves part1' do
    d = Year2022::Day09.new
    input = <<~TXT
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    TXT

    expect(d.part1(input)).to eq(13)
  end

  it 'solves part2' do
    d = Year2022::Day09.new
    input = <<~TXT
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    TXT

    expect(d.part2(input)).to eq(1)

    input = <<~TXT
      R 5
      U 8
      L 8
      D 3
      R 17
      D 10
      L 25
      U 20
    TXT

    expect(d.part2(input)).to eq(36)
  end
end
