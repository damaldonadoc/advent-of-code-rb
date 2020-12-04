# frozen_string_literal: true

module Year2020
  class Day04
    REQUIRED_KEYS = %i[byr ecl eyr hcl hgt iyr pid].freeze

    VALIDATION_RULES = {
      byr: /^(19[2-8][0-9]|199[0-9]|200[0-2])$/,
      iyr: /^(201[0-9]|2020)$/,
      eyr: /^(202[0-9]|2030)$/,
      hgt: /((^(1[5-8][0-9]|19[0-3])cm$)|(^(59|6[0-9]|7[0-6])in$))/,
      hcl: /^#(\d|[a-f]){6}$/,
      ecl: /^(amb|blu|brn|gry|grn|hzl|oth)$/,
      pid: /^\d{9}$/,
      cid: /^?$/
    }.freeze

    def part1(input)
      format_passports(input).sum do |passport|
        required_keys?(passport) ? 1 : 0
      end
    end

    def part2(input)
      format_passports(input).sum do |passport|
        valid_passport?(passport) ? 1 : 0
      end
    end

    private

    def format_passports(input)
      input.split("\n\n").map do |p|
        Hash[p.chomp.scan(/(\w+):+([^\s]+)/)].transform_keys(&:to_sym)
      end
    end

    def required_keys?(passport)
      (REQUIRED_KEYS - passport.keys).empty?
    end

    def valid_passport?(passport)
      return false unless required_keys?(passport)

      passport.all? do |k, v|
        v.match?(VALIDATION_RULES[k])
      end
    end
  end
end
