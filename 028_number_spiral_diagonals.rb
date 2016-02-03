def sum_diags
	total = 1
	square = 3
	while square < 1002
		newitem = square * square
		total += newitem
		3.times do
			newitem = newitem - square + 1
			total += newitem			
		end
		square += 2
	end
	total
end

puts sum_diags