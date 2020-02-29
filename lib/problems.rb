require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  paren_hash = { ")" => "(", "}" => "{", "]" => "[" }

  stack = Stack.new

  string.each_char do |char|
    if paren_hash[char]
      last = stack.pop
      if paren_hash[char] != last
        return false
      end
    else
      stack.push(char)
    end
  end

  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  operators = ["+", "-", "*", "/"]
  stack = Stack.new

  postfix_expression.each_char do |char|
    if !operators.include? char
      stack.push(char)
    else
      num2 = stack.pop.to_i
      num1 = stack.pop.to_i

      if char == "+"
        result = num1 + num2
      elsif char == "-"
        result = num1 - num2
      elsif char == "*"
        result = num1 * num2
      else
        result = num1 / num2
      end

      stack.push(result)
    end
  end

  return stack.pop
end
