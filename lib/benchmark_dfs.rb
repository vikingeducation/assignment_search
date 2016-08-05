require 'yaml'
require 'benchmark'
require_relative 'dfs.rb'

class TestClass
  def read_data
    data = YAML::load(File.open('100k.txt', 'r'))
  end

  def test
    tree = KnightSearcher.new(MoveTree.new([3, 3], 4))
    data = read_data
    test_time = Benchmark.measure do
      data.each do |coord|
        tree.dfs_for coord
      end
    end
    puts test_time
  end

end

new_test = TestClass.new
new_test.test
