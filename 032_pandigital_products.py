# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 
# 5-digit number, 12345, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 
# 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

def is_equation(string):
	first = int(string.split(" ")[0])
	second = int(string.split(" ")[2])
	product = int(string.split(" ")[4])
	return first * second == product

def make_expression_1(string):
	return string[:1] + " x " + string[1:5] + " = " + string[5:]

def make_expression_2(string):
	return string[:2] + " x " + string[2:5] + " = " + string[5:]

def permutations(string):
	if len(string) == 2:
		return {string[0] + string[1], string[1] + string[0]}
	results = set()
	for char in string:
		for permutation in permutations(string[1:]):
			results.add(char + permutation)

permutations = []
def do_permute(string, i, length): 
    if i == length: 
        permutations.append(''.join(string))
    else: 
        for j in range(i, length): 
            string[i], string[j] = string[j], string[i] 
            do_permute(string, i + 1, length) 
            string[i], string[j] = string[j], string[i] 

def permute(string):
	do_permute(list(string), 0, len(string))

permute("123456789")
results = set()
for string in permutations:
	# print(string)
	if is_equation(make_expression_1(string)):
		print(string)
		results.add(int(string[5:]))
	if is_equation(make_expression_2(string)):
		print(string)
		results.add(int(string[5:]))

print(results)
print(sum(results))

# I cheated a little here. I copied a python permuatation function from the internet. 
# If I'm being honest I don't really understand how it works. I tried stepping through it, but oh no.









