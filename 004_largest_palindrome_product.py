# Find the largest palindrome made from the product of two 3-digit numbers.

# counter1 = 999
# max_palindrome = 99

# while counter1 > 99:
# 	counter2 = 999
# 	while counter2 > 99:
# 		if (
# 			str(counter1 * counter2) == str(counter1 * counter2)[::-1] and
# 			counter1 * counter2 > max_palindrome
# 			):
# 				max_palindrome = counter1 * counter2
# 		counter2 -= 1
# 	counter1 -= 1

# print(max_palindrome)

# 906609




class HelloWorld:
	greeting = "Hello world!"

	def do_greeting(self):
		return self.greeting


hello = HelloWorld()
new_greeting = hello.do_greeting()

print(new_greeting)