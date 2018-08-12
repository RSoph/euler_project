require 'benchmark'

class Grid

	attr_accessor :paths

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

# This is an alternate implementation of the same problem. Instead of using the
# formula (x + y)! / (x! * y!), it makes use of recursion. I wondered what the preformance
# difference between the two would be - hence the benchmark - and it turns out the
# formula method is about 10 times as fast!