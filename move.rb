
require_relative "./valid_knight_moves.rb"

class Move

  attr_accessor :square, :ancestors
  attr_reader  :depth

  def initialize(square, prior_move = nil)
    @square = square
    if @prior_move.nil?
      @ancestors = []
      @depth = 0
    else
      @ancestors = prior_move.ancestors + prior_move.square
      @depth = prior_move.depth + 1
    end
  end

end


# x = ValidKnightMoves.new("a5")
# print x.run
# x.square = "h1"
# print x.run
