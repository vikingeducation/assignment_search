require_relative 'move_tree'

class KnightSearcher
  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target)
    valid_moves = MoveTree.potential_moves
    valid_moves.each do |move|
      if move == target
        puts "#{@depth} moves: #{@valid_moves}"
        return move
      else
        child_valid = MoveTree.potential_moves(move)
        child_valid.each do |child|
          valid_moves << child_valid
        end
      end
    end
  end

  def dfs_for(target)
    valid_moves = MoveTree.potential_moves
    valid_moves.each do |move|
      if move == target
        puts "#{@depth} moves : #{@valid_moves}"
        return move
      else
        child_valid = MoveTree.potential_moves(move)
        child_valid.each do |child|
          dfs_for(child)
        end
      end
    end
  end
end
KnightSearcher.new(knight_tree)
