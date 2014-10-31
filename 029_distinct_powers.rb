results = []
a = 2
b = 2

while a <= 100
	while b <= 100
		results << a**b
		b += 1
	end
	b = 2
	a += 1
end

puts results.uniq.size
