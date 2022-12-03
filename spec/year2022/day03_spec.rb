# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day03 do
  it 'solves part1' do
    d = Year2022::Day03.new
    input = <<~TXT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    TXT

    expect(d.part1(input)).to eq(157)
  end

  it 'solves part2' do
    d = Year2022::Day03.new
    input = <<~TXT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    TXT

    expect(d.part2(input)).to eq(70)
  end
end
