Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  MOVELIST = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                [1, 2], [1, -2], [-1, 2], [-1, -2]]

  attr_reader :root, :max, :total_moves

  def initialize(coords, max = 1)
    @root = Move.new(coords[0], coords[1], 0, [])
    @max = max
    @total_moves = 0
  end

  def build
    queue = [root]
    until queue.length == 0 
      position = queue.shift
      MOVELIST.map do |move|
        new_x = position.x + move[0]
        new_y = position.y + move[1]

        if valid?(new_x, new_y)
          child = Move.new(new_x, new_y, (position.depth + 1), [], position)
          unless child == position.parent
            position.children << child
            queue << child unless child.depth >= max
            @total_moves += 1
          end
        end
        
      end
    end
  end

  def inspect
    puts "Your tree has #{total_moves} move nodes and a maximum depth of #{max}."
  end

  private
    def valid?(x, y)
      (0..7).include?(x) && (0..7).include?(y)
    end
end