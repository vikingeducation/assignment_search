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

end