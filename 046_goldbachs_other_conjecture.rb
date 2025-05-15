# It was proposed by Christian Goldbach that every odd composite number can be
# written as the sum of a prime and twice a square.

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?

def is_prime(number)
	counter = 2
	while counter * counter <= number
		if number % counter == 0
			return false
		else
			counter += 1
		end
	end
	return true
end

def can_be_written(number, primes)
	primes.each do |prime|
		if prime <= number
			leftover = number - prime
			if Math.sqrt(leftover/2) % 1 == 0.0
				return true
			end
		end
	end
	return false
end

# Just collect a big pile of primes to work with. Better to do it once up front
# than work it out for each candidate. The ceiling number is arbitrary, but you
# can go to tens of thousands in no time, so I'm not worried about it.
primes = []
counter = 2
while counter < 6000
	if is_prime(counter)
		primes.append(counter)
	end
	counter += 1
end

# While the counter is under some (arbitrary again) ceiling, check if it's a
# composite and can be written with an expression of that form. When you find
# one, print it out and stop the loop. I'm incrementing by 2 so they're all odd
# and I don't have to check for that.
counter = 9
while counter < 6000
	if (
		!primes.include?(counter) and
		not can_be_written(counter, primes)
	)
		print(counter)
		break
	else
		counter += 2
	end
end

# Answer 5777

