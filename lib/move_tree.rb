class MoveTree
  attr_reader :starting_move

  def initialize(start, depth)
    x, y = *start
    @max_depth = depth
    @starting_move = Move.new(x, y, 0)
    create_moves_tree
  end

  def inspect
    "Your tree has #{@move_count} Move nodes and a max depth of #{@max_depth}."
  end

  private

  def create_moves_tree
    moves_queue = [@starting_move]
    @move_count = 1

    until moves_queue.empty?
      move = moves_queue.shift
      move.children = create_child_moves(move)
      @move_count += move.children.size

      move.children.each { |c| moves_queue << c if c.depth < @max_depth }
    end
  end

  def create_child_moves(parent)
    candidate_moves(parent).select do |move|
      board = (0..7)
      board.include?(move.x) && board.include?(move.y)
    end
  end

  def candidate_moves(parent)
    x = parent.x
    y = parent.y
    depth = parent.depth + 1

    [
      Move.new(x + 1, y + 2, depth, parent),
      Move.new(x - 1, y + 2, depth, parent),
      Move.new(x + 1, y - 2, depth, parent),
      Move.new(x - 1, y - 2, depth, parent),
      Move.new(x + 2, y + 1, depth, parent),
      Move.new(x - 2, y + 1, depth, parent),
      Move.new(x + 2, y - 1, depth, parent),
      Move.new(x - 2, y - 1, depth, parent)
    ]
  end
end

Move = Struct.new(:x, :y, :depth, :parent, :children)
