require 'move_tree'

describe MoveTree do

  let(:mid){MoveTree.new([4,4], 1)}
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
  end
end
