# The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28.
# In fact, there are exactly four numbers below fifty that can be expressed in such a way:

# 28 = 2^2 + 2^3 + 2^4
# 33 = 3^2 + 2^3 + 2^4
# 49 = 5^2 + 2^3 + 2^4
# 47 = 2^2 + 3^3 + 2^4

# How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and
# prime fourth power?

def prime_factorial(number)
	counter = 2
	factors = []
	while number >= counter
		if number % counter == 0
			factors << counter
			number = number / counter
		else
			counter += 1
		end
	end
	return factors
end

def is_solution(number)
	factors = prime_factorial(number)
	# if (
	# 	factors.uniq.length != 3 and
	# 	factors.length != 9
	# 	)
	# 	return false
	# end
	factor_counts = []
	factors.each do |factor|
		factor_counts << factors.count(factor)
	end
	puts factors
	puts "----"
	puts factor_counts.sort
	return factor_counts.sort == [2, 2, 3, 3, 3, 4, 4, 4]
end

[28].each do |number|
	puts is_solution(number)
	puts number
end
