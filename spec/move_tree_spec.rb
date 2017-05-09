require_relative '../lib/move_tree'

RSpec.describe MoveTree do
  context 'Starting position is (0,0)' do
    let(:starting_pt) { [0, 0] }

    context 'depth is 1' do
      let(:tree) { MoveTree.new(starting_pt, 1) }

      it 'has a root node' do
        expect(tree.starting_move.x).to eq 0
        expect(tree.starting_move.y).to eq 0
        expect(tree.starting_move.depth).to eq 0
      end

      it 'has 2 children' do
        children = tree.starting_move.children
        expect(children.size).to eq 2

        move1, move2 = *children
        expect([move1.x, move1.y]).to match [1, 2]
        expect([move2.x, move2.y]).to match [2, 1]
      end
    end

    context 'depth is 2' do
      let(:tree) { MoveTree.new(starting_pt, 2) }

      it 'sets depth of root children to 1' do
        children = tree.starting_move.children
        expect(children.size).to eq 2
        expect(children.map(&:depth)).to eq [1, 1]
      end

      it 'sets the depth of the root children children to 2' do
        root_children = tree.starting_move.children
        move1, move2 = *root_children

        move1.children.each do |c|
          expect(c.depth).to eq 2
          expect(c.children).to be_nil
        end

        move2.children.each do |c|
          expect(c.depth).to eq 2
          expect(c.children).to be_nil
        end
      end

      it 'has a root with children who have children' do
        root_children = tree.starting_move.children
        move1, move2 = *root_children

        expect(move1.children.size).to eq 6
        expect(move2.children.size).to eq 6
      end
    end
  end

  describe '#inspect' do
    it 'returns info about the tree' do
      tree = MoveTree.new([0,0], 2)
      expect(tree.inspect).to eq 'Your tree has 15 Move nodes and a max depth of 2.'
    end
  end
end