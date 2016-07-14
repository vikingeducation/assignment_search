require 'pry'
require_relative 'knight.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(array)
    found_move = find_move(array)
    move = found_move
    while move.parent
      puts "[#{move.parent.x}, #{move.parent.y}]"
      move = move.parent
    end
  end

  def find_move(array)
    current = @tree.starting_move
    queue = [current]
    until queue.empty?
      current = queue.pop
      return current if array == [current.x, current.y]
      current.children.each do |child|
        queue.unshift(child)
      end
    end
  end

  

end


tree = MoveTree.new([2,2], 3)
# tree = empty_tree.move_tree

k = KnightSearcher.new(tree)

puts !!k.find_move([4,3])
