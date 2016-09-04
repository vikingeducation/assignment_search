#Knights Travails, a deeper look at chess move trees

##Description
This is a deep dive into the chess board to understand the most effecient way for a knight piece to traverse each tile of a chess board.

##Depth First Search(DFS) and Breadth First Search (BFS)
What data structure is used to implement DFS?
Stack
What data structure is typically used to implement BFS?
Queue
Which one can be done recursively? (the clue should be the data structure)
DFS
Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.? BFS
What is the difference between a tree and a graph? Nodes in a tree can only have one parent, whereas nodes can have unlimited parents and children( though they're not called that in graphs
)
Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

- Put Root in Stack
- Until Root does not have a left or right child (depending on your criteria)
  - Check for match
  - Put Root's First Child (left or right, or whatever your criteria is) in Stack 
- Check for match (this is the end of a branch)

Searching the same tree using BFS.
- Put Root in Queue
- Put Root's Children in Queue
- Check root for match
- Check First Child for match
- Put First Child's children in queue
- Repeat with other children
- Repeat until match is found or there are no children left to search


Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
- Start at first vertex
- Compare value with each link of that vertex
- If not found, move on to next vertex
- Continue until match is found or you've exhausted the vertices

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)


Searching the same graph using BFS.
- You look at the first vertex, add it's children to queue, then pop off the front of the list and compare.
- Keep repeating until you've found your match or gone through every possibility 
