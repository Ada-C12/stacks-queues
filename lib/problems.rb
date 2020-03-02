require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  if string.length == 0 || string.length == 1
    return true
  elsif string.length.odd? 
    return false
  end
  
  reference = Hash.new
  reference = {
  "(" => ")",
  ")" => "(", 
  "[" => "]", 
  "]" => "[", 
  "{" => "}", 
  "}" => "{"}
  
  expected_mirror = []
  
  half_length = string.length / 2
  
  i = 0
  
  until i == half_length do
    if reference.has_key?(string[i])
      expected_mirror.insert(0, reference[string[i]])
      i += 1
    else
      reference[string[i].to_s = string[i].to_s]
      expected_mirror.insert(0, string[i])
      i += 1
    end
  end
  
  additional_counter = 0
  
  until i == (string.length - 1) do
    if reference[string[i]] != expected_mirror[additional_counter] 
      return false
    else
      i += 1
      additional_counter += 1
    end
  end
  
  return true
  
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
