# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def factorial(number):
	factorial = 1
	for num in range(1, number+1):
		factorial *= num
	return factorial

def is_curious(number):
	total = 0
	for digit in str(number):
		total += factorial(int(digit))
	return number == total

curious_numbers = []

counter = 3
while counter < 100000:
	if is_curious(counter):
		curious_numbers.append(counter)
	counter += 1

total = 0
for number in curious_numbers:
	total += number

print total

# NOTE - if I'm being perfectly honest, I don't know how to prove that 40585 is
# the highest curious number. I found it by trial and error.