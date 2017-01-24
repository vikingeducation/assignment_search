# Knight's Travails

# Tests

require_relative 'knight'

include KnightsTravails

move_tree = MoveTree.new([3,3],6)
knight_searcher = KnightSearcher.new(move_tree)
puts
puts knight_searcher.bfs_for([1,2])
puts
puts knight_searcher.bfs_for([7,7])
puts
puts knight_searcher.bfs_for([4,3])
puts

