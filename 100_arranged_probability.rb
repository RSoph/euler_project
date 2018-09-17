# If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs,
# and two discs were taken at random, it can be seen that the probability of taking two blue discs,
# P(BB) = (15/21)×(14/20) = 1/2.

# The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random,
# is a box containing eighty-five blue discs and thirty-five red discs.

# By finding the first arrangement to contain over 10^12 = 1,000,000,000,000 discs in total, determine
# the number of blue discs that the box would contain.

r = 310660171680.0
b = 750000000000.0

# result = (b/b+r) * (b-1 / (b+r-1))
result = (b**2 - b) / (b**2 + 2*b*r - b + r**2 - r)
while result >= 0.5
	r += 1.0
	puts result
	result = (b**2 - b) / (b**2 + 2*b*r - b + r**2 - r)
end

while result <= 0.5
	b += 1.0
	puts result
	result = (b**2 - b) / (b**2 + 2*b*r - b + r**2 - r)
end

while result >= 0.5
	r += 1.0
	puts result
	result = (b**2 - b) / (b**2 + 2*b*r - b + r**2 - r)
end

puts b
puts r
puts result

