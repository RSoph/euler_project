# The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28.
# In fact, there are exactly four numbers below fifty that can be expressed in such a way:

# 28 = 2^2 + 2^3 + 2^4
# 33 = 3^2 + 2^3 + 2^4
# 49 = 5^2 + 2^3 + 2^4
# 47 = 2^2 + 3^3 + 2^4

# How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and
# prime fourth power?

# ------------

def is_prime?(number)
	counter = 2
	while counter * counter <= number
		if number % counter == 0
			return false
		end
		counter += 1
	end
	return true
end

# 7072^2 is over fifty million, so every prime we use has to be under 7072 in order for the total to come in under the limit.
# 7069 is the last prime under 7072.
primes = []
counter = 2
while counter <= 7069
	if is_prime?(counter)
		primes << counter
	end
	counter += 1
end

results = []
primes.each do |prime_a|
	# I'm sure it doesn't save a ton of time to have the multiplication done outside the innermost loop,
	# but it can't hurt, and it feels tidier
	prime_a_squared = prime_a * prime_a
	primes.each do |prime_b|
		# 369^3 is over fifty million, so we can't use higher numbers for prime_b
		if prime_b >= 373
			break
		end
		prime_b_cubed = prime_b * prime_b * prime_b
		if prime_a_squared + prime_b_cubed >= 50000000
			break
		else
			primes.each do |prime_c|
				if prime_c >= 89
					break
				else
					# 85^4 is over fifty million
					prime_c_fourthed =  prime_c * prime_c * prime_c * prime_c
					number = prime_a_squared + prime_b_cubed + prime_c_fourthed
					if (
						number <= 50000000 and
						!results.include?(number)
					)
						results << number
					end
				end
			end
		end
	end
	# I'm leaving the puts statement in place because it helps monitor progress
	puts prime_a
end

puts results.length

# This takes several minutes to run, and could probably be optimized if I were less lazy. The final result is 1097343.

# It iterates once through all the numbers between 2 and 7069, then iterates through the list of primes in THREE NESTED LOOPS
# so the base speed is (On^3 + On) which is just a big nightmare. I've shortened it by requiring B to be under 373 an C under 89
# and that does seem to help, but there's more to do here.