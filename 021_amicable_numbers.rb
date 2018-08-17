# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

class Number

	attr_accessor :number, :divisors, :div_sum

	def initialize(num)
		@number = num
		@divisors = divisors
		@div_sum = sum
	end

	def divisors
		i = 1
		divisors = []
		until i*2 > @number 
			if @number % i == 0
				divisors << i
			end
			i += 1
		end
		divisors
	end

	def sum
		sum = 0
		@divisors.each do |element|
			sum += element
		end
		sum
	end
end

divisors_hash = {}
amicables_sum = 0

counter = 1
while counter <= 10000
	new_number = Number.new(counter)
	divisors_hash[counter] = new_number.div_sum
	if divisors_hash[new_number.div_sum] == counter && new_number.div_sum != counter
		amicables_sum += counter
		amicables_sum += new_number.div_sum
	end
	counter += 1
end

puts amicables_sum