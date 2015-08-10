Square = Struct.new(:x,:y,:path,:depth, :children)

class MoveTrees
   attr_accessor :tree, :depth, :max_depth, :nodes
   
   def initialize(position, depth)
       @max_depth = depth
       @depth = 0
       @tree = Square.new(position[0], position[1], [position], @depth, nil)
       @nodes = [1, 0]
       @tree.children = makechildren(position, [position], @depth)
   end
   
   def makechildren(position, path, depth)
       dep = depth + 1
       return nil if dep > @max_depth
       array = []
       child_array = []
       [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].each do |pair|
            if square_verify([position[0]+pair[0], position[1]+pair[1]], path)
               array << [position[0]+pair[0], position[1]+pair[1]] 
            end
       end
       @nodes[0] += array.length
       #print array
       array.each do |pos|
          son =  Square.new(pos[0], pos[1], path + [pos], dep, nil)
          child_array << son
       end
       #print child_array
       child_array.each do |child|
           child.children = makechildren([child[0], child[1]], child.path, dep)
       end
       @nodes[1] = [dep + 1, nodes[1]].max
       
       return child_array
   end
   
   def square_verify(position, path)
      return true if [1,2,3,4,5].include?(position[0]) && [1,2,3,4,5].include?(position[1]) && !path.include?(position)
      return false
   end
   
   def inspect
      puts @nodes[0].to_s + "  nodes"
      puts @nodes[1].to_s + "  depth"
   end
    
end

#m = MoveTrees.new([1, 1], 10)
#puts m.tree
#m.inspect
