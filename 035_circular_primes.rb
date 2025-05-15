# The number, 197, is called a circular prime because all rotations of the digits
# 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

def is_prime(number)
	counter = 2
	while counter * counter <= number
		return false if number % counter == 0
		counter += 1
	end
	return true
end

def find_primes(ceiling)
	primes = [2]
	counter = 3
	while counter <= ceiling
		primes.append(counter) if is_prime(counter)
		counter += 1
	end
	return primes
end

def find_rotations(number)
	rotations = []
	number.to_s.chars.each do |digit|
		number = (number.to_s[1..] + number.to_s[0]).to_i
		print number
		print "\n"
		rotations.append(number)
	end
	return rotations
end

def is_circular(prime)
	find_rotations(prime).each do |rotation|
		return false if not is_prime(rotation)
	end
	return true
end

def count_circulars(ceiling)
	primes = find_primes(ceiling)
	circulars = 0
	primes.each do |prime|
		circulars += 1 if is_circular(prime)
	end
	return circulars
end

print count_circulars(1000000)

# NOTE: the above gives the answer 129, which is not correct.
# The problem is that I'm losing the leading 0, 
# 998099
# 980999
# 809999
# 99998 <- leading 0 is truncated, so the next rotation is incorrect
# 99989
# 99899