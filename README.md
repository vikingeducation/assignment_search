# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

by Sia Karamalegos

## What's Here?

The assignment was to find the set of Knight's moves to get from one chess board coordinate to another using both Breadth-First Search and Depth-First Search. The instructions stated to create a 'move tree' of all possible moves for a knight with a certain max depth of moves then to run a 'knight searcher' to get the answer.

I found that the move tree was trying to represent what is actually a graph in tree form which created a lot of excess computations. By re-designing the data representation of the chess board and knight moves as a graph, I was able to significantly decrease the search time.

The files for the original instructions include *move_tree.rb* and *knight_searcher.rb*. Run `ruby knight_searcher.rb` to see the results using this method. The depth is currently limited at 5. Increasing the depth increases time exponentially. A depth of 9 gives 3.7 million nodes for the move tree.

The files for the graph version of the board and knight's moves are  primarily *edge_list.rb* and *graph_searcher.rb*.  Run `ruby graph_searcher.rb` to see the results using this method.  The depth is currently unlimited and still runs quite fast.

To see an analysis of the tree vs graph creation as well as each type of search, run `ruby benchmark.rb`.

## BFS vs DFS Questions

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
