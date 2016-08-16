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

		# start with the root node set as current position
		current_position = @start

		# find all the possible moves for the current position
		@depth += 1

		moves = possible_moves( current_position )
		#while the depth is less than what's set

			# go through each possible move
			moves.each do | coord |

				# check if the move is valid
				if valid_move?( coord )

					# if it is, we make a new Node setting the coordinates as the parent of the current node
					new_node = Move.new( coord[ 0 ], coord[ 1 ], @depth, [], current_position )

					# we then add the new_node as a child of the current node
					current_position.children << new_node



				else

					return

				end

			end #/.moves.each

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

		print " There are #{@start.children.count + 1} nodes and a max depth of #{@max_depth}"

	end


end

tree = Tree.new( [3,3], 1 )


tree.create_moves

tree.print_tree