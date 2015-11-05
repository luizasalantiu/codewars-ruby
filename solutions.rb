#http://www.codewars.com/kata/55738b0cffd95756c3000056
def optimum_location(students, locations)
  distances = locations.map {
    |loc| students.map{ |stud| distance(loc, stud)  }.reduce(:+)
  }

  locIndex = distances.index(distances.min)
  x = locations[locIndex]["x"]
  y = locations[locIndex]["y"]

  "The best location is number #{locIndex + 1} with the coordinates x = #{x} and y = #{y}"
end

def distance(location, stud)
  (location["x"] - stud[0]).abs + (location["y"] - stud[1]).abs
end

#http://www.codewars.com/kata/5596f6e9529e9ab6fb000014
def shifted_diff(first, second)
  return 0 if first == second

  shifted, rest = second, second

  while !first.include? shifted && shifted
    shifted = shifted[0...-1]
  end

  rest.slice! shifted

  return shifted.length if rest + shifted == first
  return -1
end

#optimized for large strings
def shifted_diff(f, s)
  return 0 if f == s
  return -1 if f.length != s.length

  shifted, rest, steps = s, s, s.length

  #reduce search by one third
  while !f.include? shifted && shifted
    steps -= steps / 3
    shifted = shifted[0...-steps]
  end

  #once we found a substring, add characters we skipped that also match the original string
  while shifted.length < s.length and f.include? s[0, shifted.length + 1]
    shifted.concat(s[shifted.length])
  end

  rest.slice! shifted

  return shifted.length if rest + shifted == f
  return -1
end

#http://www.codewars.com/kata/55d8dc4c8e629e55dc000068
def trigrams(phrase)
  return "" if phrase.size < 3

  phrase.gsub!(" ", "_")
  arr = Array.new
  pos = 2

  while  pos < phrase.size
    arr.push(phrase[pos-2..pos])
    pos += 1
  end

  arr.join(" ")
end

#http://www.codewars.com/kata/545ab34061aa4c00eb000e66
def max list, &block
  list.max( &block )
end

#http://www.codewars.com/kata/55d24f55d7dd296eb9000030
def summation(num)
  (1..num).to_a.reduce(:+)
end

#http://www.codewars.com/kata/545a4c5a61aa4c6916000755
def gimme(input)
  sorted = input.sort
  input.index(sorted[1])
end

#http://www.codewars.com/kata/53dc303a2259ed0bfe0004e4
#standard
def is_prime(num)
  return false if num < 2

  n = 2
  while n <= Math.sqrt(num)
    return false if num % n == 0
    n += 1
  end

  true
end

#optimized
def is_prime(num)
  return false if num <= 1
  return true if num <= 3
  return false if num % 2 == 0
  return false if num % 3 == 0

  k = 1
  while 6*k-1 <= Math.sqrt(num)
    return false if num % (6*k-1) == 0 || num % (6*k+1) == 0
    k += 1
  end

  true
end

#http://www.codewars.com/kata/543444e97abffa54260003ac
def greeting_for_all_friends(friends)
  friends.map { |f| "Hello, #{f}!" } unless friends.nil? or friends.empty?
end

#http://www.codewars.com/kata/545ac54161aa4c339a0010dd
def sort list, &block
  list.sort(&block)
end

#http://www.codewars.com/kata/545abc2d85166a08bd000f80
def min list, &block
  list.min{|a,b| yield(a,b)}
end

#http://www.codewars.com/kata/525f039017c7cd0e1a000a26
def palindrome_chain_length(n)
  return 0 if n.to_s.reverse.to_i == n

  1 + palindrome_chain_length(n.to_s.reverse.to_i + n)
end

#http://www.codewars.com/kata/50654ddff44f800200000001
class Person
  def initialize(name)
    @name = name
  end

  def greet(other_name)
    "Hi #{other_name}, my name is #{@name}"
  end
end

#http://www.codewars.com/kata/50654ddff44f800200000004
def multiply(a, b)
  a * b
end
