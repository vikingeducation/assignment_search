# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Kelsey and Andrew

1. What data structure is used to implement DFS?

  A stack. We start by putting the root node on the stack. We pop it off the stack, examine it, then we put its children on the stack from worst to best. Now the best child node is at the top, and we iterate through until we reach a leaf. If we haven't found the object yet, then the next best child will be at the top of the stack, and we follow the same procedure.

2. What data structure is typically used to implement BFS?

  A queue. We start by putting the root node on the queue. We pop it off, examine it, and if it's not the solution we add its children to the queue. Then we repeat the same algorithm for each of the children in the queue, and continue until a solution is found.

3. Which one can be done recursively? (the clue should be the data structure)

  DFS can be done recursively, since it's only dealing with one child node at a time, and not a whole row at once. Each time you go down to a child, everything from that point on becomes the new "tree" and is structurally similar to the overall tree. This type of symmetry is a trademark of recursive problems, where every step in a recursion deals with a miniature version of the same overall problem/scheme.

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?

  BFS, since we need to be able to print all nodes of a given depth in sequence.

5. What is the difference between a tree and a graph?

  A tree is a specific type of graph. It only has directed edges, and each node has one parent. There is also one root node that has no parent. In a binary tree, each node can have at most 2 children.