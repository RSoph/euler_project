# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
class Triplet

	attr_accessor :a, :b, :c, :correct_sum

	def initialize(a, b)
		@a = a
		@b = b
		@c = Math.sqrt((a**2) + (b**2))
		@correct_sum = check_sum
	end

	def check_sum
		@a + @b + @c == 1000
	end

end

(3..998).each do |a|
	(a..998).each do |b|
		a = a.to_f
		b = b.to_f
		triplet = Triplet.new(a, b)
		if triplet.correct_sum
			puts triplet.a
			puts triplet.b
			puts triplet.c
			puts triplet.a * triplet.b * triplet.c
			break
		end
	end
end