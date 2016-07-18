require_relative "chess_tree"

class KnightSearcher
  def initialize
  end

  def bfs_for(root, target)
    queue = [root]
    until queue[-1].x == target[0] && queue[-1].y == target[1]
      unless queue[-1].children == nil
        queue[-1].children.each do |child|
          queue.unshift(child)
        end
        queue.pop
      end
    end
    current_node = queue[-1]
    moves = []
    until current_node.parent == nil
      moves << [current_node.x, current_node.y]
      current_node = current_node.parent
    end
    count = 1
    puts "For BFS:"
    moves.reverse.each do |move|
      puts "Move #{count}- X: #{move[0]} Y: #{move[1]}" 
      count += 1
    end
  end


  def dfs_for(root, target)
    stack = [root]
    current = stack[-1]
    until current.x == target[0] && current.y == target[1]
      current = stack.pop
      unless current.children == nil
        current.children.each do |child|
          stack.push(child)
        end
      end
    end
    current_node = current
    moves = []
    until current_node.parent == nil
      moves << [current_node.x, current_node.y]
      current_node = current_node.parent
    end
    count = 1
    puts "For DFS:"
    moves.reverse.each do |move|
      puts "Move #{count}- X: #{move[0]} Y: #{move[1]}" 
      count += 1
    end
  end
end
tree = ChessTree.new(5,4)
root = tree.make_root
target = tree.ask_target
tree.make_children(tree.root)
searcher = KnightSearcher.new()
searcher.bfs_for(root, target)
searcher.dfs_for(root, target)
