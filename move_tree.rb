Square = Struct.new(:x,:y,:depth, :children)


class MoveTree

  def initialize(beginning_cord, max_depth)

    @root = Square.new(beginning_cord[0], beginning_cord[1], 0, [])
    @max_depth = max_depth

  end

  def build_tree(root)

    moves = gen_possibe_move(root)

    moves.each do |move|

      if is_valid_move?(move)

        insert_child(root, move[0], move[1])

      end

    end

    root.children.each do |child|

      build_tree(child)

    end

  end

  def gen_possibe_move(root)

    [x-1, y-2], 

  end

  # x, y
  # x-1, y-2
  # x+1, y-2
  # x-1, y+2
  # x+1, y+2
  # x-2, y-1
  # x+2, y-1
  # x-2, y+1
  # x+2, y+1






  def insert_child(root, x, y)
    root.children << Square.new(x, y, 1, [])
  end




end