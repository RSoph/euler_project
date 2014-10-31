require 'pry'

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