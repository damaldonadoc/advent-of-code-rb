# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day01 do
  it 'solves part1' do
    d = Year2024::Day01.new
    input = <<~TXT
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
    TXT

    expect(d.part1(input)).to eq(11)
  end

  it 'solves part2' do
    d = Year2024::Day01.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
