require_relative './stack.rb'

# Time Complexity: O(n) as it needs to go through all the string
# Space Complexity: O(n) in worst scenario all parenthesis will be open.
def balanced(string)
  return true if string == ""
  stack = []

  pairs = Hash.new()
  pairs["}"] = "{"
  pairs[")"] = "("
  pairs["]"] = "["

  string.each_char do |c|
    if ["{","[","("].include?(c)
      stack.push(c)
    else
      return false if stack.pop() != pairs[c]  
    end
  end

  return stack.empty?
end

# Time Complexity: O(n). It needs to iterate through each character.
# Space Complexity: O(n). In the worst scenario I will only have operands. 
def evaluate_postfix(postfix_expression)
  
  stack = []

  postfix_expression.each_char do |c|
    if ["+","-","/","*"].include?(c)
      n2 = (stack.pop).to_i
      n1 = (stack.pop).to_i

      if c == "+"
        result = n1 + n2
      elsif c == "-"
        result = n1 - n2
      elsif c == "*"
        result = n1 * n2
      elsif c == "/"
        result = n1 / n2
      end

      stack.push(result)
    else
      num = c.to_i
      stack.push(num)
    end
  end
  return stack.pop
end
