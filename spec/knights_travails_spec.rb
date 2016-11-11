require 'knights_travails'
require 'rspec'

describe MoveTree do
let(:basic_tree) { MoveTree.new([0, 0])}
	describe '#new' do
		it 'sets max_depth' do
			expect(basic_tree.max_depth).to eq(1)
		end

		it 'starts with 0 move nodes' do
			expect(basic_tree.move_nodes).to eq(0)
		end

	end
end