# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day06 do
  it 'solves part1' do
    d = Year2022::Day06.new

    expect(d.part1('mjqjpqmgbljsphdztnvjfqwrcgsmlb')).to eq(7)
    expect(d.part1('bvwbjplbgvbhsrlpgdmjqwftvncz')).to eq(5)
    expect(d.part1('nppdvjthqldpwncqszvftbrmjlhg')).to eq(6)
    expect(d.part1('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')).to eq(10)
    expect(d.part1('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')).to eq(11)
  end

  it 'solves part2' do
    d = Year2022::Day06.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
