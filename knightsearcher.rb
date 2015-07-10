require_relative 'tree_builder'

class KnightSearcher
  attr_reader :tree
  def initialize(tree)
    @tree = tree
  end

  def bfs_for(coordx, coordy)
    origin = @tree.root
    queue = []
    current_node = origin
    until [current_node.x, current_node.y] == [coordx, coordy]
      unless current_node.children.nil?
        current_node.children.each do |child|
          queue << child
        end
      end
      return "No solution found within that many steps." if queue.empty?
      current_node = queue.shift
    end
    find_path(current_node)
  end

  def dfs_for(coordx, coordy)
    origin = @tree.root
    stack = []
    current_node = origin
    until [current_node.x, current_node.y] == [coordx, coordy]
      unless current_node.children.nil?
        current_node.children.each do |child|
          stack << child
        end
      end
      return "No solution found within that many steps." if stack.empty?
      current_node = stack.pop
    end
    find_path(current_node)
  end

  def find_path(node)
    path = [[node.x, node.y]]
    until node.parent == @tree.root
      node = node.parent
      path << [node.x, node.y]
    end
    path.reverse
  end

  def queue_children(parent)
    append_queue = []
    parent.children.each do |child|
       append_queue << child
    end
    append_queue
  end

end