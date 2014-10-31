def difference(num)
	sum = 0
	squares = 0
	(1..num).each do |number|
		squares += number*number
		sum += number
	end
	(sum*sum) - squares
end

puts difference(100)