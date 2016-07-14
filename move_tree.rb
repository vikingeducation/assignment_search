# knights_travails.rb
require_relative 'knight_searcher'
require "pry"
Move = Struct.new(:x, :y, :depth, :children, :parent)

#tree of moves

#construct a tree of potential moves from a given position using Move
#two inputs:
#coordinate pair x*, y* to represent starting position
#max_depth  depth* to prevent tree from infinite loops
# 8x8 chess board
class MoveTree
  attr_reader :coord, :max_depth, :root

  def initialize(coord, max_depth)
    @root = Move.new(coord[0], coord[1], 0, [], nil)
    @coord = coord #probably won't need this
    @max_depth = max_depth
  end

  def inspect
    p "Your tree has #{something} Move nodes and a maxium depth of #{@max_depth}"
  end

  def build_tree
    holder = [@root]
    depth = @root.depth
    until depth >= max_depth
      depth = holder[0].depth + 1 #depth of child
      holder.each do |holder_move|
        # iterates to add all possible moves
        possible_moves([holder_move.x, holder_move.y]).each do |arr|
          arr.each_slice(2) do |x,y|
            # binding.pry
            holder_move.children << Move.new(x, y, depth, [], holder) if valid_move?(x, y)
          end
        end
      holder = holder[0].children
      end
    end
  end

  def valid_move?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

  def possible_moves(parent_coord)
    x = parent_coord[0]
    y = parent_coord[1]
    [[x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y-1],
    [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
  end
end

m = MoveTree.new([0,0],2)
m.build_tree
m.root
