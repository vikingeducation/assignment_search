require "move_tree"

describe MoveTree do 

  let(:tree){ MoveTree.new([3, 3], 2) }

  describe "#initialize" do 
    it "takes an input starting_position and creates a starting square node with thsoe coordinates" do
      expect(tree.starting_square.x).to eq(3)     
    end

    it "takes an input starting_position and saves it to an instance variable" do 
      expect(tree.starting_position).to eq([3, 3])
    end

    it "takes an input max_depth and saves it to an instance variable" do 
      expect(tree.max_depth).to eq(2)
    end

    it "raises an arguement error if starting_position is not an array" do 
      expect{ MoveTree.new(1,1) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_children" do 
    it "sets the children as an array with 8 move structs" do 
      tree.add_children(tree.starting_square)
      expect(tree.starting_square.children.length).to eq(8)
    end

    it "raises an argument error if input is not a struct" do 
      expect{ tree.add_children(1) }.to raise_error(ArgumentError)
    end

    it "sets children as 2 squares if parent is a corner square" do
      fake_square = double(:node => Move.new(0, 7))
      tree.add_children(fake_square.node)
      expect(fake_square.node.children.length).to eq(2)      
    end
  end

  describe "#add_more_children" do 
    it "sets the 2nd deep 1st child x coordinate as 0" do 
      tree.add_children(tree.starting_square)
      tree.add_more_children
      expect(tree.starting_square.children[0].children[0].x).to eq(0)
    end
  end

end




