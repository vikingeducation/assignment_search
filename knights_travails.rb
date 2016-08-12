# determine the # of moves to get knight from one position to the next

require_relative 'knight'
require_relative 'board'
require_relative 'tree'

require 'pry'

# Root node is the starting position
# Each child of the root is then all squares fanning out from that Root



class KnightsTravail


	def initialize( start, target )

		@tree = Tree.new( start )
		@target = target

	end


# the root has potentially 8 paths if not on an edge
	# each move would have to be checked for being within the Board's boundaries
# with each move, the square should be marked to prevent a cycle

# Board as 8x8 2D Array
# move is [ [0,0] [1,3] ]
# Knight will be a class
	# houses moves he can make
# Board as a class
# Binary Tree
# BFS - for shortest solution

# starting with the root node
# we take that node and place it into a queue
# we then check the possible moves the knight can make from that position
# if the move is within boundaries
	# we add that node to the queue
# if out of bounds we move to the next possible move
	# as long as the move is not equal to the last square
# once a move is Dequeued, we mark if with a MOVED item to indicate already checked and issue a return statement

end


game = KnightsTravail.new( [3,4], [6,7] )