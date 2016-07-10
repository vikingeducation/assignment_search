# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
What data structure is used to implement DFS?
DFS is implemented using Stacks

What data structure is typically used to implement BFS?
BFS is implemented using Queues

Which one can be done recursively? (the clue should be the data structure)
DFS can be done recursively

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS is used to print nodes at each level

What is the difference between a tree and a graph?
A tree has a root. Graph has no root.
Tree is unidirectional, usually there no pointer to the parent. Graph can have pointer both ways.

Psuedo code:
Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
dfs_tree(root, node)
  return if root == nil
  compare root->data with node->data
  root.children { |child| dfs_tree(child, node) }
end

Searching the same tree using BFS.
searchLevelorder(tree)
for d = 1 to height(tree)
   printGivenLevel(tree, d);

searchGivenLevel(tree, level, node)
if tree is NULL then return;
if level is 1, then
    compare tree->data with node->data
else if level greater than 1, then
    printGivenLevel(tree->left, level-1);
    printGivenLevel(tree->right, level-1)

Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
dfs_search(root, target_node)
  mark root as visited
  return target_node if target_node == root
  push root on to the stack
  while stack not empty
    visit all unvistied neighbors of item on top of stack.
    mark each one as visited and push to the stack
    if no unvisited neighbors present, pop the stack
  end
end

Searching the same graph using BFS.
bfs-search(root, target_node)
  mark root as visited
  return target_node if target_node == root
  loop do
    enque/mark visited neighbors of root node to the Queue
    update cur_working_node to top if queue and deque until Queue is empty
  end
end