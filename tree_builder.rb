Square = Struct.new(:x, :y, :depth, :children) #children = array of squares

class MoveTree
  attr_reader :squares

  def initialize(coord = [0,0], max_depth = 1) #constructs a tree
    @squares = []
    @origin = coord
    @board = create_board
    @root = create_root
    @depth = 0
    #create_tree(depth) #loop
  end

  def create_root # no children yet
    Square.new(@origin[0], @origin[1], 0)
  end

  def create_tree(parent, depth)
    level = 0
    parent = @root
    until level == depth
      level +=1
      children.each do |child|
        Square.new(child.x, child.y, level, potential_moves(child[0], child[1], level)
      end
    children = @root.children
    end

  end

  def create_board #creates 8x8 board
    board = Array.new{8}
    board.each do |index|
      board[index] = Array.new(8)
    end
  end

  def potential_moves(origin, level)
    moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,-1], [-2,1]]
    squares = []
    moves.each do |move|
      puts temp = [@coord[0] + move[0],@coord[1]+move[1]]
      if valid_coord(temp)
        squares << Square.new(temp[0],temp[1], level)
      end
    end
    squares
  end

  def inspect
    puts" Your tree has #{@squares.length + 1} nodes and a maximum depth of #{@max_depth}"
  end


  def valid_coord(coord)
    x = coord[0]
    y = coord[1]
    (0..7).include?(x) && (0..7).include?(y)
  end

end