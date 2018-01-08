require 'binary_search_tree'

def kth_largest(tree_node, k)
  return nil if tree_node.nil?

  if k == in_order_traversal(tree_node.left).count
    return tree_node
  elsif k > in_order_traversal(tree_node.left).count
    return kth_largest(tree_node.right, k - in_order_traversal(tree_node.left).count)
  else
    return kth_largest(tree_node.left, k)
  end
end

def in_order_traversal(tree_node, arr = [])
  return arr if tree_node.nil?
 
  arr += in_order_traversal(tree_node.left)
  arr << tree_node.value
  arr += in_order_traversal(tree_node.right)

  return arr
end
