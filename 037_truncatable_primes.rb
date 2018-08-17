# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

def prime(number, primes)
	result = true
	(0..primes.size).each do |index|
		if (primes[index]*primes[index] <= number) && (number % primes[index] == 0)
			result = false
			break
		elsif (primes[index]*primes[index] > number)
			break
		end
	end
	result
end

def truncatable?(number, primes)
	size = number.length

	if size < 2
		return false
	end
	if size > 2
		(1..(size)-1).each do |index|
			if !(number[index] == "1" || number[index] == "3" || number[index] == "5" || number[index] == "7" || number[index] == "9")
				return false
			end
		end
	end
	counter = 0
	while counter <= size
		unless primes.include?(number[0..counter].to_i) && primes.include?(number[(-counter)..-1].to_i)
			return false
		end
		counter += 1
	end
	return true
end

counter = 2
primes = [2]
truncatables_count = 0
total = 0

while truncatables_count < 11
	if prime(counter, primes)
		primes << counter
		if truncatable?(counter.to_s, primes)
			truncatables_count += 1
			total += counter
		end
	end
	counter += 1
end

puts total
