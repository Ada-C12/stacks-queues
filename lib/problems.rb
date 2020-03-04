require_relative './stack.rb'

# Time Complexity: O(n) - n is chars in string
# Space Complexity: O(1/2n) --> O(n) - n is chars in string
def balanced(string)
  return true if string.empty?
  return false if string.length % 2 != 0
  
  s = Stack.new
  open_bracs = ["(", "[", "{"]
  close_bracs = [")", "]", "}"]
  
  string.each_char do |char|
    if open_bracs.include?(char)
      s.push(char)
    elsif close_bracs.include?(char)
      compare = s.pop
      if open_bracs.find_index(compare) != close_bracs.find_index(char)
        return false
      end
    end
  end
  
  return true
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end

# p balanced("{[{}{}]}")
# p balanced("{[{}{}]")
# p balanced("{()}[)")