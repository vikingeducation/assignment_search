require 'pry'


Move = Struct.new( :x, :y, :depth, :children, :parent )

class Tree

	attr_reader :coords, :max_depth, :start

	def initialize( coords, max_depth )

		@start = Move.new( coords[0], coords[1], 0, [], nil )
		@max_depth = max_depth

		create_moves( @start )

	end


	def create_moves( node )

		return if node.depth == @max_depth

		moves = possible_moves( node )


		moves.each do | move |

			node.children[ node.children.length ] = Move.new( move[ 0 ], move[ 1 ], node.depth + 1, [], node )

		end

		node.children.each do | move |

			create_moves( move )

		end


	end


	def possible_moves( current_position )

		moves = within_board?( current_position )

		square = current_position

		until square.parent.nil?

			if [square.parent.x, square.parent.y] === moves

				moves.delete( [ square.parent.x, square.parent.y ] )

			end

			square = square.parent

		end

		return moves

	end


	def within_board?( move )

		x = move[ 0 ]
		y = move[ 1 ]

		moves = []

		arr = [
						[ x + 2, y - 1 ], [ x + 2, y + 1 ],
						[ x + 1, y - 2 ], [ x - 1, y - 2 ],
						[ x - 2, y + 1 ], [ x - 2, y - 1 ],
						[ x - 1, y + 2 ], [ x + 1, y + 2 ]
					]

		arr.each do | coords |


			moves << coords if valid_move?( coords )

		end

		moves

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

tree = Tree.new( [3,5], 2)

tree.print_tree


