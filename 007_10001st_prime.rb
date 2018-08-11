# What is the 10001st prime number?
def find_nth_prime(num)
	primes = [2]
	counter = 3
	counter2 = 2
	while primes.size < num
		while counter2 < counter
			if counter % counter2 == 0
				break
			elsif counter2 * counter2 > counter
				primes << counter
				break
			else
				counter2 += 1
			end
		end
		counter += 1
		counter2 = 2
	end
	primes
end

puts find_nth_prime(10001)