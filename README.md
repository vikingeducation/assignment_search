# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Chad Lucas

What data structure is used to implement DFS?
Stack

What data structure is typically used to implement BFS?
Queue

Which one can be done recursively? (the clue should be the data structure)
DFS

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS

What is the difference between a tree and a graph?
A tree has a strict hierarchical structure

Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

Searching the same tree using BFS.
put initial node in queue
put root node in queue and retrurn if matches initial node
if not add its children to the end of the queue
dequeue node and check if match continue dequeue until queue is empty

Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
Searching the same graph using BFS.
Select first vertex enqueue vertex 
dequeue first node and check to see if value is equal to search value 
if so return vertex
else enqueue all current vertex children and repeat.


