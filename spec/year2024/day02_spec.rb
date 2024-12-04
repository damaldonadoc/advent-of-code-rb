require 'spec_helper'

RSpec.describe Year2024::Day02 do
  it 'solves part1' do
    d = Year2024::Day02.new
    input = <<~TXT
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    TXT

    expect(d.part1(input)).to eq(2)
  end

  it 'solves part2' do
    d = Year2024::Day02.new
    input = <<~TXT
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    TXT

    expect(d.part2(input)).to eq(4)
  end
end
