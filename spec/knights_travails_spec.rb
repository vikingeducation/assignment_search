require 'knights_travails'
require 'rspec'

describe MoveTree do
let(:basic_tree) { MoveTree.new([0, 0])}
  describe '#new' do
    it 'sets max_depth' do
      expect(basic_tree.max_depth).to eq(1)
    end

    it 'starts with 0 move nodes' do
      expect(basic_tree.move_nodes([0,0])).to eq(0)
    end
  end

  describe '#move_nodes' do
    it 'returns an integer' do
      expect(basic_tree.move_nodes([1,1])).to be_an(Integer)
    end
  end

  describe '#off board' do 
    it 'returns whether position is off board' do
      expect(basic_tree.off_board?([5,3])).to be true
      expect(basic_tree.off_board?([3,7])).to be true
      expect(basic_tree.off_board?([3,3])).to be false
    end
  end
end