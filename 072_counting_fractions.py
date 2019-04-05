# Consider the fraction, n/d, where n and d are positive integers. 
# If n<d and HCF(n,d)=1, it is called a reduced proper fraction.

# If we list the set of reduced proper fractions for d <= 8 in ascending order
# of size, we get:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3,
# 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

# It can be seen that there are 21 elements in this set.

# How many elements would be contained in the set of reduced proper fractions
# for d <= 1,000,000?

# There are 999999 numbers less than d, so there are 1,000,000 * 999,999
# fractions we need to consider as candidates, and eliminate the ones who
# are effectively duplicates with others. I'm going to keep track of all
# of our fractions with a list of tuples, [(0, 1)], where 0 is the numerator
# and 1 is the denominator.

fractions = []
divisor_hash = {}

def find_divisors(number):
	divisors = [number]
	counter = 2
	while counter * 2 <= number:
		if number % counter == 0:
			divisors.append(counter)
		counter += 1
	if number == 200:
		import pdb; pdb.set_trace()
	divisor_hash[number] = divisors

def reduce(tuple):
	numerator = tuple[0]
	denominator = tuple[1]
	if numerator not in divisor_hash:
		find_divisors(numerator)
	numerator_divisors = divisor_hash[numerator]
	if denominator not in divisor_hash:
		find_divisors(denominator)
	denominator_divisors = divisor_hash[denominator]

	for divisor in numerator_divisors:
		if (
			numerator != 1 and
			divisor in denominator_divisors
		):
			numerator = numerator / divisor
			denominator = denominator / divisor

	return (numerator, denominator)

for denominator in range(1, 300):
	print denominator
	for numerator in range(1, denominator):
		fraction = (numerator, denominator)
		if reduce(fraction) not in fractions:
			fractions.append(reduce(fraction))

print len(fractions)