# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# Finds the factorial of a number
def factorial(num)
	product = 1
	while num > 1
		product = product*num
		num -= 1
	end
	product
end

# Verifies that product is a common multiple of every number up to num
def check_number(num, product)
	result = true
	(1..num).each do |number|
		if product % number != 0
			result = false
			break
		end
	end
	return result
end

# Returns a list of primes under num
def find_primes_under(num)
	primes = [2]
	counter = 3
	while primes[-1] < num
		counter2 = 2
		while counter2 <= counter
			if counter % counter2 == 0
				break
			elsif
				counter2 * counter2 > counter
				primes << counter
				break
			end
			counter2 += 1
		end
	counter += 1
	end
	primes[0..-2]
end

# Returns the smallest common multiple of all numbers 1-num
def find_smallest_common_multiple(num)
	primes = find_primes_under(num)
	product = factorial(num)
	counter = 0
	while counter < primes.size
		while check_number(num, product)
			product = product / primes[counter]
		end
		product = product * primes[counter]
		counter += 1
	end
	product
end

puts find_smallest_common_multiple(20)

# TL;DR:

# 1) Multiply up all the numbers 1-20 (call it PRODUCT, it's on line 49).
# PRODUCT is, by definition a common multiple of those numbers.

# 2) Iterate through all the primes under 20, try dividing PRODUCT by that prime and checking if it's
# still a common multiple. If so, go with that, if not, multiply that prime back in. This is lines
# 51-57.

# By the time you've gone through all those primes, you'll have the smallest reminaing multiple of 1-20.