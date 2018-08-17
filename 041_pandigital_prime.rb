# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

def is_prime?(number)
	counter = 2
	while counter * counter <= number
		if number % counter == 0
			return false
		end
		counter += 1
	end
	return true
end

def is_pandigital?(number)
	length = number.to_s.length
	if number.to_s.length != number.to_s.chars.uniq.size
		return false
	end
	(1..length).each do |pan|
		if not number.to_s.include?(pan.to_s)
			return false
		end
	end
	return true
end

counter = 9876543210
while counter > 1
	if is_pandigital?(counter) and is_prime?(counter)
		puts counter
		break
	end
	counter -= 1
end

# This takes annoyingly long to run, there's probably some optimization to do.
# Checking that number.to_s.length != number.to_s.chars.uniq.size upfront in the is_pandigital? function
# isn't strictly necessary, but by checking for duplicate digits that way we can return false early for
# some bigish numbers, and that saves some time.