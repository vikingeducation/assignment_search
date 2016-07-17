require_relative ('knights_travail')

class KnightSearcher
  def initialize(move_tree)
    @root = move_tree.root
  end

  def bfs_for(target_coords)
    queue = [@root]

    until queue.empty?

      #dequeue
      move = queue.shift

      if [move.x, move.y] == target_coords
        puts "DFS"
          move.parents.each do |parent|
            puts "[#{parent.x}, #{parent.y}]"
          end
          puts "[#{move.x}, #{move.y}]"

        return
      #enqueue
      else
        move.children.each do |child|
          queue << child
        end
      end
    end
    puts 'No match found. Try increasing max tree depth'

  end

  def dfs_for(target_coords, root=@root)
    return if root.children == []

    root.children.each do |child|
      if [child.x, child.y] == target_coords
        puts "BFS"
        child.parents.each { |parent| puts "[#{parent.x}, #{parent.y}]" }
        puts "[#{child.x}, #{child.y}]"
        return
      end

      dfs_for(target_coords, child)

    end
  end
end

tree = MoveTree.new([4, 4], 2)
ks = KnightSearcher.new(tree).bfs_for([4,0])
ks = KnightSearcher.new(tree).dfs_for([4,0])
