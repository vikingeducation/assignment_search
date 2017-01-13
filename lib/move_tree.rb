require_relative 'node'

class MoveTree
  include Node

  attr_reader :root

  def initialize(x, y, max_depth = 1)
    raise "x value out of range" unless (0..7).include?(x)
    raise "y value out of range" unless (0..7).include?(y)
    raise "max depth must be >= 0" unless max_depth >= 0
    @max_depth = max_depth
    @root = Move.new(x, y, 0, nil, nil)
    @max_depth.times do |i|
      @root.insert_valid_knight_moves(i+1)
    end
  end

  def inspect
    "Your tree has #{count_nodes(@root)} Move nodes and a maximum depth of #{@max_depth}."
  end

  def count_nodes(node)
    return 0 if node.nil?
    sum = 1     
    unless node.children.nil?
      node.children.each do |child|
        sum += count_nodes(child)
      end
    end
    sum
  end
end