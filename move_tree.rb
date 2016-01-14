Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  MOVE_PAIRS = [ [1, 2],[2, 1], [2, -1],
                 [1,-2],[-1,-2],[-2,-1],
                 [-2,1],[-1,2]
               ]

  attr_reader :start

	def initialize(coord_pair, max_depth = 1)
    x, y = coord_pair
    @start = Move.new(x, y, 0, [], nil)
		@coord_pair = coord_pair
		@max_depth = max_depth
    @board_size = 8
    @count = 1
	end

  def build_tree
    stack = []
    stack << @start
    while move = stack.pop
      move.children = make_children(move)
      move.children.each do |next_move|
        stack << next_move unless next_move.depth == @max_depth
      end
    end
  end

  def make_children(move)
    depth = move.depth + 1
    possible_moves(move).map do |x, y|
      @count += 1  
      Move.new(x, y, depth, [], move)
    end
  end

  def possible_moves(move)
    MOVE_PAIRS.map do |x, y|
      new_x = move.x + x
      new_y = move.y + y
      [new_x, new_y] unless off_board?(new_x, new_y)
    end.compact
  end

  def off_board?(x, y)
    x >=@board_size || y >= @board_size || x < 0 || y < 0
  end

	def inspect
		puts "Your tree has #{@count} Move nodes and a maximum depth of #{@max_depth}"
	end
end


# tree = MoveTree.new([3,3], 2)
# tree.build_tree

# p tree
# >> Your tree has 65 Move nodes and a maximum depth of 2
# >> 
