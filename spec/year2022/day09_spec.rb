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
    expect(d.part2('some_input')).to eq(nil)
  end
end
