# assignment_search
Marco?  Polo!

## Bideo Wego

### Q&A

1. What data structure is used to implement DFS?

	A graph or tree.

1. What data structure is typically used to implement BFS?

	A graph or tree.

1. Which one can be done recursively? (the clue should be the data structure)

	A DFS and BFS can both be done recursively. It is possible to treat each first node as the beginning of a new recursive block, performing the same operations on it's children.

1. Which one would you use to print a list of all the nodes in a tree, starting with depth 1, then depth 2, then depth 3 etc.?

	The BFS is best suited for this, this is because the printing of each depth can be done during the natural path of the BFS algorithm.

### Pseudocode the following processes:

1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

	1. Push the root node onto the stack
	1. Pop a node off the stack
	1. Return if is the search value
	1. Else look at any unsearched children
	1. Push "worst" nodes onto the stack first
	1. Push "best" nodes onto the stack last
	1. Repeat from step 2 until search value is found or no nodes left

1. Searching the same tree using BFS.

	1. Starting at the root node
	1. Return if is the search value
	1. Else look at all the direct children of current node
	1. Repeat from step 2 until search value is found or no nodes left

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
