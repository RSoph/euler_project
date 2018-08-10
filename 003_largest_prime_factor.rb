# What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor(num)
	counter = 2
	while counter * counter < num + 1
		if num % counter == 0
			num = num / counter
			counter = 1
		end
		counter += 1
	end
	num
end

puts largest_prime_factor(600851475143)
