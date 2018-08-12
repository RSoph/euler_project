# Find the sum of all the primes below two million.

primes = [2]
counter = 2
sum_of_primes = 2

1999998.times do
	counter += 1
	primes.each do |prime|
		if counter % prime == 0
			break
		elsif prime**2 > counter
			primes << counter
			sum_of_primes += counter
			break
		end
	end
end

puts sum_of_primes
