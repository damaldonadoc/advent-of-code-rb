# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day02 do
  it 'solves part1' do
    d = Year2021::Day02.new
    input = <<~TXT
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    TXT

    expect(d.part1(input)).to eq(150)
  end

  it 'solves part2' do
    d = Year2021::Day02.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
