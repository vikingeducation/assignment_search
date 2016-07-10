require 'benchmark'
require 'bigdecimal/math'
require_relative 'move_tree.rb'
require_relative 'knight_searcher.rb'

require 'benchmark'

def random_square
  arr = []
  arr << rand(8)
  arr << rand(8)
end

iterations = 1000
puts "Benchmarking BFS and DFS for random squares starting from 0.0. iterations : #{iterations}"
Benchmark.bm do |bm|
  random_sq = []
  iterations.times { random_sq << random_square }
  searcher = KnightSearcher.new(MoveTree.new([0,0], 6))
  bm.report do
    iterations.times do |i|
       Benchmark.measure { searcher.bfs_for(random_sq[i], false) }
    end
  end

  bm.report do
    iterations.times do |i|
      Benchmark.measure { searcher.dfs_for(random_sq[i], false) }
    end
  end
end

# Benchmarking BFS and DFS for random squares starting from 0.0. iterations : 1000
#        user     system      total        real
#    4.600000   0.090000   4.690000 (  4.760608)
#    0.070000   0.010000   0.080000 (  0.070378)

# Benchmarking BFS and DFS for random squares starting from 0.0. iterations : 10_000
#        user     system      total        real
#   46.990000   1.020000  48.010000 ( 49.426908)
#    0.780000   0.010000   0.790000 (  0.802579)

# DFS is much faster for 1000, 10_000 iterations of same random target squares