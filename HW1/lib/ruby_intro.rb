# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  sums = 0
  arr.each { |item|
    sums = sums + item
    
    
  }
  return sums
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length() == 0
    return 0
  elsif arr.length() == 1
    return arr[0]
  else
    sorted_arr = arr.sort()
    return sorted_arr[-1] + sorted_arr[-2]
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  sums = 0
  if arr.length() == 1
    return FALSE
  end
  i_x = 0
  
  arr.each{ |x|
    i_y = 0
    arr.each { |y| 
      if x + y == n && i_x != i_y
        return TRUE
      end
      i_y+=1
    }
    i_x+=1
  }
  return FALSE
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, "+name
end

def starts_with_consonant? s
  if s.length() == 0
    return FALSE
  end
  if s[0].count("a-zA-Z") == 0
    return FALSE
  end
  start = s[0].downcase
  return !(['a','e','i','o','u'].include? start)
  # YOUR CODE HERE
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  s.split('').each{ |x|
    if ( x != '0') && (x != '1')
      return FALSE
    end
  }
  if s[-2,2] == '00' || (s.length() == 1 && s[0] == '0')
    return TRUE
  end
end

# Part 3

class BookInStock
  @isbn
  @price
  def initialize isbn,price
    if isbn.length > 0 && !(price <= 0)
      
      @isbn = isbn
      @price = price
    else
      
      raise ArgumentError.new()
    end
  end
  def isbn 
    @isbn
  end
  def price
    @price
  end
  def isbn=(isbn)
    @isbn=isbn
  end
  def price=(price)
    @price=price
  end
  
  def price_as_string
    return "$"+"#{'%.2f' % @price}"
  end
# YOUR CODE HERE
end
