# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day13 do
  it 'solves part1' do
    d = Year2020::Day13.new
    input = <<~TXT
      939
      7,13,x,x,59,x,31,19
    TXT

    expect(d.part1(input)).to eq(295)
  end

  it 'solves part2' do
    d = Year2020::Day13.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
