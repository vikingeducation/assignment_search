require_relative 'move_tree'

class KnightSearcher

  # searching a tree
  # give it a square to find
  # we want to find out how many moves it takes to get to that square
  # we know how many moves it takes by looking at the tree depth
  # we also want to print out the moves the knight searcher took to get there

  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords)
    correct_square = bfs_crawl(target_coords)
    if correct_square
      puts "#{correct_square.depth} Moves:"
      puts "Started from: #{[tree.root.x, tree.root.y]}"
      node = correct_square.parent
      moves = [correct_square]
      begin
        moves << node
        node = node.parent
      end until node.parent.nil?
      moves.reverse!
      moves.each { |move| p [move.x, move.y] }
    else
      puts "Move not found at depth"
    end
  end

  private

  def bfs_crawl(target_coords)
    queue = [tree.root]
    until queue.length == 0
      node = queue.shift
      node.children.each do |child|
        return child if [child.x, child.y] == target_coords
        queue << child
      end
    end
    false
  end

end

tree = MoveTree.new([4, 4], 4)
tree.build
tree.inspect

knight = KnightSearcher.new(tree)
knight.bfs_for([0,0])