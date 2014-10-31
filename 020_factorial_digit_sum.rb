def factorial(num)
	if num >= 1
		num *= factorial(num - 1)
	else
		1
	end
end

def digit_sum(number)
	sum = 0
	number.to_s.split("").each do |digit|
		sum += digit.to_i
	end
	sum
end

puts factorial(100)
puts digit_sum(factorial(100))
