# What is the largest prime factor of the number 600851475143 ?

defmodule Primes do

	def get_largest_prime(number, counter) do
		result =
			case counter do
				c when c <= number ->
					case rem(number, counter) do
						0 -> 
							number = div(number, counter)
							get_largest_prime(number, 2)
						_ ->
							get_largest_prime(number, counter+1)
					end
				_ ->
					counter
			end
		result
	end
end

IO.inspect(Primes.get_largest_prime(600851475143, 2), label: "--------------")
# 6857