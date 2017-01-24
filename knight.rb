# Knight's Travails

# Knight - print moves

require_relative 'knight_searcher'
require_relative 'move_tree'

module KnightsTravails

  Move = Struct.new(:x, :y, :depth, :parent, :children)

  # print move data tidily

  class Move
  # puts calls # to_s
    def to_s
      "position: #{x}, #{y}, depth: #{depth}"
    end
  end
  
end # class Move




