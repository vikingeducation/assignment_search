# Knight's Travails Problem
require_relative('knight_searcher.rb')

# First thing is to create the Square struct
Square = Struct.new(:x, :y, :depth, :parent, :children)

# I also want to set some constants for the board
# size information.
BOARD_SIZE = 9 

# Now to construct the MoveTree class
class MoveTree

	attr_reader :head

	def initialize(coords, max_depth)
		@size = BOARD_SIZE
		@head = Square.new(coords[0], coords[1], 0)
		@max_depth = max_depth
		build_children(@head)
	end

	def inspect
		total_nodes = 1 + count_children(@head)
		puts "Your tree has #{total_nodes} nodes with a maximum depth of #{@max_depth}"
	end

	private 

	# Recursively builds children until it reaches the max_depth.
	def build_children(node, parent = nil)
		node.children = get_all_moves(node)
		unless node.depth + 1 == @max_depth
			node.children.each {|child| build_children(child, node)}
		end
	end

	# Returns an array of Square objects that a knight could move to
	# from given coordinates. Increments depth.
	def get_all_moves(node)
		x, y, current_depth = node.x, node.y, node.depth
		verified_moves = []
		all_moves = all_moves_array(x,y)
		all_moves.each {|move| verified_moves << Square.new(move[0], move[1], current_depth+1, node) if on_board?(move)}
		verified_moves
	end

	# Returns TRUE if all of the coordinates fall on the board.
	# Based on BOARD_SIZE
	def on_board?(coords)
		coords.any? {|coord| coord < 1 || coord > @size } ? false : true
	end

	# Returns an array of ALL possible moves a knight could move to
	# from given coordinates. Irrelevant of whether the move is 
	# on the board or not. Brute force.
	def all_moves_array(initial_x, initial_y)
		final = []
		x = initial_x + 2
		final << [x, initial_y+1] << [x, initial_y-1]
		x = initial_x - 2
		final << [x, initial_y+1] << [x, initial_y-1]
		y = initial_y + 2
		final << [initial_x+1, y] << [initial_x-1, y]
		y = initial_y - 2
		final << [initial_x+1, y] << [initial_x-1, y]
		final
	end

	# Recursively gets the number of children of a node
	def count_children(node)
		return 0 if node.children.nil?
		node.children.count + (node.children.map {|child| count_children(child)}).inject(&:+)
	end
end