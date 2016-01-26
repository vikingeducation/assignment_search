require 'knight_searcher'

describe KnightSearcher do

  let(:ks_bot_left){KnightSearcher.new(MoveTree.new([0,0], 1))}

  describe "#initialize" do

    it "raises an error if argument is not given" do
      expect{KnightSearcher.new}.to raise_error
    end

  end

  describe "#bfs_for" do

    it "raises an error if argument is not given" do
      expect{ks_bot_left.bfs_for}.to raise_error
    end

    it "does not raise error if one argument is given" do
      expect{ks_bot_left.bfs_for([3,3])}.to_not raise_error
    end

    it "calls #output_results_for_bfs" do
      allow(ks_bot_left).to receive(:output_results_for_bfs)
      expect(ks_bot_left).to receive(:output_results_for_bfs)
      ks_bot_left.bfs_for([3,4])
    end

  end

  describe "#output_results_for_bfs" do

    it "outputs a standard message if answer can't be found" do
      expect { ks_bot_left.output_results_for_bfs([]) }.to output("Sequence does not exist in that tree, increase the depth and try again!\n").to_stdout
    end

    it "calls the #sequece_of_moves method if the queue isn't empty" do
      allow(ks_bot_left).to receive(:sequence_of_moves).and_return([1,1])
      expect(ks_bot_left).to receive(:sequence_of_moves)
      ks_bot_left.output_results_for_bfs([(MoveTree.new([0,0], 1)).root_node])
    end

  end

  describe "#sequence_of_moves" do

    it "does not raises an error if ONE argument is not given" do
      expect{ks_bot_left.sequence_of_moves(MoveTree.new([0,0], 1).root_node)}.to_not raise_error
    end

    it "returns an array" do
      expect(ks_bot_left.sequence_of_moves(MoveTree.new([0,0], 1).root_node)).to be_a Array
    end

    it "returns [[0,0]]" do
      expect(ks_bot_left.sequence_of_moves(MoveTree.new([0,0], 1).root_node)).to eq [[0,0]]
    end

  end

  describe "#dfs_for" do

    it "does not raise an error if ONE argument is given" do
      expect{ ks_bot_left.dfs_for([1,1]) }.to_not raise_error
    end

    it "calls #output_results_for_dfs" do
      allow(ks_bot_left).to receive(:output_results_for_dfs)
      expect(ks_bot_left).to receive(:output_results_for_dfs)
      ks_bot_left.dfs_for([3,4])
    end

  end

  describe "#output_results_for_dfs" do

    it "outputs a standard message if answer can't be found" do
      expect { ks_bot_left.output_results_for_dfs([]) }.to output("Sequence does not exist in that tree, increase the depth and try again!\n").to_stdout
    end

    it "calls the #sequece_of_moves method if the queue isn't empty" do
      allow(ks_bot_left).to receive(:sequence_of_moves).and_return([1,1])
      expect(ks_bot_left).to receive(:sequence_of_moves)
      ks_bot_left.output_results_for_dfs([(MoveTree.new([0,0], 1)).root_node])
    end

  end

end