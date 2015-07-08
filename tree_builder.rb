Square = Struct.new(:x, :y, :depth, :children) #children = array of squares

class MoveTree
  attr_reader :squares, :root
  #attr_writer :children

  def initialize(coord = [0,0], max_depth = 2) #constructs a tree
    @squares = []
    @nodes = 0
    @origin = coord
    @depth = 0
    @board = create_board
    @root = create_root
    @max_depth = 2
    #create_tree(depth) #loop
  end

  def create_root # no children yet
    @nodes +=1
    #@depth +=1
    Square.new(@origin[0], @origin[1], 0)
  end

  def create_tree(level, parent)
    return if level > @max_depth
    parent.children = potential_moves([parent.x, parent.y], level)
    parent.children.each do |child|
      create_tree(level+1, parent)
      # child.children = potential_moves([child.x, child.y], level)
      # Square.new(child.x, child.y, level, potential_moves(child[0], child[1], level))
    end
      # parent.children.each {|c| queue << c} # ARRAY, queue
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
      temp = [origin[0] + move[0], origin[1]+move[1]]
      if valid_coord(temp)
        @nodes += 1
        squares << Square.new(temp[0],temp[1], level)
      end
    end
    squares
  end

  def inspect
    puts" Your tree has #{@nodes} nodes and a maximum depth of #{@depth}"
  end


  def valid_coord(coord)
    x = coord[0]
    y = coord[1]
    (0..7).include?(x) && (0..7).include?(y)
  end

end