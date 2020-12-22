# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day18 do
  it 'eval expressions with the equal operator precedence' do
    d = Year2020::Day18.new

    expect(d.eval_expression('2*3+(4*5)')).to eq('26')
    expect(d.eval_expression('5+(8*3+9+3*4*3)')).to eq('437')
    expect(d.eval_expression('5*9*(7*3*3+9*3+(8+6*4))')).to eq('12240')
    expect(d.eval_expression('((2+4*9)*(6+9*8+6)+6)+2+4*2')).to eq('13632')
  end

  it 'solves part1' do
    d = Year2020::Day18.new
    input = <<~TXT
      2 * 3 + (4 * 5)
      5 + (8 * 3 + 9 + 3 * 4 * 3)
      5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))
      ((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2
    TXT

    expect(d.part1(input)).to eq(26_335)
  end

  it 'solves part2' do
    d = Year2020::Day18.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
