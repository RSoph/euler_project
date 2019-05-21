# The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

# 1! + 4! + 5! = 1 + 24 + 120 = 145

# Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

# 169 -> 363601 -> 1454 -> 169
# 871 -> 45361 -> 871
# 872 -> 45362 -> 872

# It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

# 69 -> 363600 -> 1454 -> 169 -> 363601 (-> 1454)
# 78 -> 45360 -> 871 -> 45361 (-> 871)
# 540 -> 145 (-> 145)

# Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

# How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

def factorial(number):
	total = 1
	while number > 1:
		total *= number
		number -= 1
	return total

def digit_factorial(number):
	number_string = str(number)
	total = 0
	for character in number_string:
		total += factorial(int(character))
	return total

def make_chain(starting_number, chains):
	chain = []
	current_number = starting_number
	while True:
		if not current_number in chain:
			if current_number in chains:
				return len(chain) + chains[current_number]
			chain.append(current_number)
			current_number = digit_factorial(current_number)
		else:
			return len(chain)

chains = {}
chains_of_sixty = 0
counter = 1

while counter < 1000000:
	chain_length = make_chain(counter, chains)
	if chain_length == 60:
		chains_of_sixty += 1
	chains[counter] = chain_length
	counter += 1
	print counter

print chains_of_sixty


