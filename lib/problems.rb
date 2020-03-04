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
  operands = ["*", "**", "/", "%", "+", "-"]
  s= Stack.new
  
  postfix_expression.each_char do |char|
    if operands.include?(char)
      first = s.pop
      second = s.pop
      result = eval("#{second}#{char}#{first}")
      s.push(result)
    else
      s.push(char)
    end
  end
  
  return s.pop
end

# p balanced("{[{}{}]}")
# p balanced("{[{}{}]")
# p balanced("{()}[)")

# p evaluate_postfix("35+6*") #48
# p evaluate_postfix("53+62/*35*+") #39