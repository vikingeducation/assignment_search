require 'pry'

Square = Struct.new(:x, :y, :depth, :children)

# Tree of potential moves based on a starting position and maximum number of moves (depth)
class MoveTree
  attr_reader :head

  def initialize(start_coords, max_depth = 1, board_size = 5)
    @board_size = board_size
    @max_depth = max_depth
    @head = Square.new(start_coords[0], start_coords[1], 0)
    get_moves(@head)
  end

  private

  def get_moves(node)
    unless node.depth == @max_depth
      node.children = []
      moves = get_potential_moves(node)
      moves.each do |move|
        child = Square.new(move[0], move[1], node.depth + 1)
        node.children << child
        get_moves(child)
      end
    end
  end

  def get_potential_moves(node)
    moves = [
      [node.x + 1, node.y + 2],
      [node.x + 1, node.y - 2],
      [node.x + 2, node.y + 1],
      [node.x + 2, node.y - 1],
      [node.x - 1, node.y + 2],
      [node.x - 1, node.y - 2],
      [node.x - 2, node.y + 1],
      [node.x - 2, node.y - 1],
    ]

    moves.select{ |move| on_board?(move) }
  end

  def on_board?(move)
    max_index = @board_size - 1
    (0..max_index).include?(move[0]) && (0..max_index).include?(move[1])
  end
end

# tree = MoveTree.new([3,3], 1)