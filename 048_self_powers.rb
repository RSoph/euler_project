# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

sum = 0
counter = 1

while counter <= 1000
	sum += counter**counter
	sum = sum % 10000000000
	counter += 1
end

puts sum