require_relative 'move_tree.rb'
require_relative 'knight_searcher.rb'

tree = MoveTree.new([3,3], 3)
searcher = KnightSearcher.new(tree)

bfs_start = Time.now
1_000.times do |round|
  searcher.bfs_for([4,7])
end
puts "It took #{(Time.now - bfs_start)}ms to do a thousand BFS searches."

dfs_start = Time.now
1_000.times do |round|
  searcher.dfs_for([4,7])
end
puts "It took #{(Time.now - dfs_start)}ms to do a thousand DFS searches."
