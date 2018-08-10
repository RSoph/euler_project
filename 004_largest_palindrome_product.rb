# Find the largest palindrome made from the product of two 3-digit numbers.

counter1 = 999
max_palindrome = 99

while counter1 > 99
	counter2 = 999
	while counter2 > 99
		if (
			(counter1*counter2).to_s == (counter1*counter2).to_s.reverse and
			counter1*counter2 > max_palindrome
			)
				max_palindrome = counter1*counter2
		end
		counter2 -= 1
	end
	counter1 -= 1
end

puts max_palindrome

# My first solution involved keeping a list of all the palindromes I encountered, sorting them all the time,
# and finally returning the last one. That was silly, now I'm only keeping track of the largest.