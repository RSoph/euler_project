def sum_diags
	total = 1
	square = 3
	while square < 1002
		fourcorners = 4*(square*square) - 6*(square) + 6
		total += fourcorners		
		square += 2
	end
	total
end

puts sum_diags