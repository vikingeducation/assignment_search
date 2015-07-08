Square = Struct.new(:x,:y,:depth, :children)


class MoveTree

  attr_accessor :children, :root

  def initialize(beginning_cord, max_depth)

    @root = Square.new(beginning_cord[0], beginning_cord[1], 0, [])
    @max_depth = max_depth
    build_tree(@root)

  end

  def insert_child(root, x, y)
    root.children << Square.new(x, y, root.depth+1, [])
  end

  def build_tree(root)
    unless root.depth >= @max_depth
      moves = gen_possible_move(root)

      moves.each do |move|
        # print "x=#{move[0]} and y = #{move[1]}"
        if is_valid_move?(move)
          # print "adding x= #{move[0]} and y = #{move[1]}"
          insert_child(root, move[0], move[1])

        end

      end

    
      root.children.each do |child|

        build_tree(child)

      end
    end

  end

  def gen_possible_move(root)
    x = root.x
    y = root.y
    [[x-1, y-2],
     [x+1, y-2],
     [x-1, y+2],
     [x+1, y+2],
     [x-2, y-1],
     [x+2, y-1],
     [x-2, y+1],
     [x+2, y+1]]

  end

  def is_valid_move?(move)
    (0..7).include?(move[0]) && (0..7).include?(move[1])
  end

  def inspect
    puts "Your tree has #{@root.children.length} and a max depth of #{@max_depth}"
  end

end


class KnightSearcher

  def initialize(tree)
    @tree = tree
    # print "our tree #{@tree.root.children}"
  end

  # def bfs_for(target_coords)
  #   # node = @tree.root
  #   queue = []
  #   queue << @tree.root

  #   until queue.empty?
  #     node = queue.shift
  #     puts "node corrds x = #{node.x} and y= #{node.y}"
  #     if node.x == target_coords[0] && node.y == target_coords[1]

  #       return node.depth
  #     else
  #       node.children.each do |child|
  #         queue << child
  #       end
  #     end
  #   end
  #   print "queue #{queue}\n\n\n"
  #   print "node depth is #{node.depth}"
  # end


  def bfs_for(target_coords)

    queue = [[@tree.root]]

    until queue.empty?

      path = queue.shift

      node = path[-1]

      if node.x == target_coords[0] && node.y == target_coords[1]
        puts "#{node.depth} Moves:"
        path.each {|n| puts "[#{n.x}, #{n.y}]"}
        return
      else
        node.children.each do |child|
          new_path = path.dup
          new_path << child
          queue << new_path
        end
      end

    end

  end



  # def dfs_for(target_coords)
  #   stack = []
  #   stack << @tree.root

  #   until stack.empty?
  #     node = stack.pop
  #     puts "node corrds x = #{node.x} and y= #{node.y}"
  #     if node.x == target_coords[0] && node.y == target_coords[1]
  #       return node.depth
  #     else
  #       node.children.each do |child|
  #         stack<<child
  #       end
  #     end
  #   end
  #   print "node depth is #{node.depth}"

  # end

  def dfs_for(target_coords)

    stack = [[@tree.root]]

    until stack.empty?

      path = stack.pop
      node = path[-1]

      if node.x == target_coords[0] && node.y == target_coords[1]
        puts "#{node.depth} Moves:"
        path.each {|n| puts "[#{n.x}, #{n.y}]"}
        return
      else
        node.children.each do |child|
          new_path = path.dup
          new_path << child
          stack << new_path
        end
      end

    end

  end



end








