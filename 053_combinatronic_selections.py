# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3=10.

# In general, nCr = n! / (r! * (n−r)!), where r<=n, n!=n*(n−1)*...*3*2*1, and 0!=1.

# It is not until n=23, that a value exceeds one-million: 23C10=1144066.

# How many, not necessarily distinct, values of nCr for 1<=n<=100, are greater than one-million?


def c(n, r):
	n_factorial = factorial(n)
	r_factorial = factorial(r)
	diff_factorial = factorial(n-r)
	result = n_factorial / (r_factorial * diff_factorial)
	return result

def factorial(a):
	total = 1
	while a > 0:
		total *= a
		a -= 1
	return total

count = 0
n = 2
while n <= 100:
	r = 1
	while r <= n:
		if c(n, r) > 1000000:
			count += 1
		r += 1
	n += 1

print count

