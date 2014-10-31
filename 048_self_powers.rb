sum = 0
counter = 1

while counter <= 1000
	sum += counter**counter
	sum = sum % 10000000000
	counter += 1
end

puts sum