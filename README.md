# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Justin Mullis' fork

1. What data structure is used to implement DFS?
Stack

2. What data structure is typically used to implement BFS?
Queue

3. Which one can be done recursively? (the clue should be the data structure)
BFS

4. Which one would you use to print a list of all the nodes in a tree, starting with depth 1, then depth 2, then depth 3 etc.?
BFS

DFS process
Begin at root node
Add node to stack
Loop Start
Check current node for match
-- If match, return
-- If no match, mark as searched
--- Add child to stack, unless its been searched
--- If no child, remove node from stack
Loop End


BFS process
Queue = [root]

Until queue.empty?
  Dequeue top node
  search 
  mark as searched
  for each adjacent node
    add to the queue unless queue.includes?
    or marked as searched
  end
end