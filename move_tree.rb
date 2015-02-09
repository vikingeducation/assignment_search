require_relative 'square.rb'
require 'pry'

class MoveTree
  attr_accessor :tree_queue
  def initialize(startcoords, max_depth)
    @startcoords = startcoords
    @max_depth = max_depth
    @tree_queue = []
    tree_maker(startcoords, max_depth)
  end

  def inspection

  end

  def tree_maker(core_move,max_depth)
    depth_counter = 0
    @current_node = Square.new(core_move[0], core_move[1], 0, [])
    @depth = 1
    @tree_queue << @current_node    
    check_squares_create_children(@current_node)
    while @depth < max_depth
      @current_node.children.each do |child|
        if @depth == max_depth
          puts "it broke"
        else
          @current_node = child
          check_squares_create_children(child)
          @tree_queue << child
        end
      end

      @depth += 1
    end
  end

  def check_squares_create_children(current_node)
    @current_node_check = 1
    until @current_node_check == 8
       if move_checker(@current_node_check, current_node.x, current_node.y)
        new_coords = move_checker(@current_node_check, current_node.x, current_node.y)
        current_node.children << Square.new(new_coords[0], new_coords[1], @depth, [])
      end
      @current_node_check += 1
    end
  end

  def move_checker(number, coords1, coords2)
    case number
    when 1
      if on_board?(coords1 + 2) && on_board?(coords2 + 1)
        [(coords1 + 2), (coords2 + 1)]
      else 
        return false
      end  
    when 2
      if on_board?(coords1 + 2) && on_board?(coords2 - 1)
        return [(coords1 + 2), (coords2 - 1)]
      else
        return false
      end 
    when 3
      if on_board?(coords1 - 2) && on_board?(coords2 + 1)
        return [(coords1 - 2), (coords2 + 1)]
      else
        return false
      end 
    when 4
      if on_board?(coords1 - 2) && on_board?(coords2 - 1)
        return [(coords1 - 2), (coords2 - 1)]
      else
        return false
      end 
    when 5
      if on_board?(coords1 + 1) && on_board?(coords2 + 2)
        return [(coords1 + 1), (coords2 + 2)]
      else
        return false
      end 
    when 6
      if on_board?(coords1 + 1) && on_board?(coords2 - 2)
        return [(coords1 + 1), (coords2 - 2)]
      else
        return false
      end 
    when 7
      if on_board?(coords1 - 1) && on_board?(coords2 + 2)
        return [(coords1 - 1), (coords2 + 2)]
      else 
        return false
      end 
    when 8
      if on_board?(coords1 - 1) && on_board?(coords2 - 2)
        return [(coords1 - 1), (coords2 - 2)]
      else
        return false
      end 
    end
  end


  def on_board?(num)
    if num < 9 && num >= 0
      true
    else
      false
    end
  end
end