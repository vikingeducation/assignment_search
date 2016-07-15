# move_tree.rb
require_relative 'move'

class MoveTree
  attr_reader :root
  
  def initialize(start_coordinates, max_depth = 1)
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
    @max_depth = max_depth
    @root = Move.new(@start_x, @start_y, 0, nil, nil)
    @counter=1
    generate_tree_from(@root)
  end

  def inspect
    puts "Your tree has #{@counter} Move nodes and a maximum depth of #{@max_depth}."
  end

  def generate_tree_from(move)
    if move.depth == @max_depth
      return
    else
      generate_children_for(move)
      move.children.each do |child|
        generate_tree_from(child)
      end
    end
  end

  def generate_children_for(move)
    children = all_possible_coordinates(move.x,move.y).map do |coord|
      Move.new(coord[0],coord[1], move.depth+1, nil, move)
    end
    move.children = children
    @counter += children.length
  end

  def all_possible_coordinates(x, y)
    possible_moves = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x - 1, y + 2]
    ]

    possible_moves.select do |coordinates|
      coordinates.all? do |coord|
        coord.between?(0,7)
      end
    end
  end

end

knight_tree = MoveTree.new([0,0],3)
knight_tree.inspect

