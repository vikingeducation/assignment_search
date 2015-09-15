# tree builder

Square = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  attr_accessor :root, :max_depth, :num_nodes

  def initialize(root_coord, max_depth)
    x = root_coord[0]
    y = root_coord[1]
    @max_depth = max_depth
    @num_nodes = 1
    @root = Square.new(x, y, 0, nil, nil)
    @root.children = possible_moves(@root)
    
  end

  def possible_moves(square)
    #need to work out recursion sol
    return if square.depth == max_depth

    x = square.x
    y = square.y

    moves = []
    test_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
    test_moves.each do |move|
      m = move[0]
      n = move[1]

      #sq = Square.new(x+m, y+n, 0, 0)
      if x+m >= 0 && x+m < 8 && y+n >= 0 && y+n < 8
        #recursion sol
        sq = Square.new(x+m, y+n, square.depth+1, nil, square)
        sq.children = possible_moves(sq)
        moves << sq
        @num_nodes += 1
      end
    end

    moves
  end

  def inspect
    puts "Your tree has #{@num_nodes} nodes and a maximum depth of #{@max_depth}"

    #puts @root.inspect
  end
end

t = MoveTree.new([1,1], 2)
t.inspect
puts t.root