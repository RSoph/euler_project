# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three terms are
# prime, and, (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

def is_prime(number):
	counter = 2
	while counter * counter <= number:
		if number % counter == 0:
			return False
		else:
			counter += 1
	return True

four_digit_primes = []
counter = 999
while counter < 10000:
	if is_prime(counter):
		four_digit_primes.append(counter)
	counter += 1

for prime in four_digit_primes:
	first_digit = str(prime)[0]
	second_digit = str(prime)[1]
	third_digit = str(prime)[2]
	fourth_digit = str(prime)[3]
	permutations = [
		int("".join([first_digit, second_digit, fourth_digit, third_digit])),
		int("".join([first_digit, third_digit, second_digit, fourth_digit])),
		int("".join([first_digit, third_digit, fourth_digit, second_digit])),
		int("".join([first_digit, fourth_digit, second_digit, third_digit])),
		int("".join([first_digit, fourth_digit, third_digit, second_digit])),
		int("".join([second_digit, first_digit, third_digit, fourth_digit])),
		int("".join([second_digit, first_digit, fourth_digit, third_digit])),
		int("".join([second_digit, third_digit, first_digit, fourth_digit])),
		int("".join([second_digit, third_digit, fourth_digit, first_digit])),
		int("".join([second_digit, fourth_digit, first_digit, third_digit])),
		int("".join([second_digit, fourth_digit, third_digit, first_digit])),
		int("".join([third_digit, first_digit, second_digit, fourth_digit])),
		int("".join([third_digit, first_digit, fourth_digit, second_digit])),
		int("".join([third_digit, second_digit, first_digit, fourth_digit])),
		int("".join([third_digit, second_digit, fourth_digit, first_digit])),
		int("".join([third_digit, fourth_digit, first_digit, second_digit])),
		int("".join([third_digit, fourth_digit, second_digit, first_digit])),
		int("".join([fourth_digit, first_digit, second_digit, third_digit])),
		int("".join([fourth_digit, first_digit, third_digit, second_digit])),
		int("".join([fourth_digit, second_digit, first_digit, third_digit])),
		int("".join([fourth_digit, second_digit, third_digit, first_digit])),
		int("".join([fourth_digit, third_digit, first_digit, second_digit])),
		int("".join([fourth_digit, third_digit, second_digit, first_digit])),
	]
	for first_permutation in permutations:
		if first_permutation in four_digit_primes:
			difference = first_permutation - prime
			second_permutation = first_permutation + difference
			if (
				difference != 0 and
				second_permutation in permutations and 
				second_permutation in four_digit_primes
			):
				print "".join([
					str(prime), str(first_permutation), str(second_permutation)
				])

# I know, I also can't belive I typed out all 23 permutations. Believe me, I don't
# like it either. But if you want a thing done in 20 minutes as a quick warm up, you
# sometimes do it dirty.

# It's a good thing that the problem statement specified that it must be an 
# INCREASING arithmetic sequence, or I might insist that 814748171487 or 962962992969
# were valid answers as well.




