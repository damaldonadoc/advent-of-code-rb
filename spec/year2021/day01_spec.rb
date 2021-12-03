# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day01 do
  it 'solves part1' do
    d = Year2021::Day01.new
    input = <<~TXT
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    TXT

    expect(d.part1(input)).to eq(7)
  end

  it 'solves part2' do
    d = Year2021::Day01.new
    input = <<~TXT
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    TXT

    expect(d.part2(input)).to eq(5)
  end
end
