require_relative 'knight'
require_relative 'move_tree'
require_relative 'knight_searcher'

include KnightsTravails

mt = MoveTree.new([0, 0], 6)
ks = KnightSearcher.new(mt)
puts
print ks.dfs_for([1,2])
puts
