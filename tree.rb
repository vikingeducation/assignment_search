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

		moves = possible_moves( current_position )
		@depth += 1





			moves.each do | coord |


				if valid_move?( coord )

					new_node = Move.new( coord[ 0 ], coord[ 1 ], @depth, [], current_position )


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