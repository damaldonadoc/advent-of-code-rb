# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2020::Day04 do
  it 'solves part1' do
    d = Year2020::Day04.new
    input = <<~TXT
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm

      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929

      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm

      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    TXT

    expect(d.part1(input)).to eq(2)
  end

  it 'solves part2' do
    d = Year2020::Day04.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
