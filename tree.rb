require 'pry'


Move = Struct.new( :x, :y, :depth, :children, :parent )

class Tree

	attr_reader :coords, :max_depth

	def initialize( coords, max_depth )

		@start = Move.new( coords[0], coords[1], 0, [], nil )
		@max_depth = 1

		@depth = 0

	end


	def create_moves

		# establish our current node
		current_position = @start
		# we then determine the possible moves from this position
		moves = possible_moves( current_position )
		@depth += 1


		# for each possible move
		moves.each do | coord |


			if valid_move?( coord )
			# we create a node who's parent is the current node
				new_node = Move.new( coord[ 0 ], coord[ 1 ], @depth, [], current_position )

				binding.pry
				current_position.children << new_node
				current_position = new_node

			else

				return

			end

		end

	end


	def possible_moves( current_position )


		x = current_position.x
		y = current_position.y

		arr = [
						[ x + 2, y - 1 ], [ x + 2, y + 1 ],
						[ x + 1, y - 2 ], [ x - 1, y - 2 ],
						[ x - 2, y + 1 ], [ x - 2, y - 1 ],
						[ x - 1, y + 2 ], [ x + 1, y + 2 ]
					]

		return arr

	end


	def valid_move?( coord )

		return true if ( 0..7 ) === coord[ 0 ] &&
									 ( 0..7 ) === coord[ 1 ]

	end


	def print_tree

		#current_node = @start

	end


end

tree = Tree.new( [3,3], 1 )


tree.create_moves


print tree.inspect


#tree.print_tree