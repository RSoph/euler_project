# What is the largest prime factor of the number 600851475143 ?

def find_largest_prime(num):
	result = 0
	counter = 2
	while counter <= num:
		if num % counter == 0:
			if counter > result:
				result = counter
			num = num / counter
			counter = 2
		else:
			counter += 1
	return result

print(find_largest_prime(600851475143))

# 6857