Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  attr_reader :root
  DELTA = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [1,-2], [2,-1]]

  attr_reader :start
  def initialize(coords, max_depth)
    @start = coords
    @max_depth = max_depth
    @root = Move.new(@start[0], @start[1], 0, [], nil)
    generate_moves(@root)
  end

  def generate_moves(current_move)
    DELTA.each do |step|
      new_pos = [current_move.x + step[0], current_move.y + step[1]]
      #puts new_pos.inspect
      #puts valid_coord?(new_pos)
      if valid_coord?(new_pos)
        new_move = Move.new(new_pos[0], new_pos[1], current_move.depth + 1, [], current_move)
        current_move.children << new_move
      end
    end
  end

  def valid_coord?(new_pos)
    (0..7) === new_pos[0] && (0..7) === new_pos[1]
  end
end

tree = MoveTree.new([3,3], 1)
#p tree.root
