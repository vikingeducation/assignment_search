Node = Struct.new(:x, :y, :parent, :depth, :children) do
 def add_child
   new_depth = self.depth + 1
   # up and left
   if (self.x - 1).between?(0,7) && (self.y - 2).between?(0,7)
     x, y = (self.x - 1), (self.y - 2)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # up and right
   if (self.x + 1).between?(0, 7) && (self.y - 2).between?(0, 7)
     x, y = (self.x + 1), (self.y - 2)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # down and left
   if (self.x - 1).between?(0, 7) && (self.y + 2).between?(0, 7)
     x, y = (self.x - 1), (self.y + 2)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # down and right
   if (self.x + 1).between?(0, 7) && (self.y + 2).between?(0, 7)
     x, y = (self.x + 1), (self.y + 2)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # right and up
   if (self.x + 2).between?(0, 7) && (self.y - 1).between?(0, 7)
     x, y = (self.x + 2), (self.y - 1)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # right and down
   if (self.x + 2).between?(0, 7) && (self.y + 1).between?(0, 7)
     x, y = (self.x + 2), (self.y + 1)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # left and up
   if (self.x - 2).between?(0, 7) && (self.y - 1).between?(0, 7)
     x, y = (self.x - 2), (self.y - 1)
     self.children << Node.new(x, y, self, new_depth, [])
   end
   # left and down
   if (self.x - 2).between?(0, 7) && (self.y + 1).between?(0, 7)
     x, y = (self.x - 2), (self.y + 1)
     self.children << Node.new(x, y, self, new_depth, [])
   end
 end
end

class Knight

  attr_reader :max_depth, :current, :depth

  def initialize(start_coord, depth)
  	x, y, @max_depth, @depth = start_coord[0], start_coord[1], depth, 0
  	@root = Node.new(x, y, nil, @depth, [])
  	@root.add_child
  	add_children(@root.children, @depth)
  end

  def add_children(level, depth)
  	depth += 1
  	if depth < @max_depth
  	  level.each do |node|
  	  	node.add_child
		    add_children(node.children, depth)
  	  end
  	end
  end


end

test = Knight.new([2,1], 3)
