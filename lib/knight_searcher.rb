require_relative "knight"

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(ending)
    queue = [@tree]
    final = []
    while move = queue.shift
      if [move.x,move.y] == ending
        final << move
      end
      move.children.each { |child| queue << child } if move.children
    end
    if final.empty?
      p "sorry, couldn't find your move"
    else
      p "#{final[0].depth - 1} moves"
      print_ancestors(final[0])
    end
  end

  def dfs_for(ending)
    stack = [@tree]
    final = []
    while move = stack.pop
      if [move.x,move.y] == ending
        final << move
      end
      move.children.each { |child| stack << child } if move.children
    end
    if final.empty?
      p "sorry, couldn't find your move"
    else
      p "#{final[0].depth - 1} moves"
      print_ancestors(final[0])
    end
  end

  def print_ancestors(move)
    current = move
    p [move.x, move.y]
    until current.parent == nil
      p [current.parent.x, current.parent.y]
      current = current.parent
    end
  end

end

tree = MoveTree.new([0,0], 7)
tree.moves_array(tree.starting_pos)
tree.build_trees
search = KnightSearcher.new(tree.starting_pos)
search.bfs_for([7,1])
search.dfs_for([7,1])
