class Grid

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
	end

	def routes
		routes = fact(@right + @down) / (fact(@right) * fact(@down))
	end

	#there is no factorial method in Ruby, so I am writing my own within this class
	def fact(number)
		if number == 0
			fact = 1
		else
			fact = number * fact(number - 1)
		end
		fact
	end
end

test = Grid.new(20, 20)
puts test.routes