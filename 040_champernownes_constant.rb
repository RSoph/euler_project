string = "1"
d1 = 1
counter = 2
while string.length < 1000000
	string << counter.to_s
	counter += 1
end

d1 = 1
d10 = string[9].to_i
d100 = string[99].to_i
d1000 = string[999].to_i
d10000 = string[9999].to_i
d100000 = string[99999].to_i
d1000000 = string[999999].to_i

total = d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
puts total

# Optimization ideas: Don't keep track of that ungodly string the whole time,
# just keep track of the number of digits. Whenever a 'landmark' is crossed, make a note of the
# important digit, and then move on without keeping track of the rest of them.

# Still, it runs in only a few seconds, so I'm not sure how much better an optimized version would be.