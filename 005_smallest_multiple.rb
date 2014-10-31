def multiple(num)
	product = 1
	while num > 1
		product = product*num
		num -= 1
	end
	product
end

def check_number(num, product)
	result = true
	(1..num).each do |number|
		if product % number != 0
			result = false
			break
		end
	end
	return result
end

def find_primes(num)
	primes = [2]
	counter = 3
	while counter <= num
		counter2 = 2
		while counter2 <= counter
			if counter % counter2 == 0
				break
			elsif
				counter2 * counter2 > counter
				primes << counter
				break
			end
			counter2 += 1
		end
	counter += 1
	end
	primes
end

def find_smallest(num, product, primes, check_number)
	counter = 0
	while counter < primes.size
		while check_number(num, product)
			product = product / primes[counter]
		end
		product = product * primes[counter]
		counter += 1
	end
	product
end

puts find_smallest(20, multiple(20), find_primes(20), check_number(20, multiple(20)))			