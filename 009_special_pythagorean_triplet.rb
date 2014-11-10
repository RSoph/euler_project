require 'pry'

class Triplet

	attr_accessor :a, :b, :c

	def initialize(a, b, c)
		@a = a
		@b = b
		@c = c
	end

	def check_py
		@a**2 + @b**2 == @c**2
	end

	def check_sum
		@a + @b + @c == 1000
	end

end

(3..998).each do |a|
	(a..998).each do |b|
		a = a.to_f
		b = b.to_f
		c = Math.sqrt((a**2) + (b**2))
		triplet = Triplet.new(a, b, c)
		if triplet.check_py && triplet.check_sum
			puts triplet.a
			puts triplet.b
			puts triplet.c
			puts triplet.a * triplet.b * triplet.c
			break
		end
	end
end