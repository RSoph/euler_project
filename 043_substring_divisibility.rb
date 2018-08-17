def has_property(number)
	number = number.to_s
	return (
		number[3].to_i % 2 == 0 and
		number[2..4].to_i % 3 == 0 and
		number[5].to_i % 5 == 0 and
		number[4..6].to_i % 7 == 0 and
		number[5..7].to_i % 11 == 0 and
		number[6..8].to_i % 13 == 0 and
		number[7..9].to_i % 17 == 0
	)
end

total = 0

pandigital_numbers = %w[1 2 3 4 5 6 7 8 9 0].permutation.map(&:join)

pandigital_numbers.each do |number|
	if (
		number[0] != "0" and
		has_property(number)
	)
		total += number.to_i
		puts total
	end
end

puts total

# I'm not overly proud of this one. I struggled for some time to write a permutation function, and
# when I eventually looked it up, it turns out Ruby has one. Since that was by far the hardest part
# of this problem, the rest of it only took about 10 minutes, and I somehow feel like I cheated.