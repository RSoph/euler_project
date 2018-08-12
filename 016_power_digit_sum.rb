# What is the sum of the digits of the number 2^1000?

puts (2**1000).to_s.split("").map{|digit| digit.to_i }.inject :+

# ___________________
# I realize that this is almost unreadable, but I was pretty pleased that I got it into one line so
# I'm leaving it that way. As a professional exercise, I'm rewriting it below more in the style
# that I'd expect someone else to read.

digit_array = (2**1000).to_s.split("")
total = 0

digit_array.each do |char|
	total += char.to_i
end

puts total