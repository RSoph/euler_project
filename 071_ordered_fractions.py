# Consider the fraction, n/d, where n and d are positive integers. If n < d, and HCF(n, d) == 1, it is called a reduced proper fraction.

# If we list the set of reduced proper fractions for d <= 8 in ascending order of size, we get:
#  [[ list of fractions ]]
 
# It can be seen that 2/5 is the fraction immediately to the left of 3/7.

# By listing the set of reduced proper fractions for d <= 1,000,000 in ascending order of size, find the numerator of the fraction immediately to the left of 3/7.


def reduced_proper_fraction(num, dem):
	n_factors = get_factors(num)
	d_factors = get_factors(dem)
	return n_factors.intersection(d_factors) == set()

def get_factors(value):
	i = 2
	results = set()
	while i^2 < value:
		if value % i == 0:
			results.add(i)
			value = value % i
			i = 2
		i += 1
	return results

result_so_far = 0
numerator_so_far = 420496
d = 990000
while d <= 1000000:
	n = numerator_so_far
	while n < d*3/7:
		if reduced_proper_fraction(n, d):
			value = n / d
			if value > result_so_far:
				print("n: " + str(n) + " d: " + str(d) + " value: " + str(value))
				result_so_far == value
				numerator_so_far = n
		n += 1
	d += 1


# Solution: n = 428570, d = 999997
# I sort of cheated, I kept manually moving the starting values up, guessing that it would have to be a pretty big number.
# This program ran through d = 990,000 - 1,000,000 in about 5 minutes, but would have taken much longer if I'd started at 1.