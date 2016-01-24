require 'move_tree'

describe MoveTree do

  let(:mid){MoveTree.new([4,4], 1)}
  let(:mid_two){MoveTree.new([4,4], 2)}
  let(:bottom_left){MoveTree.new([0,0], 1)}
  let(:top_left){MoveTree.new([0,7], 1)}
  let(:top_right){MoveTree.new([7,7], 1)}
  let(:bottom_right){MoveTree.new([7,0], 1)}

  describe "#initialize" do
    it "raises an error if two arguments aren't given" do
      expect{MoveTree.new}.to raise_error
    end
=begin
    it "calls #create_children" do
      allow(mt).to receive(:create_children)
      expect(mt).to receive(:create_children)
      mt
    end
=end
  end

  describe "#create_children" do
    it "calls #add_child_top_right" do
      expect(mid).to receive(:add_child_top_right)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_right_top" do
      expect(mid).to receive(:add_child_right_top)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_right_bottom" do
      expect(mid).to receive(:add_child_right_bottom)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_bottom_right" do
      expect(mid).to receive(:add_child_bottom_right)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_top_left" do
      expect(mid).to receive(:add_child_top_left)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_bottom_left" do
      expect(mid).to receive(:add_child_bottom_left)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_left_bottom" do
      expect(mid).to receive(:add_child_left_bottom)
      mid.create_children(mid.root_node)
    end

    it "calls #add_child_left_top" do
      expect(mid).to receive(:add_child_left_top)
      mid.create_children(mid.root_node)
    end

    it "does not receive #add_child_top_right" do
      expect(top_left).to_not receive(:add_child_top_right)
      top_left.create_children(top_left.root_node)
    end

    it "does not receive #add_child_top_right" do
      expect(bottom_right).to_not receive(:add_child_top_right)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_right_top" do
      expect(top_left).to_not receive(:add_child_right_top)
      top_left.create_children(top_left.root_node)
    end

    it "does not receive #add_child_right_top" do
      expect(bottom_right).to_not receive(:add_child_right_top)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_right_bottom" do
      expect(bottom_left).to_not receive(:add_child_right_bottom)
      bottom_left.create_children(bottom_left.root_node)
    end

    it "does not receive #add_child_right_bottom" do
      expect(bottom_right).to_not receive(:add_child_right_bottom)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_bottom_right" do
      expect(bottom_left).to_not receive(:add_child_bottom_right)
      bottom_left.create_children(bottom_left.root_node)
    end

    it "does not receive #add_child_bottom_right" do
      expect(bottom_right).to_not receive(:add_child_bottom_right)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_top_left" do
      expect(bottom_left).to_not receive(:add_child_top_left)
      bottom_left.create_children(bottom_left.root_node)
    end

    it "does not receive #add_child_top_left" do
      expect(top_right).to_not receive(:add_child_top_left)
      top_right.create_children(top_right.root_node)
    end

    it "does not receive #add_child_bottom_left" do
      expect(bottom_right).to_not receive(:add_child_bottom_left)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_bottom_left" do
      expect(top_left).to_not receive(:add_child_bottom_left)
      top_left.create_children(top_left.root_node)
    end

    it "does not receive #add_child_bottom_left" do
      expect(bottom_right).to_not receive(:add_child_bottom_left)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_bottom_left" do
      expect(top_left).to_not receive(:add_child_bottom_left)
      top_left.create_children(top_left.root_node)
    end

    it "does not receive #add_child_left_bottom" do
      expect(bottom_right).to_not receive(:add_child_left_bottom)
      bottom_right.create_children(bottom_right.root_node)
    end

    it "does not receive #add_child_left_bottom" do
      expect(top_left).to_not receive(:add_child_left_bottom)
      top_left.create_children(top_left.root_node)
    end

    it "does not receive #add_child_left_top" do
      expect(top_right).to_not receive(:add_child_left_top)
      top_right.create_children(top_right.root_node)
    end

    it "does not receive #add_child_left_top" do
      expect(bottom_left).to_not receive(:add_child_left_top)
      bottom_left.create_children(bottom_left.root_node)
    end
=begin
    # This will need further testing.
    it "calls #create_children" do
      expect(mid).to receive(:create_children).at_least(1).times
      mid.create_children(mid.root_node)
    end
=end
    it "makes grandchildren if depth is 2" do
      expect(mid_two.root_node.children[0].children[0]).to_not eq(nil)
    end

    it "stops at grandchildren if depth is 2" do
      expect(mid_two.root_node.children[0].children[0].children[0]).to eq(nil)
    end

    it "sets the depth of children to 1" do
      expect(mid_two.root_node.children[0].depth).to eq(1)
    end

    it "sets the depth of grandchildren to 2" do
      expect(mid_two.root_node.children[0].children[0].depth).to eq(2)
    end
  end
end
