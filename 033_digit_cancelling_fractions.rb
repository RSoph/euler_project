# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than
# one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, find
# the value of the denominator.


def is_curious?(num_1, num_2, dem_1, dem_2)
	is_curious = false
	numerator = (num_1 * 10.0) + num_2
	denominator = (dem_1 * 10.0) + dem_2
	reduced_1 = numerator / denominator
	reduced_2 = 0.0
	if num_1 == dem_1 and num_2 == dem_2
		return is_curious
	end
	if denominator == 0.0 or numerator == 0.0
		return is_curious
	end

	if num_1 == dem_1
		reduced_2 = num_2 / dem_2
	elsif num_1 == dem_2
		reduced_2 = num_2 / dem_1
	elsif num_2 != 0.0
		if num_2 == dem_1
			reduced_2 = num_1 / dem_2
		elsif num_2 == dem_2
			reduced_2 = num_1 / dem_1
		end
	end

	if reduced_1 == reduced_2 and reduced_1 < 1.0
		is_curious = true
	end
	return is_curious
end

def find_denominator(num, dem)
	counter = 2.0
	while counter < dem
		while num % counter == 0.0 and dem % counter == 0.0
			num = num / counter
			dem = dem / counter
		end
		counter += 1.0
	end
	return dem
end

curious = []
num_1 = 1.0
num_2 = 0.0
dem_1 = 1.0
dem_2 = 1.0
while num_1 < 10.0
	while num_2 < 10.0
		while dem_1 < 10.0
			while dem_2 < 10.0
				if is_curious?(num_1, num_2, dem_1, dem_2)
					numerator = (num_1 * 10.0) + num_2
					denominator = (dem_1 * 10.0) + dem_2
					curious.append([numerator, denominator])
				end
				dem_2 += 1.0
			end
			dem_2 = 1.0
			dem_1 += 1.0
		end
		dem_1 = 1.0
		num_2 += 1.0
	end
	num_2 = 0.0
	num_1 += 1.0
end

num_product = 1.0
dem_product = 1.0
curious.each do |numerator, denominator|
	num_product *= numerator
	dem_product *= denominator
end

print find_denominator(num_product, dem_product)
# 100.0
