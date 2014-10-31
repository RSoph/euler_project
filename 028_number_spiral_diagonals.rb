require 'pry'

counter = 1
sum = 25
adder = 4

while counter <= 1002001
	4.times do
		counter += adder
		sum += counter
	end
	adder += 1
end

puts sum