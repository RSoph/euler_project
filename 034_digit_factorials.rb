# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def factorial(number)
	factorial = 1
	(1..number).each do |num|
		factorial *= num
	end
	factorial
end

def is_curious?(number)
	total = 0
	number.to_s.chars.each do |digit|
		total += factorial(digit.to_i)
	end
	number == total
end

curious_numbers = []

counter = 3
while counter < 100000
	if is_curious?(counter)
		curious_numbers.append(counter)
	end
	counter += 1
end

total = 0

curious_numbers.each do |number|
	total += number
end

puts(total)
# 40730

# NOTE - if I'm being perfectly honest, I don't know how to prove that 40585 is
# the highest curious number. I found it by trial and error.