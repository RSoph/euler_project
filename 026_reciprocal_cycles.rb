longest_cycle = {:d => 1, :length => 1}
d = 1

def cycle_length(num)
	return 4
end

while d < 1000
	length = cycle_length(d)
	if length > longest_cycle[:length]
		longest_cycle = {:d => d, :length => length}
	end
	d += 1
end

puts longest_cycle