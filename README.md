Dylan and Phil

# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)


Question: What data structure is used to implement DFS?
Answer: A stack.

Question: What data structure is typically used to implement BFS?
Answer: A queue.

Question: Which one can be done recursively? (the clue should be the data structure)
Answer: The DFS with stack data structure can be done recursively.

Question: Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
Answer: The breadth-first search would print a list of all child nodes at each depth.

Question: What is the difference between a tree and a graph?
Answer: A graph is an unorganized group of objects(vertices) with edges(references) to each other, and a tree is an organized hierarchy of objects(nodes).


1.Starting at root node, check node to see if value is give value
if not

search left most child of current node and not nil
if not
keep going until nil
once nil, go back up to parent and search right child and not nil
if not
check all children
if not
go back up to parent and repeat until value is hit.

2. Starting a root node, check node to see if value if target value
if not
add all children to queue
search all children for value
if not
add children of children to queue
if not
repeat until first target value is hit.