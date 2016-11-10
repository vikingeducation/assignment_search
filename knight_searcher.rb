require_relative 'move_tree'

class KnightSearcher

  # searching a tree
  # give it a square to find
  # we want to find out how many moves it takes to get to that square
  # we know how many moves it takes by looking at the tree depth
  # we also want to print out the moves the knight searcher took to get there

  attr_reader :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords, print_to_screen = true)
    time = Time.now
    found_move = bfs_crawl(target_coords)
    time = Time.now - time
    render(found_move, time) if print_to_screen
    time
  end

  def dfs_for(target_coords, print_to_screen = true)
    time = Time.now
    found_move = dfs_crawl(target_coords)
    time = Time.now - time
    render(found_move, time) if print_to_screen
    time
  end

  def render(target, time = nil)
    if target
      puts "#{target.depth} Moves:"
      puts "Started from: #{[tree.root.x, tree.root.y]}"
      node = target.parent
      moves = [target]
      begin
        moves << node
        node = node.parent
      end until node.parent.nil?
      moves.reverse!
      moves.each { |move| p [move.x, move.y] }
    else
      puts "Move not found at depth."
    end
    puts "Searched for #{time} seconds."
  end

  private

  def bfs_crawl(target_coords)
    queue = [tree.root]
    until queue.length == 0
      node = queue.shift
      node.children.each do |child|
        return child if [child.x, child.y] == target_coords
        queue << child
      end
    end
    false
  end

  def dfs_crawl(target_coords)
    stack = [tree.root]
    until stack.length == 0
      node = stack.pop
      node.children.each do |child|
        return child if [child.x, child.y] == target_coords
        stack << child
      end
    end
    false
  end

end
