
require_relative 'move_tree'

class KnightSearcher

  attr_accessor :knight_tree, :moves, :trail

  def initialize(tree)
    @knight_tree = tree.root
    @trail = Array.new
  end


  def bfs_for(target_coords)
    queue = []
    @moves = 0
    @trail = []
    queue << @knight_tree

    while queue.length != 0
      current = queue.shift
      @moves += 1
      @trail << [current.x, current.y]
      if(current.x == target_coords[0] && current.y == target_coords[1])

        print_trail
        return "Found node"
      elsif(current.children) 
        current.children.each do | descendants|
          queue << descendants
        end
      end
    end
    puts "Path not found"
  end

   def dfs_for(target_coords)
    stack = []
    @moves = 0
    @trail = []
    stack << @knight_tree

    while stack.length != 0
      current = stack.pop
      @moves += 1
      @trail << [current.x, current.y]
      if(current.x == target_coords[0] && current.y == target_coords[1])
        print_trail
        return "Found node"
      elsif(current.children) 
        current.children.each do | descendants|
          stack << descendants
        end
      end
    end
    puts "Path not found"
  end

# Output the sequence of moves used to get there as well as the final depth required.
  def print_trail
    puts "#{@moves} moves:"
    @trail.each do |x|
      puts "[#{x[0]}, #{x[1]}]"
    end
  end
end