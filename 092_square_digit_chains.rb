require 'pry'

class Chain

	@@chain_hash = {}

	attr_accessor :starting_number, :ending_number

	def initialize(number)
		@starting_number = number
		@ending_number = ending_number
	end

	def ending_number
		next_number = @starting_number
		while next_number != 89 && next_number != 1
			new_number = 0
			next_number.to_s.each_char do |digit|
				new_number += digit.to_i**2
			end
			next_number = new_number
			if @@chain_hash[:next_number]
				@@chain_hash[:starting_number] = @@chain_hash[next_number]
				return @@chain_hash[next_number]
				break
			end
		end
		if next_number == 89 || next_number == 1
			@@chain_hash[:starting_number] = next_number
		end
		next_number
	end
end

eighty_nine_count = 0

counter = 1
while counter < 10000000
	new_chain = Chain.new(counter)
	if new_chain.ending_number == 89
		eighty_nine_count += 1
	end
	counter += 1
	if counter % 100000 == 0
		puts counter
	end
end

puts eighty_nine_count
