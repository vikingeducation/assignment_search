require_relative 'move_tree'

class KnightSearcher
  attr_reader :tree

  def initialize(move_tree)
    @tree = move_tree
  end

  # target is an array: [x, y]
  # output_data is an array: [d, move1, move2, ... , target] (d is final depth)
  def bfs_for(target)
    output_data = []
    search_result = bfs(target[0], target[1])
    return "#{target} not found!" if search_result == 'Not found!'
    output_data << search_result.depth
    output_data += get_move_sequence(search_result)
    output_data
  end

  def dfs_for(target)
    search_result = dfs(target[0], target[1])
    return "#{target} not found!" if search_result == 'Not found!'
    search_result.unshift(search_result.size - 1)
    search_result
  end

  private

  def get_move_sequence(node)
    sequence = []
    stack = []
    stack << node
    until stack.empty?
      current_move = stack.pop
      sequence << [current_move.x, current_move.y]
      if current_move.parent
        stack << current_move.parent
      end
    end
    sequence.reverse
  end

  # bfs and dfs returns node with x and y value or 'Not found!' if (x, y) not found

  def bfs(x, y)
    queue = []
    queue << @tree.root
    until queue.empty?
      current_move = queue.shift
      return current_move if current_move.x == x && current_move.y == y
      if current_move.children
        current_move.children.each do |child|
          queue << child
        end
      end
    end
    'Not found!'
  end 

  def dfs(x,y)
    sequence = []
    stack = []
    stack << @tree.root
    until stack.empty?
      current_move = stack.pop # stack.shift
      sequence << [current_move.x, current_move.y]
      return sequence if current_move.x == x && current_move.y == y
      if current_move.children
        current_move.children.each do |child|
          stack << child
        end
      end
    end
    'Not found!'
  end
end

