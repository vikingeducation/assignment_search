# knights_travails.rb
require_relative 'knight_searcher'
require_relative 'benchmarker'
# require 'pry'

Move = Struct.new(:x, :y, :depth, :children, :parent)

class Move
  def to_s
    "#{x}, #{y}:\n #{children}"
  end
  def inspect
    "#{x}, #{y}:\n #{children}"
  end
end

class MoveTree
  attr_reader :max_depth, :root

  def initialize(coord, max_depth)
    @root = Move.new(coord[0], coord[1], 0, [], nil)
    @max_depth = max_depth
    @num_nodes = 0
  end

  def info
    p "Your tree has #{@num_nodes} Move nodes and a maxium depth of #{@max_depth}"
  end

# recursive function that mirrors depth-first building
  def build_tree_r(move)
    return if move.depth >= @max_depth
    build_children(move)
    move.children.each do |child|
      build_tree_r(child)
    end
  end

# using queues to mirror breadth-first building.
  def build_tree
    @num_nodes = 0
    current = @root
    queue = []
    queue.push(current)
    while (current = queue.shift) && current.depth < max_depth
      build_children(current)
      current.children.each { |child| queue << child }
    end
  end

  def valid_move?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

  def build_children(move)
    possible_moves([move.x, move.y]).each do |coord|
      coord.each_slice(2) do |x,y|
        if valid_move?(x, y)
          move.children << Move.new(x, y, (move.depth) + 1, [], move)
          @num_nodes += 1
        end
      end
    end
  end

  def possible_moves(parent_coord)
    x = parent_coord[0]
    y = parent_coord[1]
    [[x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y-1],
    [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2]]
  end
end
