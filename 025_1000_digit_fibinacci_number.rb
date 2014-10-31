require 'pry'

fib = [1,1,2]

count = 2
while fib[1].to_s.length < 1000
	fib << fib[0] + fib[1]
	fib = fib[1..2]
	count += 1
end

puts fib[1]
puts count
puts fib[1].to_s.length