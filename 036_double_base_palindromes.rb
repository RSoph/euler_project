class Palindrome

	def initialize(number)
		@base_ten = number.to_s
		@base_two = number.to_s(2)
	end

	def double_palindrome?
		@base_ten == @base_ten.reverse && @base_two == @base_two.reverse
	end

end

total_sum = 0
counter = 1

while counter < 1000000
	new_palindrome = Palindrome.new(counter)
	if new_palindrome.double_palindrome?
		total_sum += counter
	end
	counter += 1
end

puts total_sum