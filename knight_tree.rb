Square = Struct.new(:x, :y, :depth, :children)

class KnightSearcher

  def initialize(tree)

    @tree=tree
    @max_depth=@tree.max_depth
    #bfs_for(3,4)
    dfs_for(1,2)
  end


  def dfs_for(target_x,target_y,kid=@tree.root,parent=[@tree.root],d=1)

    kid.children.each do |child|
      parent<<child 
      d+=1
      if child.x == target_x && child.y == target_y
        
        puts "Target found [#{child.x},#{child.y}] on depth #{child.depth}"
        parent.uniq.each do |node|
          puts "Parent depth is #{node.depth} with coords [#{node.x},#{node.y}]"
        end
        return
      end

      dfs_for(target_x,target_y,child,parent,d) unless d >= @max_depth
      parent.pop
    end
    puts "Didn't find anything"
  end
    

  

  def bfs_for(target_x,target_y)
    moves=[]
    moves<<[@tree.root.x,@tree.root.y, @tree.root]
    #[[x,y,Obj] [x,y,Obj] []]
     parents=[]
     parents<<@tree.root
    loop do

      t=moves.shift[2]
      #puts "t.children is #{t}"
      #puts "#{t.depth} depth : [#{t.x},#{t.y}]"
      parents<<t
      t.children.each do |kid|
          if target_x==kid.x && target_y==kid.y
            
            puts "#{kid.depth}"
            puts "Target found [#{kid.x},#{kid.y}] on depth #{kid.depth}"

            parents.uniq.each do |node|
              puts "Parent depth is #{node.depth} with coords [#{node.x},#{node.y}]"
            end
             return 
          end
        moves << [kid.x,kid.y, kid]
        parents.pop if parents.size>2 && parents[-2].depth == parents[-1].depth
      end
      break if moves.empty?
    end
    
  end

end



class MoveTree
  attr_reader :root, :max_depth
  def initialize(initial_x, initial_y, max_depth = 2)

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
    @root = Square.new(initial_x, initial_y, 0, [])

    build_children!(@root,1)
    build_tree(@root)
    #print_tree(@root)
    #count_children(@root)
  end


  def build_tree(square, d=1)

    arr_parents = square.children
    d += 1
    arr_parents.each do |child|
      build_children!(child, d)
      build_tree(child,d) unless d >= @max_depth
    end
  end


  def print_arr(arr)
    arr.each do |kid|
      puts "[#{kid.x},#{kid.y}]"
    end
  end


  def build_children!(parent, depth)
    #puts "--------------Depth #{depth}---------------------"
    @move_combinations.each do |move|
      new_x =parent.x + move[0]
      new_y = parent.y + move[1]
      if new_x <= @board_size &&
        new_y <= @board_size &&
        new_x > 0 &&
        new_y > 0
        parent.children << Square.new(new_x, new_y, depth, [])  
        #puts "[#{new_x}, #{new_y}, depth is #{depth}]"
      end

    end
    #puts "-----------------------------------"
  end

  def print_tree (square,d=0)
    queue=[]
    queue<<square
   
    loop do

      t=queue.shift
      puts "#{t.depth} depth : [#{t.x},#{t.y}]"
      
      t.children.each do |kid|
        queue << kid 

      end
      break if queue.empty?

    end
    
  end

    
  

  def count_children(square,d=0,memo=0)
    arr_parents=square.children

    arr_parents.each do |child|
        memo+=child.children.length
        d+=1
        count_children(child,d,memo) unless d > @max_depth
    end

    puts memo


  end


end

tree=MoveTree.new(3,3,3)
KnightSearcher.new(tree)






