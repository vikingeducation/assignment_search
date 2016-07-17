Move = Struct.new(:x, :y, :depth, :children, :parents)
#Cell = Struct.new(:x, :y, :empty)

class MoveTree
  attr_reader :root, :tree
  def initialize(coords, max_depth)
    @root = Move.new(coords[0], coords[1], 0, [], [])
    @move_count = 1
    @max_depth = max_depth
     add_moves #array of move structs
  end

  def add_moves
    parent = @root
    depth = 0
    get_children(parent)
    until depth >= @max_depth - 1
      get_children(parent)
      parent.children.each do |child|
        get_children(child)
        depth = child.depth
      end
    end
    parent
    end

  def inspect
    puts "Your tree has #{@move_count} Move nodes and a maximum depth of #{@max_depth}."
  end

  def get_children(parent)
    x_coord = parent.x
    y_coord = parent.y
    x_coord2 = parent.x
    y_coord2 = parent.y

    [-2, 2].each do |delta2|
      [-1, 1].each do |delta1|

        x_coord = parent.x + delta2
        y_coord = parent.y + delta1

        get_move(x_coord, y_coord, parent)

        x_coord2 = parent.x + delta1
        y_coord2 = parent.y + delta2

        get_move(x_coord2, y_coord2, parent)

      end
    end
    parent
  end

  def get_move(x, y, parent)
    if x.between?(0, 7) && y.between?(0, 7)
      unless parent.parents.any? { |ancestor| ancestor.x == x  && ancestor.y == y}
        next_move = Move.new(x, y, parent.depth + 1, [], parent.parents + [parent])
        parent.children << next_move
        @move_count += 1
      end
    end
  end

end


#  m = MoveTree.new([4, 4], 1)
# # # parent = m.root
# # # m.get_children(parent)
#  m.inspect
# p m.root

# p m.inspect
