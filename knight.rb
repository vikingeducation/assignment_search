require 'pry'
Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  BOARD_SIZE = 8
  def initialize(position, depth)
    x, y = position
    @root = Move.new(x, y, 0, [], nil)
    insert_moves(@root, valid_moves(@root), depth)
  end

  def valid_moves(root)
    x, y = root.x, root.y
    new_moves = []
    moves = { upleft: {x:-1, y:-2}, upright: {x:1, y:-2}, downleft: {x:-1, y:2}, downright: {x:1, y:2},
              leftup: {x:-2, y:-1}, leftdown: {x:-2, y:1}, rightup: {x:2, y:-1}, rightdown: {x:2, y:1}}
    moves.values.each do |dir|
      new_moves << Move.new(x+dir[:x], y+dir[:y], 0, [], nil)
    end
    new_moves.select { |move| move.x >= 0 && move.x < 8 && move.y >=0 && move.y < 8 }
  end

  def insert(root, move)
    root.children << move
    move.parent = root
    move.depth = root.depth + 1
  end

  def insert_moves(root, moves, depth)
    puts "depth #{depth}"
    moves.each do |move|
      insert(root, move)
    end
  end
end

p MoveTree.new([3, 3], 1)