
require_relative "./valid_knight_moves.rb"

class Move

  attr_accessor :square, :ancestors
  attr_reader  :depth

  def initialize(square, prior_move = nil)
    @square = square
    if prior_move.nil?
      # @ancestors = [square]
      @ancestors = [square]
      @depth = 0
    else
      new_move_ancestors = prior_move.ancestors.dup
      new_move_ancestors << square
      @ancestors = new_move_ancestors
      @depth = prior_move.depth + 1
    end
  end

end


# x = ValidKnightMoves.new("a5")
# print x.run
# x.square = "h1"
# print x.run

x = ValidKnightMoves4x4.new("b3")
print x.run
x.square = "d1"
print x.run
