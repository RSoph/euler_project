require 'pry'

primes = [2]

counter = 2

1999998.times do
	counter += 1
	primes.each do |prime|
		if counter % prime == 0
			break
		elsif prime**2 > counter
			primes << counter
			break
		end
	end
end

sum_of_primes = 0

primes.each do |prime|
	sum_of_primes += prime
end

puts sum_of_primes
