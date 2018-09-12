# The proper divisors of a number are all the divisors excluding the number itself. For example,
# the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28,
# we call it a perfect number.

# Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of
# 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.

# Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of
# five numbers:

# 12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)

# Since this chain returns to its starting point, it is called an amicable chain.

# Find the smallest member of the longest amicable chain with no element exceeding one million.

class Amicable

	attr_accessor :chain

	def initialize(number)
		@@failed_chains = []
		@number = number
		@chain = generate_chain
	end

	def generate_chain
		chain = [@number]
		new_number = advance_number(@number)
		while (
			not @@failed_chains.include?(new_number) and
			not chain.include?(new_number) and
			new_number <= 1000000
		)
			chain << new_number
			new_number = advance_number(new_number)
		end
		if new_number == @number
			return chain
		else
			@@failed_chains << chain
			@@failed_chains = @@failed_chains.flatten.uniq
			return [0]
		end
	end

	def find_divisors(num)
		divisors = [1]
		counter = 2
		while counter < num
			if num % counter == 0
				divisors << counter
			end
			counter += 1
		end
		divisors
	end

	def advance_number(num)
		next_element = find_divisors(num).sum
	end
end

result = {:starting_number => 12496, :minimum => 12496, :length => 5}
(2..1000000).each do |number|
	new_number = Amicable.new(number)
	chain = new_number.chain
	if chain.length > result[:length]
		result = {:starting_number => number, :minimum => chain.sort[0], :length => chain.length}
		puts result
	end
end

# I did get the correct answer, but I don't feel great about it. This program takes over an hour
# to run, and it prints out guesses as it goes. There's clearly a ton of optimization to do here.
