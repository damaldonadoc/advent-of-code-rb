# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day13 do
  it 'solves part1' do
    d = Year2022::Day13.new

    # edge case
    input = <<~TXT
      [[[3],7,1]]
      [[3,1,2]]
    TXT

    expect(d.part1(input)).to eq(0)

    input = <<~TXT
      [1,1,3,1,1]
      [1,1,5,1,1]

      [[1],[2,3,4]]
      [[1],4]

      [9]
      [[8,7,6]]

      [[4,4],4,4]
      [[4,4],4,4,4]

      [7,7,7,7]
      [7,7,7]

      []
      [3]

      [[[]]]
      [[]]

      [1,[2,[3,[4,[5,6,7]]]],8,9]
      [1,[2,[3,[4,[5,6,0]]]],8,9]
    TXT

    expect(d.part1(input)).to eq(13)
  end

  it 'solves part2' do
    d = Year2022::Day13.new
    #expect(d.part2('some_input')).to eq(nil)
  end
end
