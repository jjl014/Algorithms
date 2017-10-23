require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  arr = []
  b = BinarySearchTree.new
  b.in_order_traversal(tree_node, arr)
  b.find(arr[arr.length - k], tree_node)
end
