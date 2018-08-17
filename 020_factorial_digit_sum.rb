# Find the sum of the digits in the number 100!

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

puts digit_sum(factorial(100))