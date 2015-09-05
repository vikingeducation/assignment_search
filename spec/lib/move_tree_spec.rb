require 'spec_helper'

describe MoveTree do
	let(:t){MoveTree.new([0, 0], 1)}

	describe '#initialize' do
		it 'takes a start and depth parameter' do
			expect do
				t
			end.to_not raise_error
		end

		it 'calls #build_tree' do
			expect(t.tree).to_not be_nil
		end
	end

	describe '#start=' do
		it 'is an accessor' do
			expect do
				t.start = [0, 0]
			end.to_not raise_error
		end

		it 'calls #build_tree' do
			expect(t).to receive(:build_tree)
			t.start = [0, 0]
		end
	end

	describe '#depth=' do
		it 'is an accessor' do
			expect do
				t.depth = 1
			end.to_not raise_error
		end

		it 'calls #build_tree' do
			expect(t).to receive(:build_tree)
			t.depth = 1
		end
	end

	describe '#tree' do
		it 'is a Square struct' do
			expect(t.tree).to be_an_instance_of(Square)
		end

		it 'has children at all depths up to the given depth' do
			t.depth = 0
			c = t.tree.children.first
			expect(c).to be_nil
		end
	end
end