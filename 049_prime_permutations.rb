# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three terms are
# prime, and, (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

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

four_digit_primes = []
counter = 999
while counter < 10000
	if is_prime(counter)
		four_digit_primes.append(counter)
	end
	counter += 1
end

four_digit_primes.each do |prime|
	permutations = prime.to_s.chars.permutation.to_a()
	integer_permutations = []
	permutations.each do |item|
		integer_permutations.append(item.join().to_i)
	end
	integer_permutations.each do |first_permutation|
		if four_digit_primes.include?(first_permutation)
			difference = first_permutation - prime
			second_permutation = first_permutation + difference
			if (
				difference != 0 and
				integer_permutations.include?(second_permutation) and
				four_digit_primes.include?(second_permutation) and
				prime < first_permutation and
				first_permutation < second_permutation
			)
				print [
					prime.to_s, first_permutation.to_s, second_permutation.to_s
				].join()
				print "\n"
			end
		end
	end
end

# answer:
# 148748178147
# 296962999629
# 296962999629




