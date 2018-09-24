# The first known prime found to exceed one million digits was discovered in 1999, and is a Mersenne
# prime of the form 26972593−1; it contains exactly 2,098,960 digits. Subsequently other Mersenne primes,
# of the form 2p−1, have been found which contain more digits.

# However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits:
# 28433×2^7830457+1.

# Find the last ten digits of this prime number.

total = 1

7830457.times do
	total = (total * 2) % 10000000000
end

total = ((total * 28433) % 10000000000) + 1

puts total

# I'm pretty pleased with this. It feels like cheating somehow to not have defined a single method or class,
# but this thing runs in a few seconds, and the code is pretty dry. I originally had a whole thing for
# trucating at 10 digits: total = total.to_s.rjust(10, '0')[-10..-1].to_i - convert to string,
# right-justify by padding with '0', take the last ten characters, convert back to integer. It
# was kinda gross and I'm glad I realised that was the same as the % operation.
