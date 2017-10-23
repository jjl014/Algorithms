require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if check_index(index)
      raise "index out of bounds"
    else
      @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if check_index(index)
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  # O(1)
  def pop
    if length > 0
      @length -= 1
      @store[length]
    else
      raise "index out of bounds"
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @store[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    if length == 0
      raise "index out of bounds"
    else
      ret_val = @store[0]
      (1...length).each do |i|
        @store[i - 1] = @store[i]
      end
      @length -= 1
      ret_val
    end
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity
    if length > 0
      last_idx = length - 1
      while last_idx >= 0
        @store[last_idx + 1] = @store[last_idx]
        last_idx -= 1
      end
    end
    @store[0] = val
    @length += 1
    @store
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    return true if length == 0 || index > capacity || index < 0 || index >= length
    false
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(capacity * 2)
    (0...capacity).each do |i|
      new_store[i] = store[i]
    end
    @capacity = capacity * 2
    @store = new_store
  end
end
