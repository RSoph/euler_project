# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125
# (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits
# which are also cube.

# Find the smallest cube for which exactly five permutations of its digits are cube.

# counter = 703
# counter = 340
# counter = 729
counter = 5025
found_five = false

while found_five == false
	counter += 1
	found = 0
	puts counter
	permutations = (counter**3).to_s.split("").permutation.uniq
	permutations.each do |number|
		if (
			number[0] != "0" and
			((number.join("").to_i) ** (1.0/3))%1 > 0.9999999
		)
			found += 1
			puts number.join("")
		end
	end
	if found == 5
		found_five = true
	end
end

puts counter

# Note, I'm getting from the internet that the actual solution is in the 5 thousands. This program is
# stepping the counter by one every second or so and I'm only in the 7 hundreds.
# Clearly there is much optimization to be made.