require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new {|a,b| a <=> b}
  end

  def count
    @store.length
  end

  def extract
    val = store[0]
    store[0] = store.pop
    self.class.heapify_down(store, 0, &prc)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    self.class.heapify_up(store, self.count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    left = (parent_index * 2) + 1
    right = (parent_index * 2) + 2
    [left,right].select {|child_idx| child_idx < len}
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    l_idx, r_idx = child_indices(len, parent_idx)

    childs = []
    childs << array[l_idx] if l_idx
    childs << array[r_idx] if r_idx
    parent = array[parent_idx]

    return array if childs.all? {|child| prc.call(parent, child) <= 0}

    child_idx = nil
    if childs.length == 1
      child_idx = l_idx
    else
      child_idx = prc.call(childs[0], childs[1]) > 0 ? r_idx : l_idx
    end
    array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    heapify_down(array, child_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    child, parent = array[child_idx], array[parent_idx]

    if prc.call(parent, child) < 0
      return array
    else
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
