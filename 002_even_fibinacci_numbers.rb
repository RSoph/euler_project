# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

sum = 0

x = 1
y = 1

while x < 4000000
	if x % 2 == 0
		sum += x
	end
	z = x + y
	x = y
	y = z
end

puts sum

# 4613732

# Another solution would have been creating an array of numbers, and then adding up every other one.
# I like this better because a) you're already iterating over the fibonacci numbers under 4 million,
# you'd have to iterate over them again to get the sum and b) you'd have to hold all those numbers
# in memory even though you only care about half of them, and you only care about those momentarily.