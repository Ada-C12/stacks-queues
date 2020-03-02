require_relative './stack.rb'

# Time Complexity: O(2n) or just plain O(n) where n is length of the array because we are looping over the array twice: once when we split from string to array and a second time when we create the hash map. 
# Space Complexity: constant because the number of variables stays the same no matter how long our string/array is
def balanced(string)
  if string.length == 0
    return true
  else
    array = string.split("")
  end

  hash = {}
  array.each do |character|
    if hash[character].nil?
      hash[character] = 1
    else
      hash[character] += 1 
    end
  end

  if hash['('] == hash[')'] && hash['{'] == hash['}'] && hash['['] == hash[']']
    return true
  else
    return false
  end

end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
