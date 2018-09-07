# Euler discovered the remarkable quadratic formula:

# n^2+n+41

# It turns out that the formula will produce 40 primes for the consecutive integer values 0≤n≤39.
# However, when n=40,40^2+40+41=40(40+1)+41 is divisible by 41, and certainly when n=41,41^2+41+41 is 
# clearly divisible by 41.

# The incredible formula n^2−79n+1601 was discovered, which produces 80 primes for the consecutive values
# 0≤n≤79. The product of the coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

# n^2+an+b, where |a|<1000 and |b|≤1000

# where |n| is the modulus/absolute value of n e.g. |11|=11 and |−4|=4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum
# number of primes for consecutive values of n, starting with n=0.

def is_prime(number)
	counter = 2
	while counter*counter < number
		if number % counter == 0
			return false
		end
		counter += 1
	end
	return true
end

max_primes = {value: 40, a: 1, b: 1, product: 1}

a = -1000
while a < 1000
	b = 1
	while b < 1000
		n = -1
		primes = 0
		while n <= (b.abs)
			n += 1
			result = (n*n) + a*n + b
			if (
				result > 1 and
				is_prime(result)
			)
				primes += 1
			else
				break
			end
		end
		if primes > max_primes[:value]
			max_primes = {value: primes, a: a, b: b, product: a*b}
			puts "max_primes is #{max_primes}"
		end
		b += 1
	end
	a += 1
	puts "a is #{a}"
end

puts max_primes

# b must be positive because when b is negative and n is less than abs(b), the result will always be
# negative. By eliminating negative b values, we can cut operation time just about in half.

# One idea I had was working out the list of primes up to 2001000 (a and b both equal 1000), and then
# checking each result against that list, rather than figuring out if each result was a prime over
# and over.