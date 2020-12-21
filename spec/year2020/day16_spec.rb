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

  it 'returns the fields with the right order' do
    d = Year2020::Day16.new
    input = <<~TXT
      class: 0-1 or 4-19
      row: 0-5 or 8-19
      seat: 0-13 or 16-19

      your ticket:
      11,12,13

      nearby tickets:
      3,9,18
      15,1,5
      5,14,9
    TXT

    expect(d.sorted_fields(input)).to(
      eq(
        {
          0 => ['row'],
          1 => ['class'],
          2 => ['seat']
        }
      )
    )
  end
end
