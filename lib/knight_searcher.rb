require_relative "move_tree"

class KnightSearcher

  attr_reader :tree

  def initialize(starting_position, max_depth)
    @tree = MoveTree.new(starting_position, max_depth)
    @tree.add_children(@tree.starting_square)
    @tree.add_more_children
  end

  def bfs(target, queue = [@tree.starting_square], count = 0)
    raise ArgumentError, "Input must be an array!" unless target.is_a?(Array)

    current_node = queue.shift
    puts "#{[current_node.x, current_node.y]}, #{count}"  
    current_node.children.each { |square| queue << square } unless current_node.children.nil?

    return current_node if current_node.x == target[0] && current_node.y == target[1]
    return nil if queue.empty?
    bfs(target, queue, count + 1)
  end

  def dfs(target, stack = [@tree.starting_square], count = 0)
    raise ArgumentError, "Input must be an array!" unless target.is_a?(Array)

    current_node = stack.pop
    puts "#{[current_node.x, current_node.y]}, #{count}"
    current_node.children.reverse.each { |square| stack << square } unless current_node.children.nil?

    return current_node if current_node.x == target[0] && current_node.y == target[1]
    return nil if stack.empty?
    dfs(target, stack, count + 1)
  end

  def bfs_path(target, move_sequence = [], current_node = bfs(target))
    raise ArgumentError, "Input must be an array!" unless target.is_a?(Array)

    if current_node.nil?
      puts "#{move_sequence.length - 1} move(s)"
      move_sequence.length.times { |i| puts "#{[move_sequence[i].x, move_sequence[i].y]}" }
      return move_sequence.count - 1
    else
      move_sequence.unshift(current_node)
      current_node = current_node.parent
      bfs_path(target, move_sequence, current_node)
    end
  end

  def dfs_path(target, move_sequence = [], current_node = dfs(target))
    raise ArgumentError, "Input must be an array!" unless target.is_a?(Array)

    if current_node.nil?
      puts "#{move_sequence.length - 1} move(s)"
      move_sequence.length.times { |i| puts "#{[move_sequence[i].x, move_sequence[i].y]}" }
      return move_sequence.count - 1
    else
      move_sequence.unshift(current_node)
      current_node = current_node.parent
      dfs_path(target, move_sequence, current_node)
    end
  end

end