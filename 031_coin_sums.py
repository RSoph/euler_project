# In England the currency is made up of pound, L, and pence, p, and there are
# eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, L1 (100p) and L2 (200p).
# It is possible to make L2 in the following way:

	# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# How many different ways can L2 be made using any number of coins?


def find_combinations(number):
	values = [1, 2, 5, 10, 20, 50, 100, 200]
	max_coin = values[-1]
	if number < 1:
		return 0
	if number == 1:
		return 1
	for num, value in enumerate(values, start=0):
		if (
			values[num-1] and
			values[num-1] > number
		):
			max_coin = value
	while max_coin >= number:
		number = number - max_coin
		combinations = 1 + (find_combinations(number))


print(find_combinations(200))
# print(combinations)