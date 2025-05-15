# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

values =
	for number <- 1..999 do
		remainder_3 = rem(number, 3)
		remainder_5 = rem(number, 5)
		case {remainder_3, remainder_5} do
			{0, _} -> IO.inspect(number)
			{_, 0} -> IO.inspect(number)
			_ -> 0
		end
	end

IO.inspect(Enum.sum(values))