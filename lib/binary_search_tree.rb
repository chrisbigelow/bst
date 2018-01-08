# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)

    if @root.nil?
      @root = BSTNode.new(value) 
      return
    end

    current_node = @root

    until current_node.nil?
      if current_node.value <= value #go right
        if current_node.right.nil?
          current_node.right = BSTNode.new(value)
          return
        end
        current_node = current_node.right
      else
        if current_node.left.nil?
          current_node.left = BSTNode.new(value)
          return
        end
        current_node = current_node.left
      end
    end
    
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if tree_node.value < value 
      return self.find(value, tree_node.right) 
    else
      return self.find(value, tree_node.left)
    end
  end

  def delete(value)
    # @root = nil if value == @root.value
    if @root.right.nil? && @root.left.nil? && @root.value == value
      @root = nil
    end

    current_node = @root
    
    until current_node.nil?
      if current_node.value < value 
        if current_node.right.value == value
          delete_tree = current_node.right
          current_node.right = nil
          if delete_tree.right.nil? && delete_tree.left
            current_node.right = delete_tree.left
            return 
          elsif delete_tree.left.nil? && delete_tree.right
            current_node.right = delete_tree.right
            return
          elsif delete_tree.left && delete_tree.right
            left_max = maximum(delete_tree.left).left
            current_node.right = maximum(delete_tree.left)
            new_max = maximum(delete_tree.left) 
            new_max = left_max
            return
          end 
        end
        current_node = current_node.right
      else
        if current_node.left.value == value
          delete_tree = current_node.left
          current_node.left = nil 
          if delete_tree.right.nil? && delete_tree.left
            current_node.left = delete_tree.left
            return 
          elsif delete_tree.left.nil? && delete_tree.right
            current_node.left = delete_tree.right
            return
          elsif delete_tree.left && delete_tree.right
            left_max = maximum(delete_tree.left).left
            current_node.left = maximum(delete_tree.left)
            new_max = maximum(delete_tree.left) 
            new_max = left_max
            return
          end 
        end
        current_node = current_node.left
      end
    end
    
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def one_before_max(tree_node = @root)
    return treenode if tree_node.right.right.nil?
    one_before_max(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || (tree_node.left.nil? && tree_node.right.nil?)
    total = 1
    total += [depth(tree_node.left), depth(tree_node.right)].max
    return total
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    (depth(tree_node.right) - depth(tree_node.left)).abs <= 1 && (is_balanced?(tree_node.right) && is_balanced?(tree_node.left))
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
   
    arr += in_order_traversal(tree_node.left)
    arr << tree_node.value
    arr += in_order_traversal(tree_node.right)

    return arr
  end


  private
  # optional helper methods go here:

end
