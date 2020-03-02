require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(1)
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
  
  until i == (string.length) do
    
    if string[i] != expected_mirror[additional_counter] 
      return false
    else
      i += 1
      additional_counter += 1
    end
  end
  
  return true
  
end

# Time Complexity: O(n)
# Space Complexity: O(1)
def evaluate_postfix(postfix_expression)
  
  starting_value = postfix_expression[0].to_i
  first_operation = postfix_expression[2]
  first_value = postfix_expression[1].to_i
  second_operation = postfix_expression[4]
  second_value = postfix_expression[3].to_i
  
  temporary_response = 0
  
  if postfix_expression.length == 1 
    return postfix_expression
  elsif postfix_expression.length == 3
    return evaluator(first_operation, starting_value, first_value)
  elsif postfix_expression.length == 5
    first_half = evaluator(first_operation, starting_value, first_value)
    return evaluator(second_operation, first_half, second_value)
  end
end


def evaluator(operation, first_value, second_value)
  
  temp = 0
  
  case operation
  when "+"
    temp = first_value + second_value
  when "-"
    temp = first_value - second_value
  when "*"
    temp = first_value * second_value
  when "/"
    temp = first_value / second_value
  else
    return nil
  end  
  
  return temp
  
end
