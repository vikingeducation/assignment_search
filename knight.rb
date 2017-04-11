# require_relative 'knight_searcher'
# require_relative 'move_tree'

module KnightsTravails

  Move = Struct.new(:x, :y, :depth, :parent, :children)

  class Move
    def to_s
      "position: #{x}, #{y}\ndepth: #{depth}"
    end
  end
end
