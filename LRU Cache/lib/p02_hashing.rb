class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    ret_val = 0
    self.each_with_index do |el, i|
      ret_val += (el.hash + i).hash
    end
    ret_val
  end
end

class String
  def hash
    ret_val = 0
    self.each_char.with_index do |ch, i|
      ret_val += (ch.ord + i).hash
    end
    ret_val
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ret_val = 0
    self.to_a.each do |kv|
      ret_val += kv[0].hash + kv[1].hash
    end
    ret_val
  end
end
