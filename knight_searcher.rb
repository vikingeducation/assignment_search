# knight searcher

# implements dfs and bfs iteratively

require_relative 'move_tree'
require 'pry-byebug'

class KnightSearcher
  attr_accessor :tree, :path

  def initialize(tree)
    @tree = tree
    @path = []
  end 

  # searches path to the target_coord
  def bfs_for(target_coords)
    sq = Square.new(target_coords[0], target_coords[1], 0, nil, nil)

    current = @tree.root
    node_queue = []
    @path = []

    # traverse by level
    loop do 

      break if current.nil?

      # if current == target
      if current.x == target_coords[0] && current.y == target_coords[1] 
        # get path and break loop
        loop do 
          @path.unshift(current)
          current = current.parent
          break if current == @tree.root
        end

        break
      else
        # if current != target, then push all current's children into the queue
        c = [current.x, current.y]
        if !current.children.nil?
          current.children.each do |child|
            node_queue.push(child) if child.depth >= current.depth && !child.nil?
          end 
        end
        # dequeue
        current = node_queue.shift
      end
    end

    print "To #{target_coords}, " 
    print_path
  end

  def dfs_for(target_coords)
    sq = Square.new(target_coords[0], target_coords[1], 0, nil, nil)

    current = @tree.root
    node_stack = []
    @path = []

    # traverse by depth
    loop do 

      break if current.nil?

      # if current == target
      if current.x == target_coords[0] && current.y == target_coords[1] 
        # get path and break loop
        loop do 
          @path.unshift(current)
          current = current.parent
          break if current == @tree.root
        end

        break
      else
        # if current != target, then push all current's children into the stack
        c = [current.x, current.y]
        if !current.children.nil?
          current.children.each do |child|
            node_stack.push(child) if child.depth >= current.depth && !child.nil?
          end 
        end
        # dequeue
        current = node_stack.pop
      end
    end

    print "DFS: To #{target_coords}, " 
    print_path
  end

  def print_path
    root_coord = "[#{@tree.root.x},#{@tree.root.y}]"
    puts "#{@path.size} moves from #{root_coord}"
    @path.each do |sq|
      coord = "[#{sq.x},#{sq.y}]"
      puts coord
    end
    @path
  end
end

def benchmark
  return if !block_given?

  t1 = Time.now

  1000.times do 
    yield
  end

  t2 = Time.now

  puts "Running block 1000 times took: #{t2-t1} seconds"
end

t = MoveTree.new([1,1], 3)
t.inspect
#puts t.root
s = KnightSearcher.new(t)
s.bfs_for([2,3])
s.bfs_for([3,5])
s.bfs_for([4,7])
s.dfs_for([2,3])
s.dfs_for([3,5])
s.dfs_for([4,7])

#benchmark {s.dfs_for([4,7])}
#benchmark {s.bfs_for([4,7])}