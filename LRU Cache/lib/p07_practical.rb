require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  h = HashMap.new
  string.each_char do |ch|
    if h.get(ch)
      h.delete(ch)
    else
      h.set(ch, true)
    end
  end
  h.count <= 1
end
