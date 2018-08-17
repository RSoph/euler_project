# When a decimal repeats infinately, we call the repeating part the 'recurring cycle'.
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

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

# I wrote this absent-mindedly while trying to figure out how the method cycle_length
# should work. I'm still not sure. You could do something like long division, where you keep
# adding a 0 and finding the remainder. When you finally hit the same remainder again,
# you've completed one cycle. One day I'll try that out.