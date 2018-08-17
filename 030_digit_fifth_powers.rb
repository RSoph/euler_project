# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

class Number

	attr_accessor :value, :powers, :final_sum

	def initialize(number)
		@value = number
		@powers = powers?
	end

	def powers?
		sum = 0
		@value.to_s.each_char do |digit|
			sum += digit.to_i**5
		end
		sum == @value
	end
end

final_sum = 0
counter = 2

while counter <= 200000
	new_number = Number.new(counter)
	final_sum += counter if new_number.powers?
	counter += 1
end

puts final_sum

# As it turns out, the highest number here is 194979. I did not figure that out, and I can't
# prove it. I just tried higher and higher ceilings until I arrived at the correct answer.

# 9**5 is 59049, times 6 is 354294. That means that there can't be any such numbers beyond
# 354294, because even the largest possible digits aren't enough to keep up with the growing
# numbers. As for the (quite a few) numbers between 194979 and 354294, you can make a similar
# argument that since 299999.sum_of_digits_to_the_fifth equals 295227, that 295227 is likewise
# a ceiling. You can then work out 294999 and probably find a lower ceiling and so on.
# That process can't possibly lead you all the way down to 194979, since we subtracted 5000
# the first time and like 300 the second time. hm.