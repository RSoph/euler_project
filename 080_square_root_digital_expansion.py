# It is well known that if the square root of a natural number is not an
# integer, then it is irrational. The decimal expansion of such square roots is
# infinite without any repeating pattern at all.

# The square root of two is 1.41421356237309504880..., and the digital sum of
# the first one hundred decimal digits is 475.

# For the first one hundred natural numbers, find the total of the digital sums
# of the first one hundred decimal digits for all the irrational square roots.

from decimal import Decimal, localcontext
total = 0
with localcontext() as ctx:
	ctx.prec = 105
	for number in range(100):
		array = str(Decimal(number).sqrt()).split(".")
		if len(array) == 2:
			total += sum([int(i) for i in array[1][0:99]])
			total += int(array[0])

print total

# Normally I don't like bringing third-parties like Decimal and localcontext
# into these proceedings. I don't even like using the math library.
# but I was not about to write my own square root function from scratch, so
# I made an exception this one time.