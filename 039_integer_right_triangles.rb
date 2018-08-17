# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

p = 1000
# A tuple where the first value is the value of p, and the second is the number of solutions for p.
# We only need to keep track of the largest one we've encountered so far.
maximal_solutions = [1, 1]

while p > 3
	solutions_count = 0
	a = 1
	while a < p
		b = 999
		while b >= a
			c = p - a - b
			if (a*a) + (b*b) == c*c
				solutions_count += 1
			end
			b -= 1
		end
		a += 1
	end
	if solutions_count > maximal_solutions[1]
		maximal_solutions = [p, solutions_count]
	end
	p -= 1
end

puts maximal_solutions
# result: [840, 8]

# We're iterating though all values of p from 3 to 1000, for each of those, all values of a from 1 to p,
# and for each of those, all values of b from a to 1000. This is kind of a disaster and should be optimized.
# It's not bad for a first try though, and it runs surprisingly fast, so I'm leaving it for now.

# NB I am aware that ruby does not contain tuples, it's just a two element list that I call a
# tuple because I've been doing too much python recently.