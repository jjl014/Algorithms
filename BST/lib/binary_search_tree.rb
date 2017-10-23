# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(value)
    unless @root
      @root = BSTNode.new(value)
      return @root
    end
    insert_rec(value, @root)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if value == tree_node.value
    if value > tree_node.value
      find(value, tree_node.right)
    else
      find(value, tree_node.left)
    end
  end

  def delete(value)
    node = find(value, @root)
    return unless node
    if node == @root
      @root = nil
    else
      @root = delete_node(@root, value)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 unless tree_node
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  def is_balanced?(tree_node = @root)
    return true unless tree_node
    left_depth = tree_node.left ? depth(tree_node.left) : 0
    right_depth = tree_node.right ? depth(tree_node.right) : 0
    diff = (left_depth - right_depth).abs
    return false if diff > 1
    return is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr unless tree_node
    in_order_traversal(tree_node.left, arr)
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right, arr)
  end


  private
  # optional helper methods go here:

  def delete_node(tree_node, value)
    return nil unless tree_node
    if value < tree_node.value
      tree_node.left = delete_node(tree_node.left, value)
    elsif value > tree_node.value
      tree_node.right = delete_node(tree_node.right, value)
    else
      return tree_node.left unless tree_node.right
      return tree_node.right unless tree_node.left
      temp = tree_node
      tree_node = maximum(tree_node.left)
      tree_node.left = delete_max(temp.left)
      tree_node.right = temp.right
    end
    tree_node
  end

  def delete_max(node)
    return nil unless node
    return node.left unless node.right
    node.right = delete_max(node.right)
    node
  end

  def insert_rec(value, node)
    return BSTNode.new(value) unless node
    if value > node.value
      node.right = insert_rec(value, node.right)
    else
      node.left = insert_rec(value, node.left)
    end
    node
  end
end
