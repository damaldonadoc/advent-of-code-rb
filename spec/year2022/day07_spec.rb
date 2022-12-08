# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day07 do
  it 'solves part1' do
    d = Year2022::Day07.new
    input = <<~TXT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    TXT

    expect(d.part1(input)).to eq(95_437)
  end

  it 'solves part2' do
    d = Year2022::Day07.new
    input = <<~TXT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    TXT

    expect(d.part2(input)).to eq(24_933_642)
  end
end
