require_relative "movetree.rb"

class KnightSearcher
  attr_accessor :tree, :current_node
  def initialize(movetree)
    @tree = movetree
    @current_node = nil
  end

  def find_bfs(coords)
    location = nil
    @tree.bfs(@tree.root) do |node|
      if node.x ==coords[0] && node.y ==coords[1]
        location = node
        break
      end
    end
    location
  end

  def path_to_bfs(coords)
    moves = []
    node = find_bfs(coords)
    until node.parent.nil?
      moves << [node.x, node.y]
      node = node.parent
    end
    moves << [@tree.root.x, @tree.root.y]
    puts "bfs path:"
    moves.reverse.each do |move|
      puts "(#{move[0]}, #{move[1]})"
    end
  end

  def find_dfs(coords)
    location = nil
    @tree.dfs(@tree.root) do |node|
      if node.x ==coords[0] && node.y ==coords[1]
        location = node
        break
      end
    end
    location
  end

  def path_to_dfs(coords)
    moves = []
    node = find_dfs(coords)
    until node.parent.nil?
      moves << [node.x, node.y]
      node = node.parent
    end
    moves << [@tree.root.x, @tree.root.y]
    puts "dfs path:"
    moves.reverse.each do |move|
      puts "(#{move[0]}, #{move[1]})"
    end
  end

end
