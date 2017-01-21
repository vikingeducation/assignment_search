require_relative 'move'
class MoveTree
  attr_reader :root
  def initialize(coords, depth)
    @root = Move.new(coords[0], coords[1], 0, [])
    @depth = depth
    @queue = [@root]
    @counter = 1
    add_children
  end

  def add_children
    until @queue.empty?
      current = @queue.shift
      return if current.depth == @depth
      moves = get_moves(current.x, current.y)
      moves.each do |coords|
        move = Move.new(coords[0], coords[1], current.depth + 1, [], current)
        current.children << move
        @queue << move
        @counter += 1
      end
    end
  end

  def get_moves(x, y)
    # returns coordinates that knight can move to from x, y
    coords = [[2, -1], [2, 1], [-2, -1], [-2, 1], [1, -2], [1, 2], [-1, 2], [-1, -2]]
    moves = []
    coords.each do |a, b|
      moves << [x + a, y + b] if valid_move?(x + a, y + b)
    end
    moves
  end

  def valid_move?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

  def inspect
    puts "Your tree has #{@counter} Move nodes and a maximum depth of #{@depth}"
  end


end
