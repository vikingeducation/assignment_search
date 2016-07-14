# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

David J and Vishal

What data structure is used to implement DFS? Stack

What data structure is typically used to implement BFS? Queue

Which one can be done recursively? (the clue should be the data structure) Stack

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
What is the difference between a tree and a graph? BFS

Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

def search_node(start_node, node you're searching for)
if start node is nil, return
start at the root, pick a child and check it. return if this is the one you're looking for
if not found, pick a child of that child and check it. continue until you find the solution or you reach a leaf (no children)
when you reach a leaf, go back up to a node with a child that you have not checked yet and repeat for that child.


Searching the same tree using BFS.

Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

Searching the same graph using BFS.

