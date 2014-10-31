class Number

	attr_accessor :value, :powers, :final_sum

	def initialize(number)
		@value = number
		@powers = powers?
	end

	def powers?
		sum = 0
		@value.to_s.each_char do |digit|
			sum += digit.to_i**5
		end
		sum == @value
	end
end

final_sum = 0
counter = 2

while counter <= 5000000
	new_number = Number.new(counter)
	final_sum += counter if new_number.powers?
	counter += 1
	puts "the counter is at #{counter}" if counter % 10000 == 0
end

puts final_sum