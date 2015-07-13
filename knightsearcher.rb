require_relative 'tree_builder'

class KnightSearcher
  attr_reader :search, :tree

  def initialize(tree)
    @tree = tree
  end

  def bfs_for (final_dest)
    counter = 0
    current_level = @tree.root
    queue = [current_level]
    @family = {}
      until queue.empty?
        temp = queue.shift
        if temp.x == final_dest[0] && temp.y == final_dest[1]
          find_path(temp, @family )
          break
        end
        
        temp.children.each do |child|

          @family[child] = temp
          queue << child  
        end
      end
    

  end

  def find_path(child,family)
    arr = [[child.x,child.y]] 

    until child == @tree.root
      coords = @family[child] 
   
      arr << [coords.x, coords.y]
       child =  @family[child]
    end
    print_moves(arr)
  end


  def print_moves(arr)
    puts "moves:"
    arr.length.downto(0) do|x|
      p arr[x]
    end
   

  end

end