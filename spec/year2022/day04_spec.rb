# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day04 do
  it 'solves part1' do
    d = Year2022::Day04.new
    input = <<~TXT
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    TXT

    expect(d.part1(input)).to eq(2)
  end

  it 'solves part2' do
    d = Year2022::Day04.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
