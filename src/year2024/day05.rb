# frozen_string_literal: true

module Year2024
  class Day05
    def part1(input)
      sections = input.split("\n\n")

      rule_map = build_rule_map(sections[0])
      updates = parse_updates(sections[1])
      valid_updates = updates.select { |update| valid_update?(update, rule_map) }

      valid_updates.sum { |update| update[update.size / 2] }
    end

    def part2(input)
      sections = input.split("\n\n")

      rule_map = build_rule_map(sections[0])
      updates = parse_updates(sections[1])
      invalid_updates = updates.reject { |update| valid_update?(update, rule_map) }
      corrected_updates = invalid_updates.map { |update| topological_sort(build_graph(update, rule_map)) }

      corrected_updates.sum { |update| update[update.size / 2] }
    end

    private

    def build_rule_map(rules)
      rules.lines.each_with_object(Hash.new { |h, k| h[k] = [] }) do |line, map|
        a, b = line.strip.split('|').map(&:to_i)
        map[a] << b
      end
    end

    def parse_updates(updates)
      updates.lines.map { |line| line.strip.split(',').map(&:to_i) }
    end

    def valid_update?(update, rule_map)
      positions = update.each_with_index.to_h
      update.all? { |page| rule_map[page].all? { |dep| !positions.key?(dep) || positions[page] < positions[dep] } }
    end

    def build_graph(update, rule_map)
      positions = update.each_with_index.to_h
      update.each_with_object(Hash.new { |h, k| h[k] = [] }) do |page, graph|
        rule_map[page].each { |dep| graph[page] << dep if positions.key?(dep) }
      end
    end

    def topological_sort(graph)
      in_degree = graph.each_value.with_object(Hash.new(0)) do |deps, counts|
        deps.each { |node| counts[node] += 1 }
      end

      zero_in_degree = graph.keys - in_degree.keys
      sorted = []

      until zero_in_degree.empty?
        sorted << (current = zero_in_degree.pop)
        graph[current].each { |dep| zero_in_degree << dep if (in_degree[dep] -= 1).zero? }
      end

      sorted
    end
  end
end
