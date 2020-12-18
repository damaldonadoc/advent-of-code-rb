# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day15 do
  it 'solves part1' do
    d = Year2020::Day15.new
    input = '0,3,6'

    expect(d.part1(input)).to eq(436)
  end

  it 'solves part2' do
    d = Year2020::Day15.new
    expect(d.part2('0,3,6')).to eq(175_594)
  end
end
