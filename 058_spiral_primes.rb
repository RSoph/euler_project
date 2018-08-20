# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7
# is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more
# interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of
# 8/13 ≈ 62%.

# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will
# be formed. If this process is continued, what is the side length of the square spiral for which the
# ratio of primes along both diagonals first falls below 10%?

# _________________

# This method takes the side length of the square, and gives an array of the four corners.
def new_diagonals(side)
	[side*side, side*side - side + 1, side*side - 2*side + 2, side*side - 3*side + 3]
end

# Not the most efficient prime checker I've ever written, but it's easy to read, and it works fast enough.
# More sensible checkers only check against known primes - no sense trying to divide by 15 if you've
# already tried 5 and 3.
def is_prime?(number)
	counter = 2.0
	while counter*counter <= number
		if number % counter == 0
			return false
		else
			counter += 1
		end
	end
	true
end

counter = 7.0
total_diagonals = 13.0
prime_diagonals = 8.0

while prime_diagonals / total_diagonals >= 0.10 do
	counter += 2
	new_diagonals(counter).each do |corner|
		if is_prime?(corner)
			prime_diagonals += 1
		end
		total_diagonals += 1
	end
end

puts counter

# Rather than keeping track of that whole square, I'm just counting primes and diagonals as I go.
# I was really rather surprised at how high a number the answer is. Primes are increasingly rare,
# I wouldn't have thought you'd have to count so high to get to under 10%!
