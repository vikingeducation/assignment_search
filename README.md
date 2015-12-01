# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

by Sia Karamalegos

## BFS vs DFS


1. What data structure is used to implement DFS?

  stacks

2. What data structure is typically used to implement BFS?

  queues

3. Which one can be done recursively? (the clue should be the data structure)

  DFS

4. Which one would you use to print a list of all the nodes in a tree, starting with depth 1, then depth 2, then depth 3 etc.?

  BFS

## Pseudocoding Exercises

1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

  1. Put the root node on the stack.
  2. Check the top node on the stack. If it matches, return it.  If not, peek at the children and put the 'worst' child on the stack first followed by the other child. Keep repeating this step until a match is found or no nodes left in queue.

2. Searching the same tree using BFS.

  1. Put the root node in the queue.
  2. Check the first node in the queue. If it matches, return it.  If not, add its children to the queue. Keep repeating this step until a match is found or no nodes left in queue.
