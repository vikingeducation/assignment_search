

class ValidKnightMoves
    COLUMN_HASH = {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8}
    REVERSE_COLUMN_HASH = {1=> "a", 2=> "b", 3=> "c", 4=> "d", 5=> "e", 6=> "f", 7=> "g", 8=> "h"}
    POSSIBLE_MOVE = [[-2, -1], [-2, 1],[2, -1], [2, 1], [1, -2], [1, 2], [-1, 2], [-1, -2]]

    attr_accessor :square
    attr_reader :valid_moves

    def initialize(square = nil)
        @square = square
    end

    def run
      @valid_moves = []

      column_num = COLUMN_HASH[@square[0].to_sym]
      rank_num = @square[1].to_i

      POSSIBLE_MOVE.each do |move|
        possible_column = column_num + move[0]
        possible_rank  = rank_num + move[1]
        unless possible_rank > 8 || possible_rank < 1 || 
          possible_column > 8 || possible_column < 1

          valid_square = REVERSE_COLUMN_HASH[possible_column] + possible_rank.to_s
          @valid_moves.push(valid_square)
        end
      end
    @valid_moves
    end
end


class ValidKnightMoves4x4
    COLUMN_HASH = {a: 1, b: 2, c: 3, d: 4, e: 5}
    REVERSE_COLUMN_HASH = {1=> "a", 2=> "b", 3=> "c", 4=> "d", 5=> "e"}
    POSSIBLE_MOVE = [[-2, -1], [-2, 1],[2, -1], [2, 1], [1, -2], [1, 2], [-1, 2], [-1, -2]]

    attr_accessor :square
    attr_reader :valid_moves

    def initialize(square = nil)
        @square = square
    end

    def run
      @valid_moves = []

      column_num = COLUMN_HASH[@square[0].to_sym]
      rank_num = @square[1].to_i

      POSSIBLE_MOVE.each do |move|
        possible_column = column_num + move[0]
        possible_rank  = rank_num + move[1]
        unless possible_rank > 5 || possible_rank < 1 || 
          possible_column > 5 || possible_column < 1

          valid_square = REVERSE_COLUMN_HASH[possible_column] + possible_rank.to_s
          @valid_moves.push(valid_square)
        end
      end
    @valid_moves
    end
end
