# frozen_string_literal: true

module Year2022
  class Day07
    DELETABLE_SIZE = 100_000

    def part1(input)
      directory_tree = build_directory_tree(input)

      calc_directory_size!(directory_tree, '/')

      directories = deletable_directories(directory_tree, '/', DELETABLE_SIZE)

      directories.map(&:values).flatten.sum
    end

    def part2(_input)
      nil
    end

    private

    def build_directory_tree(terminal_output)
      dir_stack = []
      grouped_commands = terminal_output.split('$').map { |x| x.chomp.split("\n") }

      initial_dir_map = { '/' => { type: :dir, size: 0 } }

      grouped_commands.each_with_object(initial_dir_map) do |command_group, dir_map|
        command, *output = command_group

        case command&.strip
        when 'cd ..'
          dir_stack.pop
        when /cd/
          _, current_dir = command.split
          dir_stack.append(current_dir)
        when 'ls'
          content = output.each_with_object({}) do |x, acc|
            size, filename = x.split

            is_dir = size == 'dir'

            acc[filename] = {
              size: size.to_i,
              type: is_dir ? :dir : :file
            }
          end

          dir_map.dig(*dir_stack).merge!(content)
        end
      end
    end

    def calc_directory_size!(dir_map, path)
      node = dir_map[path]

      child_paths = node.keys.reject { |key| %i[size type].include?(key) }

      dir_map[path][:size] +=
        child_paths.sum do |child_path|
          calc_directory_size!(node, child_path)
        end
    end

    def deletable_directories(dir_map, path, max_deletable_size, directories = [])
      node = dir_map[path]

      child_keys = node.select { |_, val| val.is_a?(Hash) && val[:type] == :dir }.keys

      directories.union(
        child_keys.map do |child_key|
          deletable_directories(node, child_key, max_deletable_size, directories)
        end
      )

      node[:size] <= max_deletable_size ? directories.push({ path => node[:size] }) : directories
    end
  end
end
