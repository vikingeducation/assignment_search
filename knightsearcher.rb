require_relative 'movetree'

class KnightSearcher
  def initialize(tree)
    @tree = tree
    @root = @tree.root
  end

  def inspect(show_tree = false)
    @tree.inspect(show_tree)
  end

  def bfs_for(target)
    puts "BFS Search for target [#{target[0]}, #{target[1]}]"
    print_results(bfs(target))
  end

  def dfs_for(target)
    puts "DFS Search for target [#{target[0]}, #{target[1]}]"
    print_results(dfs(target))
  end

  private

  def print_results(node)
    return puts('No moves found') if node.nil?
    results = []
    until node.parent.nil?
      results << [node.x, node.y]
      node = node.parent
    end
    puts "Starting from [#{@root.x}, #{@root.y}], in #{results.length} moves: "
    results.length.times do
      puts results.pop.to_s
    end
  end

  def bfs(target)
    queue = []
    queue.unshift(@root)
    until queue.empty?
      node = queue.pop
      return node if node.x == target[0] && node.y == target[1]
      node.children.each do |n|
        queue.unshift(n)
      end
    end
    nil
  end

  def dfs(target)
    stack = []
    stack.push(@root)
    until stack.empty?
      node = stack.pop
      return node if node.x == target[0] && node.y == target[1]
      node.children.each do |n|
        stack.push(n)
      end
    end
    nil
  end
end

# test code
if __FILE__ == $PROGRAM_NAME
  searcher = KnightSearcher.new(MoveTree.new([4, 4], 4))
  searcher.inspect
  start = Time.now
  10000.times { searcher.bfs_for([3,7]) }
  bfs_run = Time.now - start
  start = Time.now
  10000.times { searcher.dfs_for([3,7]) }
  puts "BFS Runtime: #{bfs_run}"
  puts "DFS Runtime: #{Time.now - start}"
end
