# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than
# one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, find
# the value of the denominator.


def is_curious(num_1, num_2, dem_1, dem_2):
	is_curious = False
	numerator = (num_1 * 10.0) + num_2
	denominator = (dem_1 * 10.0) + dem_2
	reduced_1 = numerator / denominator
	reduced_2 = 0.0
	if num_1 == dem_1 and num_2 == dem_2:
		return is_curious
	if denominator == 0.0 or numerator == 0.0:
		return is_curious

	if num_1 == dem_1:
		reduced_2 = num_2 / dem_2
	elif num_1 == dem_2:
		reduced_2 = num_2 / dem_1
	elif num_2 != 0.0:
		if num_2 == dem_1:
			reduced_2 = num_1 / dem_2
		elif num_2 == dem_2:
			reduced_2 = num_1 / dem_1

	if reduced_1 == reduced_2 and reduced_1 < 1.0:
		is_curious = True
	return is_curious


def find_denominator(num, dem):
	counter = 2.0
	while counter < dem:
		while num % counter == 0.0 and dem % counter == 0.0:
			num = num / counter
			dem = dem / counter
		counter += 1.0
	return dem

curious = []
num_1 = 1.0
num_2 = 0.0
dem_1 = 1.0
dem_2 = 1.0
while num_1 < 10.0:
	while num_2 < 10.0:
		while dem_1 < 10.0:
			while dem_2 < 10.0:
				if is_curious(num_1, num_2, dem_1, dem_2):
					numerator = (num_1 * 10.0) + num_2
					denominator = (dem_1 * 10.0) + dem_2
					curious.append((numerator, denominator))
				dem_2 += 1.0
			dem_2 = 1.0
			dem_1 += 1.0
		dem_1 = 1.0
		num_2 += 1.0
	num_2 = 0.0
	num_1 += 1.0

num_product = 1.0
dem_product = 1.0
for (numerator, denominator) in curious:
	num_product *= numerator
	dem_product *= denominator

print find_denominator(num_product, dem_product)
