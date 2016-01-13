# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Julia, Kit, and Ellen

1. What data structure is used to implement DFS? Use a stack to push highest priority nodes from the branch to the stack. Then pop the node and see if it matches the item you're searching for. 

2. What data structure is typically used to implement BFS? Use a queue to push a whole level into it, then evaluate each node in order. 

3. Which one can be done recursively? (the clue should be the data structure) DFS is recursive, you add to the call stack by going down a branch and executing in order. Then you go back to the last place you branched and continue. 

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.? BFS

5. What is the difference between a tree and a graph? Trees have a given hierarchy (root, children, leaves). Graph has no hierarchy, any node can be connected to any other node. 


PSEUDOCODE!
1. Search tree using DFS, where each Node has an array of child nodes:
