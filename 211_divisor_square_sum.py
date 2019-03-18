# For a positive integer n, let function2(n) be the sum of the squares of its divisors
# For example, function2(10) = 1 + 4 + 25 + 100 = 130.
# Find the sum of all n, 0 < n < 64,000,000 such that function2(n) is a perfect square.

def sum_divisors(number):
	divisors_squared = [1, number**2]
	counter = 2
	while counter * 2 <= number:
		if number % counter == 0:
			divisors_squared.append(counter**2)
		counter += 1
	return sum(divisors_squared)

def is_perfect_square(number):
	counter = 1
	while counter * counter < number:
		counter += 1
	if counter * counter == number:
		return True
	return False

counter = 0
grand_total = 0

while counter <= 64000000:
	sum_of_divisors = sum_divisors(counter)
	if is_perfect_square(sum_of_divisors):
		grand_total += sum_of_divisors
	print counter
	counter += 1

print grand_total