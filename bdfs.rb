require_relative 'move_trees.rb'

#t = MoveTrees.new([3,3], 5)

class Knightsearcher
   attr_accessor :tree
   def initialize(t)
       @tree = t.tree
   end
   
   def bfs(position)
      #printmove(@tree.path) if @tree.x = position[0] && @tree.y = position[1]
      queue = [] << @tree
      while queue.length != 0 do
         if [queue[0].x, queue[0].y] == position
             return queue[0].path
         elsif [queue[0].x, queue[0].y] != position
             if queue[0].children != nil
                    queue[0].children.each do |child|
                    queue << child 
                    end
             end
         queue.shift
         end
      end
      return "can not find"
   end
   
   def dfs(position)
      stack = [] << @tree
      while stack.length != 0 do
         if stack[stack.length - 1].x == position[0] && stack[stack.length - 1].y == position[1]
            return stack[stack.length - 1].path
         else
            last = stack[stack.length - 1]
            stack.pop
            if last.children != nil
               last.children.each do |child|
                  stack << child
               end
            end
         end
      end
      return "not found"
   end
   
    
end


def timetest
   m = MoveTrees.new([3, 3], 10)
   k = Knightsearcher.new(m)
   t1 = Time.now
   1.upto(5) do |x|
      1.upto(5) do |y|
         k.bfs([x, y])
      end
   end
   t2 = Time.now
   delta1 = t2 - t1
   t3 = Time.now
   1.upto(5) do |x|
      1.upto(5) do |y|
         k.dfs([x, y])
      end
   end
   t4 = Time.now
   delta2 = t4 - t3
   puts "BFS use #{delta1}"
   puts "DFS use #{delta2}"
end
#print k.bfs([2,3])

timetest
