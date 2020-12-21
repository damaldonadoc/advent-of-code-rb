# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day16 do
  it 'solves part1' do
    d = Year2020::Day16.new
    input = <<~TXT
      class: 1-3 or 5-7
      row: 6-11 or 33-44
      seat: 13-40 or 45-50

      your ticket:
      7,1,14

      nearby tickets:
      7,3,47
      40,4,50
      55,2,20
      38,6,12
    TXT

    expect(d.part1(input)).to eq(71)
  end

  it 'solves part2' do
    d = Year2020::Day16.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
