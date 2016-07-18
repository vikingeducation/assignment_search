require_relative "chess_tree"

class KnightSearcher
  def initialize
  end

  def bfs_for(root, target)
    queue = [root]
    until queue[0].x == target[0] && queue[0].y == target[1]
      unless queue[0].children == nil
        queue[0].children.each do |child|
          queue.push(child)
        end
        queue.shift
      end
    end
    current_node = queue[0]
    moves = []
    until current_node.parent == nil
      moves << [current_node.x, current_node.y]
      current_node = current_node.parent
    end
    count = 1
    moves.reverse.each do |move|
      puts "Move #{count}- X: #{move[0]} Y: #{move[1]}" 
      count += 1
    end
  end
end
tree = ChessTree.new(30,8)
root = tree.make_root
target = tree.ask_target
tree.make_children(tree.root)
searcher = KnightSearcher.new()
searcher.bfs_for(root, target)
