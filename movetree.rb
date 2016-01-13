require_relative "./Stack.rb"


class Move

  def initialize(square, prior_move = nil)
    @square = square
    if @prior_move.nil?
      @ancestor = []
      @depth = 0
    else
      @ancestor = prior_move.ancestor + prior_move.square
      @depth = prior_move.depth + 1
    end
  end



end


def valid_knight_moves(square)

  valid_moves = []
  column_hash = {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8}
  reverse_column_hash = {1=> "a", 2=> "b", 3=> "c", 4=> "d", 5=> "e", 6=> "f", 7=> "g", 8=> "h"}
  possible_move = [[-2, -1], [-2, 1],[2, -1], [2, 1], [1, -2], [1, 2], [-1, 2], [-1, -2]]

  column_num = column_hash[square[0].to_sym]
  rank_num = square[1].to_i

  possible_move.each do |move|
    puts column_hash
    possible_column = column_num + move[0]
    possible_rank  = rank_num + move[1]
    unless possible_rank > 8 || possible_rank < 1 || 
      possible_column > 8 || possible_column < 1

      square = reverse_column_hash[possible_column] + possible_rank.to_s
      valid_moves.push(square)

    end

  end
  valid_moves
end

print valid_knight_moves ("a5")
