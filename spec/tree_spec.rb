require 'tree'
require 'spec_helper.rb'
describe MoveTree do
  let(:parent_node){ Move.new(3, 3, 0) }
  let(:mytree){ MoveTree.new([3, 3]) }

  context '#child_nodes' do
    it 'create children' do
      mytree.child_nodes( parent_node )
      expect(parent_node.children.length).to eq(8)
    end
  end

  context '#populate_nodes' do
    it 'create the tree' do
      expect(mytree.root.children.length).to eq(8)
    end

    it 'has right depth' do
      expect(mytree.root.children[0].children[0].depth).to eq(2)
    end

  end

end
