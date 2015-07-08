require_relative './move_tree.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(move)
    breadth_first(move, @tree.root, [])
  end

  def breadth_first(move, parent, move_order)
    parent.children.each do |child|
      if move_found(child, move)
        move_order << [child.x, child.y]
        return move_order
      end
    end

    move_order << [parent.x, parent.y]

    parent.children.each do |child|
      breadth_first(move, child, move_order) unless child.children.empty?
    end
  end

  def move_found(child, move)
    child.x == move[0] && child.y == move[1]
  end

end

t = MoveTree.new([4,4],2)
k = KnightSearcher.new(t)

puts k.bfs_for([1,1])