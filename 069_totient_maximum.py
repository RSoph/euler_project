# Euler's Totient function, f(n) [sometimes called the phi function], is used to determine the number of numbers less than n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, f(9)=6.

# n		Relatively Prime	f(n)	n/f(n)
# 2			1				1		2
# 3			1,2				2		1.5
# 4			1,3				2		2
# 5			1,2,3,4			4		1.25
# 6			1,5				2		3
# 7			1,2,3,4,5,6		6		1.1666...
# 8			1,3,5,7			4		2
# 9			1,2,4,5,7,8		6		1.5
# 10		1,3,7,9			4		2.5
# It can be seen that n=6 produces a maximum n/f(n) for n <= 10.

# Find the value of n <= 1,000,000 for which n/f(n) is a maximum.

result = {'n': 1, 'value': 4}

def are_relatively_prime(a, b):
	counter = 2
	result = True
	while counter * counter <= b:
		if (a % counter == 0 and b % counter == 0):
			return False
		counter += 1
	return True

def f(n):
	counter = 2
	primes = 1
	while counter < n:
		if are_relatively_prime(n, counter):
			primes += 1
		counter += 1
	return primes

counter = 16169
while counter < 1000000:
	fn = f(counter)
	value = float(counter) / float(fn)
	if result['value'] < value:
		result = {'n': counter, 'value': value}
		print result
	counter += 1

print result

# I really hate this solution. I'm fairly sure it will work eventually, but at the rate
# it's going, it will take many hours, and my computer might actually burst into flames.
# I'm iterating over 1..1,000,000. For each of those numbers (a), I'm iterating over 1..a,
# and for each of THOSE numbers b, I'm iterating over 1..b. I think that makes this
# On^3, which is just super gross. I have to think of some shortcuts.