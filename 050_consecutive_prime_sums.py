# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?


primes = []

def generate_primes(limit):
	counter = 2
	while counter <= limit:
		if is_prime(counter):
			primes.append(counter)
		counter += 1

def is_prime(number):
	counter = 2
	while counter * counter <= number:
		if number % counter == 0:
			return False
		counter += 1
	return True

generate_primes(1000000)

def generate_paths():
	max_path = {"max_path_length": 1, "sum": 1}
	index = 0
	for prime in primes:
		print(prime)
		path_length = 1
		sum = prime
		while sum < 1000000:
			sum += primes[index + path_length]
			path_length += 1
			if (sum in primes and path_length > max_path["max_path_length"]):
				max_path = {"max_path_length": path_length, "sum": sum}
				print(max_path)
		index += 1
	return max_path

generate_paths()


# {:max_path_length=>543, :sum=>997651}