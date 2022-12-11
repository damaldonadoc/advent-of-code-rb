# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day11 do
  context "Monkey class plays turn" do
    describe 'Monkey#throws_from_turn' do
      it 'returns the correct throw list' do
        monkey_def = <<~TXT
          Monkey 0:
            Starting items: 79, 98
            Operation: new = old * 19
            Test: divisible by 23
              If true: throw to monkey 2
              If false: throw to monkey 3
        TXT

        monkey = Year2022::Day11::Monkey.new(monkey_def)

        expect(monkey.throws_from_turn).to(
          eq(
            [
              { target_monkey: 3, item: 500 },
              { target_monkey: 3, item: 620 }
            ]
          )
        )
      end
    end
  end

  it 'solves part1' do
    d = Year2022::Day11.new
    input = <<~TXT
      Monkey 0:
        Starting items: 79, 98
        Operation: new = old * 19
        Test: divisible by 23
          If true: throw to monkey 2
          If false: throw to monkey 3

      Monkey 1:
        Starting items: 54, 65, 75, 74
        Operation: new = old + 6
        Test: divisible by 19
          If true: throw to monkey 2
          If false: throw to monkey 0

      Monkey 2:
        Starting items: 79, 60, 97
        Operation: new = old * old
        Test: divisible by 13
          If true: throw to monkey 1
          If false: throw to monkey 3

      Monkey 3:
        Starting items: 74
        Operation: new = old + 3
        Test: divisible by 17
          If true: throw to monkey 0
          If false: throw to monkey 1
    TXT

    expect(d.part1(input)).to eq(10_605)
  end

  it 'solves part2' do
    d = Year2022::Day11.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
