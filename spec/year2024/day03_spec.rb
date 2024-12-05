# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2024::Day03 do
  it 'solves part1' do
    d = Year2024::Day03.new
    input = 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'

    expect(d.part1(input)).to eq(161)
  end

  it 'solves part2' do
    d = Year2024::Day03.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
