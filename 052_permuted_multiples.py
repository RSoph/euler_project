# It can be seen that the number, 125874, and its double, 251748, contain
# exactly the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
# contain the same digits

def is_solution(number):
	number_times_2 = number * 2
	number_times_3 = number * 3
	number_times_4 = number * 4
	number_times_5 = number * 5
	number_times_6 = number * 6

	first_sorted = sorted(str(number))
	second_sorted = sorted(str(number_times_2))
	third_sorted = sorted(str(number_times_3))
	fourth_sorted = sorted(str(number_times_4))
	fifth_sorted = sorted(str(number_times_5))
	sixth_sorted = sorted(str(number_times_6))

	return (
		first_sorted == second_sorted and
		second_sorted == third_sorted and
		third_sorted == fourth_sorted and
		fourth_sorted == fifth_sorted and
		fifth_sorted == sixth_sorted
	)

number = 1
while not is_solution(number):
	number += 1

print number

# This is a very basic problem. For each number, figure out its various
# multiples, then figure out if the sorted digits of those results all equal
# each other. If not, add one and try again. If so, print the number that
# got you there.

# If offends my sensibilities somewhat to return a boolean with five different
# clauses, but I don't see any other options, so this is the weight I must bear. 