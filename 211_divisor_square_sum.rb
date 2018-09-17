# For a positive integer n, let σ2(n) be the sum of the squares of its divisors. For example,

# σ2(10) = 1 + 4 + 25 + 100 = 130.
# Find the sum of all n, 0 < n < 64,000,000 such that σ2(n) is a perfect square.

class Sigma

	attr_accessor :number, :result, :is_perfect_square

	@@found_divisors = {}

	def initialize(number)
		@number = number
		@result = find_result
		@is_perfect_square = is_perfect_square
	end

	def find_divisors
		divisors = [number]
		counter = number / 2
		while counter > 0
			if (
				not divisors.include?(counter) and
				@number % counter == 0
			)
				if @@found_divisors[counter]
					divisors << @@found_divisors[counter]
				end
				divisors << counter
			end
			counter -= 1
		end
		@@found_divisors[@number] = divisors.flatten.uniq
		divisors.flatten.uniq
	end

	def find_result
		total = 0
		find_divisors.each do |divisor|
			total += divisor*divisor
		end
		total
	end

	def is_perfect_square
		Math.sqrt(@result) % 1 == 0
	end
end

result = 0
(0..64000000).each do |number|
	new_number = Sigma.new(number)
	if new_number.is_perfect_square
		result += new_number.number
		puts result
	end
end
