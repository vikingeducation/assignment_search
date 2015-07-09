require_relative './move_tree.rb'
require 'benchmark'
require 'pry'

class KnightSearcher

  attr_reader :position

  def initialize(tree)
    @tree = tree
    @position = [@tree.root.x, @tree.root.y]
  end

  def bfs_for(move)
    queue = []
    parent = {}
    queue << @tree.root

    while queue.any?
      current = queue.shift
      if move_found(current, move)
        result = path(parent,@tree.root, current)
        break
      end
      current.children.each do |child|
        parent[child] = current
        queue << child
      end
    end

    result ? sequence(result) : "Error, no move sequence found."
  end

  def dfs_for(move)
    queue = []
    parent = {}
    queue << @tree.root

    while queue.any?
      current = queue.pop
      if move_found(current, move)
        result = path(parent,@tree.root, current)
        break
      end
      current.children.each do |child|
        parent[child] = current
        queue << child
      end
    end

    result ? sequence(result) : raise("Didn't find solution.")
  end

  def sequence(result)
    p "#{result.length - 1} moves to destination."
    result.each do |move|
      p move
    end
    return result
  end

  def move_knight_to_position(result)
    if result.length > 1
      @tree = MoveTree.new(result[1], 8)
      @position = [@tree.root.x, @tree.root.y]
    else
      @tree = MoveTree.new(result[0], 8)
      @position = [@tree.root.x, @tree.root.y]
      binding.pry
    end
  end

  def path(parent, start, endpoint)
    result = [endpoint]
    until result[-1] == start
      result << parent[result[-1]]
    end
    result = result.reverse
    result.map{|str| [str.x, str.y]}
  end

  def move_found(child, move)
    child.x == move[0] && child.y == move[1]
  end

end

# t = MoveTree.new([0,0],8)
# k = KnightSearcher.new(t)

# puts "BFS"
# dfs_avg = 0
# bfs_avg = 0
# bfs_time = Benchmark.measure {
#   result = 0
#   (0..7).each do |x|
#     (0..7).each do |y|
#       result += k.bfs_for([x,y]).length
#     end
#   end
#   bfs_avg = result / 64.0
# }
# puts "\nDFS"
# dfs_time = Benchmark.measure {
#   result = 0
#   (0..7).each do |x|
#     (0..7).each do |y|
#       result += k.dfs_for([x,y]).length
#     end
#   end
#   dfs_avg = result / 64.0
# }

# puts "Average BFS time"
# puts bfs_time
# puts "Average steps (BFS): #{bfs_avg}"

# puts "Average DFS time"
# puts dfs_time
# puts "Average steps (DFS): #{dfs_avg}"

class King

  def initialize(knight_position)
    @x = 0
    @y = 0
    @knight_position = knight_position
    set_valid_position
  end

  def position
    [@x, @y]
  end

  def set_valid_position
    @x = rand(0..7)
    @y = rand(0..7)
    forbidden_moves = generate_forbidden_moves
    while forbidden_moves.include?([@x, @y])
      @x = rand(0..7)
      @y = rand(0..7)
    end
    puts "The king spawns at #{@x}, #{@y}!"
  end

  def outbounds?(x,y)
    x >= 7 || x < 0 || y >=7 || y < 0
  end

  def update_knight_pos(arr)
    @knight_position = arr
  end

  def generate_forbidden_moves
    moves = [[-2, -1],[-2,1],[2, 1],[2,-1],[1,2],[-1,2],[1,-2],[-1,-2], [0,0]]
    forbidden_moves = moves.map{|move| [move[0] + @knight_position[0], move[1] + @knight_position[1]]}
    forbidden_moves
  end

  def generate_legal_moves
    l_moves = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1,],[1,0],[1,1]]
    l_moves.reject!{|move| outbounds?(@x + move[0],@y + move[1])}
    l_moves
  end

  def generate_good_moves
    g_moves = generate_legal_moves
    g_moves.map!{|move| [move[0] + @x, move[1] + @y]}

    f_moves = generate_forbidden_moves
    p f_moves
    g_moves.reject!{|move| f_moves.include?(move)}
    p g_moves

    g_moves.map!{|move| [move[0] - @x, move[1] - @y]}
    g_moves
  end

  def move_to(move)
    @x += move[0]
    @y += move[1]
    puts "The king is at #{@x}, #{@y}."
  end

  def move
    l_moves = generate_legal_moves
    g_moves = generate_good_moves

    if g_moves.any?
      new_move = g_moves.sample
      p "Making Good Move:"
      move_to(new_move)
    else
      new_move = l_moves.sample
      p "Making Legal Move:"
      move_to(new_move)
    end

  end

end

t = MoveTree.new([4,4],8)
kn = KnightSearcher.new(t)

k = King.new(kn.position)

counter = 1

kn.move_knight_to_position(kn.bfs_for(k.position))
until kn.position == k.position
  puts "The knights position is: #{[kn.position[0], kn.position[1]]}"
  k.update_knight_pos(kn.position)
  k.move
  kn.move_knight_to_position(kn.bfs_for(k.position))
  counter += 1
end

puts "The king was slain in #{counter} moves!"