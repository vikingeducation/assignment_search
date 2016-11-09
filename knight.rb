Move = Struct.new(:x, :y, :depth, :parent, children: [])

class MoveTree

  MOVELIST = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                [1, 2], [1, -2], [-1, 2], [-1, -2]]

  attr_reader :root, :max

  def initialize(coords, max = 1)
    @root = Move.new(coords[0], coords[1], 0)
    @max = max
  end

  def build
    # possible:
        # x +- 2:
        # => y +- 1
        # x +- 1:
        # => y +- 2
    # each possible x
      # add children to queue if on board
      # return if max depth
    queue = [root]

    until queue.length == 0
      position = queue.shift
      MOVELIST.map do |change|

        new_x = position.x + move[0]
        new_y = position.y + move[1]

        if valid?(new_x, new_y)
          child = Move.new(new_x, new_y, (position.depth + 1), position)

          unless child == position.parent
            position.children << child
            queue << child unless child.depth >= max
          end

        end

      end
    end
  end

  private
    def valid?(x, y)
      [0..7].include?(x) && [0..7].include?(y)
    end
end