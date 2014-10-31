counter1 = 999
palindromes = []

while counter1 > 99
	counter2 = 999
	while counter2 > 99
		if (counter1*counter2).to_s == (counter1*counter2).to_s.reverse
			if palindromes.sort[-1] && counter1*counter2 < palindromes.sort[-1]
				break
			else
				palindromes << counter1*counter2
			end
		end
		counter2 -= 1
	end
	counter1 -= 1
end

puts palindromes.sort[-1]