# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

defmodule Fibonacci do
	def next_number(sum, x, y) do
		sum = 
			case x do
				n when n < 4000001 ->
					sum =
						case rem(x, 2) do
							0 -> 
								sum + x
							_ -> 
								sum
						end
					[new_x, new_y] = [y, x + y]
					next_number(sum, new_x, new_y)
				_ ->
					sum
			end
		sum
	end
end

IO.inspect(Fibonacci.next_number(0, 1, 1), label: "--------------")

# 4613732