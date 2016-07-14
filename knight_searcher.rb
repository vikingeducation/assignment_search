require 'pry'
require_relative 'knight.rb'

class KnightSearcher
  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(array)
    found_move = bfs_find_move(array)
    move = found_move
    if move
      puts "Found the coordinate at depth level #{move.depth}."
    else
      raise "Couldn't find coordinate."
    end
    while move.parent
      puts "[#{move.parent.x}, #{move.parent.y}]"
      move = move.parent
    end
  end

  def dfs_for(array)
    found_move = dfs_find_move(array,@tree.starting_move)
    if found_move
      puts "Found the coordinate at depth level #{found_move.depth}."
    else
      raise "Couldn't find coordinate."
    end
    while found_move.parent
      puts "[#{found_move.parent.x}, #{found_move.parent.y}]"
      found_move = found_move.parent
    end
  end

  

  # def dfs_find_move(array,move)
  #   if move.children.nil?
  #     return
  #   elsif array == [move.x,move.y]
  #     return move
  #   else
  #     move.children.each do |child|
  #       dfs_find_move(array,child)
  #     end
  #   end
  # end

# Recursive
# search(value, node)
#   return node if value = node.value
#   until node.children is nil
#   node.children.each do |child|
#     search(value, child)
#   end
# end

  def bfs_find_move(array)
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
k = KnightSearcher.new(tree)


k.dfs_for([4,3])
# puts k.dfs_find_move([4,3],k.tree.starting_move)
