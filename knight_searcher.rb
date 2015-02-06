require_relative 'move_tree'

class KnightSearcher
  include Moves

  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords)
  end
end