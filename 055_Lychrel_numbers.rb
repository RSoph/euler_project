class SpecialNumbers

	def preform_lychrization(number)
		return number + number.to_s.reverse.to_i
	end

	def is_palendrome?(number)
		string = number.to_s
		if (
			string.length == 1 or
			(string.length == 2 and string[0] == string[1])
			)
			return true
		elsif string[0] != string[-1]
			return false
		else
			return is_palendrome?(string[1..-2])
		end
	end

	def is_lychrel?(number)
		counter = 0
		while counter < 51
			if is_palendrome?(number)
				return false
			else
				number = preform_lychrization(number)
				counter +=1
			end
		end
		return true
	end
end

lychrel_count = 0
number = 1

while number <= 10000
	lychrel_count += 1 if SpecialNumbers.new.is_lychrel?(number)
	number += 1
end

puts lychrel_count