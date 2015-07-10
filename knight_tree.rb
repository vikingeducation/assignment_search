Square = Struct.new(:x, :y, :depth, :children, :parent)

class KnightSearcher

  def initialize(tree)

    @tree = tree
    @max_depth=@tree.max_depth

  end

  def dfs_for(target_x,target_y)
    stack = [@tree.root]
    moves = []
    current_square = stack[0]

    until stack.empty?
      current_square.children.each do |child|
        stack << child
      end
      current_square = stack.pop
      if target_x == current_square.x && target_y == current_square.y
        puts "Target found [#{current_square.x},#{current_square.y}] on depth #{current_square.depth}"
        moves << current_square
        break
      end
    end

    unless moves.empty?
      current_square = moves[0]
      until current_square.parent.nil?
        current_square = current_square.parent
        moves.unshift(current_square)
      end
    else
      puts "Sorry, we were not able to find this square :("
    end

    moves.each_with_index do |node, index|
      puts "#{index+1}. Parent depth is #{node.depth} with coords [#{node.x},#{node.y}]"
    end
  end


  def bfs_for(target_x,target_y)

    queue = [@tree.root]
    moves = []

    until queue.empty?
      current_square = queue.shift
      queue += current_square.children
      if target_x == current_square.x && target_y == current_square.y
        puts "Target found [#{current_square.x},#{current_square.y}] on depth #{current_square.depth}"
        moves << current_square
        break
      end
    end

    unless moves.empty?
      current_square = moves[0]
      until current_square.parent.nil?
        current_square = current_square.parent
        moves.unshift(current_square)
      end
    else
      puts "Sorry, we were not able to find this square :("
    end

    moves.each_with_index do |node, index|
      puts "#{index+1}. Parent depth is #{node.depth} with coords [#{node.x},#{node.y}]"
    end
  end

  def benchmark

    t0 = Time.now

    10000.times { bfs_for(1,1) }

    t1 = Time.now

    10000.times { dfs_for(1,1) }

    t2 = Time.now

    puts "It took #{t1 - t0} to search broadly 10,000 times for the moves to [1,1]"
    puts "It took #{t2 - t1} to search deeply 10,000 times for the moves to [1,1]"

  end

end


class MoveTree
  attr_reader :root, :max_depth
  def initialize(initial_x, initial_y, max_depth = 5, board_size = 5)

    @max_depth = max_depth
    @board_size = board_size
    @move_combinations = [[-2, -1],
                          [-1, -2],
                          [1, -2],
                          [2,-1],
                          [2, 1],
                          [1, 2],
                          [-1, 2],
                          [-2, 1]]
    @root = Square.new(initial_x, initial_y, 0, [], nil)
    @total_squares = 1

    build_children(@root)
    build_tree(@root)
  end


  def build_tree(square, d=1)

    arr_parents = square.children
    d += 1
    arr_parents.each do |child|
      build_children(child)
      build_tree(child,d) unless d >= @max_depth
    end
  end


  def print_arr(arr)
    arr.each do |child|
      puts "Coordinates are: [#{child.x},#{child.y}] and depth is #{child.depth}"
    end
  end


  def build_children(parent)
    new_depth = parent.depth + 1

    @move_combinations.each do |move|
      new_x = parent.x + move[0]
      new_y = parent.y + move[1]
      if new_x <= @board_size && new_y <= @board_size &&
        new_x > 0 && new_y > 0
        parent.children << Square.new(new_x, new_y, new_depth, [], parent)
        @total_squares += 1
      end
    end
  end

  def print_tree
    queue = []
    queue << @root

    loop do
      current_square = queue.shift
      puts "Level #{current_square.depth} depth : [#{current_square.x},#{current_square.y}]"

      current_square.children.each do |child|
        queue << child
      end
      break if queue.empty?
    end
  end

  def count_total_children

    @total_squares

  end


end

tree=MoveTree.new(3,3)
k = KnightSearcher.new(tree)
k.benchmark







