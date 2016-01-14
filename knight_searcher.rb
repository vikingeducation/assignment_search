require_relative 'move_tree'
require_relative 'queue'
require_relative 'stack'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(coord)

    queue = Queue.new
    queue.enqueue(@tree.root)

    loop do

      current_node = queue.dequeue

      if solution?(current_node, coord)
        depth = current_node.depth
        path_list = fill_path_list(current_node)
        print_solution(depth,path_list)
        break
      elsif !current_node.children.nil?
        current_node.children.each do |child|
          queue.enqueue(child)
        end
      else
        queue.empty? ? break : next
      end

    end
  end

  def fill_path_list(current_node)
    path_list = []
    until current_node == nil
      path_list << [current_node.x,current_node.y]
      current_node = current_node.parent
    end
    path_list
  end

  def solution?(current_node, target_coord)
    [current_node.x,current_node.y] == target_coord
  end

  def print_solution(depth,path_list)
    puts "#{depth} moves:\n"
    path_list.reverse_each do |path_coord|
      p path_coord
    end
  end

  def dfs_for(coord)

    stack = Stack.new
    stack.push(@tree.root)

    loop do
      current_node = stack.pop
      if solution?(current_node, coord)
        depth = current_node.depth
        path_list = fill_path_list(current_node)
        print_solution(depth,path_list)
        break
      elsif !current_node.children.nil?
        current_node.children.each do |child|
          stack.push(child)
        end
      else
        stack.empty? ? break : next
      end
    end
  end
end

knight_tree = MoveTree.new([3,3],2)
searcher = KnightSearcher.new( knight_tree )
searcher.bfs_for([1,3])
searcher.dfs_for([1,3])
