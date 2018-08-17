# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

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

# I'm pretty proud of this implementation - there's no need to keep track of almost 5000
# elements in the sequence, and you only need the recent 2 to find the next. So I'm
# finding the next element in the sequence and then throwing out the one I don't need
# any more. The numbers in memory still get a little out of hand, having nearly 1000 digits
# each, but that can't be avoided.