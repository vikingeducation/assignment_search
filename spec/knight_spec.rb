require "knight.rb"

describe MoveTree do

  describe "#initialize" do
    it "constructs a tree of potential moves from a given position by using
    a series of Move structs" do
      mt = MoveTree.new([3, 3], 1)
      expect(mt.is_a? MoveTree).to be(true)
    end
  end

  describe ".moves_for" do
    it "returns an array of moves" do
      root = Move.new(0, 0, 0)
      moves = MoveTree.moves_for(root, 1)
      expect(moves[0]).to eq(Move.new(2, 1, 1, nil, root))
      expect(moves[1]).to eq(Move.new(1, 2, 1, nil, root))
      expect(moves.length).to eq(2)
    end
  end

  describe ".build_tree!" do
    let(:root){ Move.new(0, 0, 0) }
    it "builds a tree of moves according to the max depth 0" do
      tr = MoveTree.build_tree!(root, 0, 0)
      expect(tr).to eq(root)
    end

    it "builds a tree of moves according to the max depth 1" do
      tr = MoveTree.build_tree!(root, 0, 1)
      expect(tr.children[0]).to eq(Move.new(2, 1, 1, nil, root))
    end
  end

  describe ".length" do
    it "returns the length of the tree minus the root node" do
      expect(MoveTree.length(MoveTree.new([3, 3], 1))).to eq(8)
    end
  end

  describe "#inspect" do
    it "returns a description of # of nodes and depth" do
      tr = MoveTree.new([3, 3], 1)
      expect(tr.inspect).to eq(
      "Your tree has 9 Move nodes and a maximum depth of 1")
    end
  end

end
