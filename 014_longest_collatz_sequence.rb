# The following iterative sequence is defined for the set of positive integers:

# Given a number n in the Collatz sequence,
# if n is even, the next number in the sequence is n/2
# if n is odd, the next number in the sequence is 3n + 1

# Applying the rule above with the starting number 13, we generate the following sequence:

# 13 40 20 10 5 16 8 4 2 1 It can be seen that this sequence (starting at 13 and 
# finishing at 1) contains 10 terms. Although it has not been proved yet 
# (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

class Collatz

	attr_accessor :number

	# This keeps track of every number we've covered so far and its length.
	# We'll check each number against it and break the sequence if we duplicate numbers
	# Example: If we arrive at 5, we know from the sequence in the instructions that
	# there are 5 more steps, so we just add five to the counter (on line 34), and move on.
	@@lengths = {}

	def initialize(number)
		@number = number
	end

	def length
		num = @number
		sequence_length = 0
		while num != 1
			if @@lengths[num]
				sequence_length += @@lengths[num]
				sequence_length -= 1
				break
			else
				num = advance_number(num)
				sequence_length += 1
			end
		end
		sequence_length += 1
		@@lengths[@number] = sequence_length
	end

	def advance_number(num)
		if num % 2 == 0
			num = num / 2
		else
			num = num * 3 + 1
		end
		num
	end
end

greatest_length = {:number => 1, :sequence_length => 1}
(1..1000000).each do |number|
	new_number = Collatz.new(number)
	if new_number.length > greatest_length[:sequence_length]
		greatest_length[:number] = number
		greatest_length[:sequence_length] = new_number.length
	end
end

puts greatest_length

# Honestly I wrote this so long ago I couldn't remember the reason for using symbols instead of strings.
# I just looked it up, and it's much more preformant in ruby to use symbols as dictionary keys.
# Good for me knowing that 4 years ago!
