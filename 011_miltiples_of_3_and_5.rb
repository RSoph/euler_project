counter = 1
sum = 0

while counter < 1000
	if counter % 3 == 0
		sum += counter
	elsif counter % 5 == 0
		sum += counter
	end
	counter += 1
end

puts sum