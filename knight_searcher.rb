require './move_tree.rb'

class KnightSearcher

  def initialize(tree)

    @tree = tree

    x = @tree.start.x
    y = @tree.start.y

  end


  def bfs_for(x,y)

    queue = []
    
    current_node = @tree.start

    until current_node.x == x && current_node.y == y 
      queue += current_node.children unless current_node.children.nil?
      current_node = queue.shift
    end

    path = find_path(current_node)
    puts "#{path.length} Move(s)"
    p path.reverse
    current_node
  end


  def dfs_for(x,y)

    stack = []

    current_node = @tree.start

    until current_node.x == x && current_node.y == y
      stack += current_node.children unless current_node.children.nil?
      current_node = stack.pop
    end

    path = find_path(current_node)
    puts "#{path.length} Move(s)"
    p path.reverse
    current_node

  end


  def find_path(node)

    path = []

    current_node = node

    until current_node.parent.nil?
      path << [current_node.x, current_node.y]
      current_node = current_node.parent
    end

    path
  end


end



