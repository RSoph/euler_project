require 'benchmark'

class Grid

	attr_accessor :paths

	#Project Euler #15
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
		@paths = routes(@right, @down)
	end

	def routes(right, down)
		paths = 0
		if right == 0 || down == 0
			paths += 1
		else
			paths += routes(right - 1, down) + routes(right, down - 1)
		end
		paths
	end

end

puts Benchmark.measure { new_grid = Grid.new(5, 5).paths }
puts Grid.new(5, 5).paths

