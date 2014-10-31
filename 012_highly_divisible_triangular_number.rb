def divisors(number)
	divisors = 1
	i = 1
	while i <= number / 2
		if number % i == 0
			divisors += 1
		end
		i += 1
	end
	divisors
end


counter = 4000
sum = 8002000

while counter < 5000
	sum += counter
	if divisors(sum) > 500
		puts counter
		puts sum
		puts divisors(sum)
	end
	if counter % 100 == 0
		puts "the counter is at #{counter}"
	end
	counter += 1
end

# new_counter = 1
# new_sum = 0
# while new_counter <= 4000
# 	new_sum += new_counter
# 	new_counter += 1
# end

# puts new_sum
# puts divisors(new_sum)
