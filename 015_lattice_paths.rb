# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

require 'benchmark'

class Grid

	#Ultimately, the question reduces to this: You must go down x number of times
	#you must go right y number of times (x and y may equal each other).
	#how many permutations of the path exist when selecting steps?
	#the answer is (x + y)! / (x! * y!), since any given x is intertchangable with
	#any other. 

	def initialize(right, down)
		#I'm using two seperate variables for the two dimensions of the grid
		#so that this program will work on non-square grids
		@right = right
		@down = down
		@paths = routes
	end

	def routes
		routes = factorial(@right + @down) / (factorial(@right) * factorial(@down))
	end

	def factorial(number)
		if number == 0
			factorial = 1
		else
			factorial = number * factorial(number - 1)
		end
		factorial
	end
end

puts Benchmark.measure { new_grid = Grid.new(5, 5).paths }
puts Grid.new(5, 5).paths
