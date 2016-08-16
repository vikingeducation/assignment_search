require 'pry'


Move = Struct.new( :x, :y, :depth, :children, :parent )

class Tree

	attr_reader :coords, :max_depth, :start

	def initialize( coords, max_depth )

		@start = Move.new( coords[0], coords[1], 0, [], nil )
		@max_depth = max_depth

		create_moves( @start )

binding.pry
	end


	def create_moves( node )

		current_move = node

		queue = []


		until current_move.depth > @max_depth

    # start with the root node set as current position
		# find all the possible moves for the current position


		moves = possible_moves( node )
		#while the depth is less than what's set

			# go through each possible move
			moves.each do | coord |

				# check if the move is valid
				if valid_move?( coord )

					# if it is, we make a new Node setting the coordinates as the parent of the current node
					new_node = Move.new( coord[ 0 ], coord[ 1 ], @depth += 1, [], node )

					# we then add the new_node as a child of the current node
					current_move.children << new_node
					queue += current_move.children
					current_move = queue.shift



				else

					return

				end

			end #/.moves.each


		end #/.while loop


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

		@start.children.each do |x|

			puts x.parent

		end

	end


end



