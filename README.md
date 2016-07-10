# assignment_search
by Steven Chang
-------------------
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Warmup 1: BFS and DFS Concepts

Before getting started, it's critical that you understand the concepts behind (and the differences between) depth-first search and breadth-first search. Start by answering the following questions in your README file:

1. What data structure is used to implement DFS?
- A stack.

2. What data structure is typically used to implement BFS?
- A queue.

3. Which one can be done recursively? (the clue should be the data structure)
- DFS

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
- DFS

5. What is the difference between a tree and a graph?
- A Tree has a root and it has parent -> child system.

**********************************************

Next, pseudocode the following processes with enough detail to be clear:

7. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
	1. Start with the root. If it's a match you're done.
	2. If not, put the crappiest children in order of the crappiness (crappiest at the botto of the stack) and check the best child for a match, if it's not a match goto that child's children.
	3. repeat step 2-3 until you hit the end.
	4. Now that you've hit the end, test what's next on the stack.
	5. If it's not a match check that child's children in the form of steps 2-4 until.
	6. Repeat until all nodes are checked.

8. Searching the same tree using BFS.
	1. Start with the root
	2. If not a match put all of its children into the queue.
	3. if the next child is not a match, put all of it's children in the queue.
	4. Repeat untill all done.

9. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
	- Not sure what you mean by this.
	- If it was an adjacency matrix wouldn't it be a simple couple of array checks?

10. Searching the same graph using BFS.
# Are you talking about ones with edge weights????
	- A good BFS always spreads outwards to the next-closest value, so a simple queue will not be sufficient.
	- To be clear, this is because one vertex may have edges with weights [12, 14, and 115] while the next vertex the search runs on might have edges with weights [1,15, and 642].
	- Just putting these onto the end of the queue would result in us searching unevenly.
	- The solution is to use a slightly different queue structure called a "Priority queue" which is specially designed to handle this. 
	- VCS didn't dive into the implementation.

Do not move on until you can comfortably pseudocode those processes! You'll find that a lot of operations you do with trees will resemble either BFS or DFS and that should immediately tell you the best way to solve them.