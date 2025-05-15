# The number, 197, is called a circular prime because all rotations of the digits:
# 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

def is_prime(number):
	counter = 2
	while counter * counter <= number:
		if number % counter == 0: return False
		counter += 1
	return True

def find_primes(ceiling):
	primes = [2]
	counter = 3
	while counter <= ceiling:
		if is_prime(counter): primes.append(counter)
		counter += 1
	return primes

def find_rotations(number):
	rotations = []
	for digit in str(number):
		number = int(str(number)[1:] + str(number)[0])
		rotations.append(number)
	return rotations

def is_circular(prime):
	for rotation in find_rotations(prime):
		if not is_prime(rotation): return False
	return True

def count_circulars(ceiling):
	primes = find_primes(ceiling)
	circulars = 0
	for prime in primes:
		if is_circular(prime): circulars += 1
	return circulars

print(count_circulars(1000000))

# NOTE: the above gives the answer 129, which is not correct. I don't know what
# the problem is and will fix another time.