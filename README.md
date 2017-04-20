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
Graphs are fully unconstrained as to which vertices can connect to which ones. Trees have a strictly hierarchical structure where each node has a defined parent.

Pseudocode the following processes:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

Push the root node onto the stack
Pop a node off the stack
Return if is the search value
Else look at any unsearched children
Push "worst" nodes onto the stack first
Push "best" nodes onto the stack last
Repeat from step 2 until search value is found or no nodes left
Searching the same tree using BFS.

Starting at the root node
Return if is the search value
Else look at all the direct children of current node
Repeat from step 2 until search value is found or no nodes left

