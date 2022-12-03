# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day01 do
  it 'solves part1' do
    d = Year2022::Day01.new
    input = <<~TXT
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    TXT

    expect(d.part1(input)).to eq(24_000)
  end

  it 'solves part2' do
    d = Year2022::Day01.new
    input = <<~TXT
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    TXT

    expect(d.part2(input)).to eq(45_000)
  end
end
