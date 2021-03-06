require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == @store.length
    return false if self[key].include?(key)
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key) if self[key].include?(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new( num_buckets * 2 ) {Array.new}
    @store.each do |bucket|
      bucket.each do |el|
        new_store[el] = el
      end
    end
  end
end
