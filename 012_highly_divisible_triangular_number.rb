def find_triangle(counter)
	((counter*counter) + counter)/2
end

def divisors(number)
  count = 0
  root = Math.sqrt(number)
  (1..root).each do |n|
    if number % n == 0
      count += 2
    end
  end
  if root * root == number
    count -= 1
  end
  count
end

counter = 4000
triangle = find_triangle(counter)

while divisors(triangle) < 500
	counter += 1
	triangle = find_triangle(counter)
end

puts find_triangle(counter)