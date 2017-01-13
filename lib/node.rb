module Node
  Move = Struct.new(:x, :y, :depth, :children, :parent) do
    def insert_valid_knight_moves(depth_level)
      if children.nil?
        self.children = []
        if x + 1 < 8
          children << Move.new(x + 1, y + 2, depth_level, nil, self) if y + 2 < 8 
          children << Move.new(x + 1, y - 2, depth_level, nil, self) if y - 2 > -1
        end
        if x + 2 < 8
          children << Move.new(x + 2, y + 1, depth_level, nil, self) if y + 1 < 8 
          children << Move.new(x + 2, y - 1, depth_level, nil, self) if y - 1 > -1 
        end
        if x - 1 > -1
          children << Move.new(x - 1, y + 2, depth_level, nil, self) if y + 2 < 8 
          children << Move.new(x - 1, y - 2, depth_level, nil, self) if y - 2 > -1
        end
        if x - 2 > -1
          children << Move.new(x - 2, y + 1, depth_level, nil, self) if y + 1 < 8 
          children << Move.new(x - 2, y - 1, depth_level, nil, self) if y - 1 > -1
        end
      else
        children.each do |child|
          child.parent = self
          child.insert_valid_knight_moves(depth_level)
        end
      end
    end
  end
end