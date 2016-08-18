Move = Struct.new( :x, :y, :depth, :children, :parent )

class Tree

	attr_reader :coords, :max_depth, :root, :depth

	def initialize( coords, max_depth )

		@root = Move.new( coords[0], coords[1], 0, [], nil )

		@max_depth = max_depth

    @current_node = @root

    @count = 1

		create_moves

	end


	def create_moves

    queue = []

		while @current_node.depth < @max_depth

		  get_children( @current_node )

  		@current_node.children.each do | n |

        queue << n

        @count += 1

  		end

      @current_node = queue.shift

    end

	end




  def add_parent( parent, new_node )

    parent.children << new_node

    new_node.parent = parent

  end



	def get_children( parent )

		moves = within_board?( [ parent.x, parent.y ])

	  moves.each do | coords |

      new_node = Move.new( coords[ 0 ], coords[ 1 ], parent.depth + 1, [], nil )

      add_parent( @current_node, new_node )

    end

    return parent

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


  def inspect

    puts "Tree has #{ @count } Move nodes and a maximun depth of #{@max_depth}"

  end



end


