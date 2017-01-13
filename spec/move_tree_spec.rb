require 'move_tree'

describe MoveTree do
  let(:tree_1) { MoveTree.new(3, 3, 0) }
  let(:tree_2) { MoveTree.new(2, 4, 1) }
  let(:tree_3) { MoveTree.new(7, 7, 2) }

  describe '#initialize' do
    it "should raise an error 'x value out of range' if x is not between 0 and 7" do
      expect { MoveTree.new(-1, 4, 1) }.to raise_error('x value out of range')
    end

    it "should raise an error 'y value out of range' if y is not between 0 and 7" do
      expect { MoveTree.new(0, 8, 1) }.to raise_error('y value out of range')
    end

    it "should raise an error 'max depth must be >= 0' if max_depth is less than 0" do
      expect { MoveTree.new(0, 0, -1) }.to raise_error('max depth must be >= 0')
    end

    it 'should create a root node that properly represents the tree' do
      expect(tree_3.root.children.size).to eq(2)
      tree_3.root.children.each do |child|
        expect(child.parent).to eq(tree_3.root)
        expect(child.depth).to eq(1)
        expect(child.children.size).to eq(6)
        child.children.each do |c2|
          expect(c2.parent).to eq(child)
          expect(c2.depth).to eq(2)
          expect(c2.children).to be_nil
        end
      end
    end
  end

  describe '#count_nodes' do
    it 'should return the number of nodes in the tree below specified node' do
      expect(tree_1.count_nodes(tree_1.root)).to eq(1)
      expect(tree_2.count_nodes(tree_2.root)).to eq(1+8)
      expect(tree_3.count_nodes(tree_3.root)).to eq(1+2+12)
    end
  end
end