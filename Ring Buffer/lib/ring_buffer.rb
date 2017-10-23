require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    if check_index(index)
      raise "index out of bounds"
    else
      @store[(start_idx + index) % capacity]
    end
  end

  # O(1)
  def []=(index, val)
    if check_index(index)
      raise "index out of bounds"
    else
      @store[(start_idx + index) % capacity] = val
    end
  end

  # O(1)
  def pop
    if length > 0
      @length -= 1
      @store[(start_idx + length) % capacity]
    else
      raise "index out of bounds"
    end
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    @store[(start_idx + length) % capacity] = val
    @length += 1
    @store
  end

  # O(1)
  def shift
    if length == 0
      raise "index out of bounds"
    else
      ret_val = @store[start_idx % capacity]
      @start_idx += 1
      @length -= 1
      ret_val
    end
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    @start_idx -= 1
    @store[start_idx % capacity] = val
    @length += 1
    @store
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    return true if length == 0 || index > capacity || index < 0 || index >= length
    false
  end

  def resize!
    new_store = StaticArray.new(capacity * 2)
    new_idx = 0
    ((start_idx % capacity)...capacity).each do |i|
      new_store[new_idx] = store[i]
      new_idx += 1
    end
    (0...(start_idx % capacity)).each do |i|
      new_store[new_idx] = store[i]
      new_idx += 1
    end
    @capacity = capacity * 2
    @start_idx = 0
    @store = new_store
  end
end
