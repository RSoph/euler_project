# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 
# 5-digit number, 12345, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 
# 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

require 'set'

def is_equation(string)
	first = string[0].to_i
	second = string[1..4].to_i
	third = string[0..1].to_i
	fourth = string[2..4].to_i
	product = string[5..-1].to_i
	return first * second == product || third * fourth == product
end

def permutations(string)
	if string.length == 2
		return [string[0] + string[1], string[1] + string[0]]
	end
	results = set()
	for char in string
		for permutation in permutations(string[1..-1])
			results.add(char + permutation)
		end
	end
end

@permutations_list = Set.new()

def do_permute(string, i, length)
    if i == length
        @permutations_list.add(string.join(""))
    else
        (i..length).each do |j|
            string[i], string[j] = string[j], string[i] 
            do_permute(string, i + 1, length) 
            string[i], string[j] = string[j], string[i] 
        end
    end
    @permutations_list
end

def permute(string)
	do_permute(string.split(""), 0, string.length)
end

variable = 1234
print variable
puts(variable)

permute("123456789")
results = Set.new()

@permutations_list.each do |string|
	if is_equation(string)
		results.add(string[5..-1].to_i)
	end
end
puts(results.sum)

# I cheated a little here. I copied a python permuatation function from the internet. 
# If I'm being honest I don't really understand how it works. I tried stepping through it, but oh no.









