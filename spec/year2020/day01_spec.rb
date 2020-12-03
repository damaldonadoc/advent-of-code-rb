require 'spec_helper'

RSpec.describe Year2020::Day01 do
  it 'solves part1' do
    d = Year2020::Day01.new
    input = <<~TXT
      979
      1721
      366
      299
      675
      1456
    TXT

    expect(d.part1(input)).to eq(514_579)
  end

  it 'solves part2' do
    d = Year2020::Day01.new
    expect(d.part2('')).to eq(nil)
  end
end
