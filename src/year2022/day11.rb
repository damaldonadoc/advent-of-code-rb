# frozen_string_literal: true

require 'YAML'

module Year2022
  class Day11
    def part1(input)
      monkeys = input.split("\n\n").map do |monkey_def|
        Monkey.new(monkey_def)
      end

      (1..20).each do |_turn|
        monkeys.each do |monkey|
          monkey.throws_from_turn.each do |throw_action|
            target_monkey = monkeys.find { |tm| tm.id == throw_action[:target_monkey] }

            target_monkey.starting_items.append(throw_action[:item])

            monkey.starting_items.delete(throw_action[:item])
          end

          monkey.throw_list = []
        end
      end

      monkeys.max_by(2, &:inspect_count).map(&:inspect_count).reduce(&:*)
    end

    def part2(_input)
      nil
    end

    class Monkey
      ATTRIBUTES = %i[id starting_items operation test if_true if_false].freeze
      attr_reader :id, :inspect_count
      attr_accessor :starting_items, :throw_list

      def initialize(yaml_like_string)
        hash = parse_yaml_like_string(yaml_like_string)
        ATTRIBUTES.each { |attr| instance_variable_set("@#{attr}", hash[attr]) }

        @throw_list = []
        @inspect_count = 0
      end

      def throws_from_turn
        # inspect item and process relief
        @starting_items.map! { |item| inspect_item(item) / 3 }

        @starting_items.each { |item| queue_item_to_throw(item) }

        @throw_list
      end

      private

      def inspect_item(old)
        @inspect_count += 1

        eval(@operation)
      end

      def queue_item_to_throw(item)
        factor = @test.split.last.to_i

        target_monkey = ((item % factor).zero? ? @if_true : @if_false).split.last.to_i

        @throw_list.append({ item:, target_monkey: })
      end

      def parse_yaml_like_string(string)
        hash = YAML.load(string.gsub('  ', ''))

        hash.each_with_object({}) do |(key, value), new_hash|
          if key.start_with?('Monkey')
            new_hash[:id] = key.split.last.to_i
          else
            new_key = key.downcase.gsub(' ', '_').to_sym

            new_hash[new_key] = new_key == :starting_items ? value.to_s.split(',').map(&:to_i) : value
          end
        end
      end
    end
  end
end
