# The first two consecutive numbers to have two distinct prime factors are:

# 14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

# 644 = 2^2 × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.

# Find the first four consecutive integers to have four distinct prime factors each.
# What is the first of these numbers?

# I'm starting at 210, because it's the smallest number with four distinct prime factors (2, 3, 5, 7)
counter = 210
chain = 0

def prime_factors(number)
	counter = 2
	factors = []
	while counter <= number
		if number % counter == 0
			factors << counter
			number = number / counter
			counter = 2
		else
			counter += 1
		end
	end
	return factors
end

while chain != 4
	if prime_factors(counter).uniq.length == 4
		chain += 1
	else
		chain = 0
	end
	counter += 1
end

puts counter - 4