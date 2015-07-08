Square = Struct.new(:x, :y, :depth, :children)

class KnightTree

  def initialize(x, y)

    @root_square = Square.new(x, y, 0, [])

  end

end

class MoveTree

  def initialize(x, y, max_depth = 1)

    @x = y
    @y = y
    @max_depth = max_depth
    @board_size = 5
    @move_combinations = [[-2, -1],
                          [-1, -2],
                          [1, -2],
                          [2,-1],
                          [2, 1],
                          [1, 2],
                          [-1, 2],
                          [-2, 1]]
    @tree = Square.new(@x, @y, 0, [])

  end

  def build

    for g in (0..@max_depth) do

      @move_combinations.each do |move|

        new_x = @x + move[0]
        new_y = @y + move[1]
        if new_x <= @board_size &&
          new_y <= @board_size &&
          new_x > 0 &&
          new_y > 0
          @tree.children << Square.new(new_x, new_y, 1, [])
        end

      end
    end

  end

  def print_tree

    i = 0

    while i < @max_depth
      p @tree
      p @tree.children
      i += 1
    end

  end

  def count_children

    @tree.children.length

  end


end

my_tree = MoveTree.new(1,1)

my_tree.build

my_tree.print_tree

puts my_tree.count_children
