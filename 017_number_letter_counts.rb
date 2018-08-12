# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains
# 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing
# out numbers is in compliance with British usage.

require 'pry'

class Number

	attr_accessor :num, :word, :length

	@@words_hash = {1 => "one", 2 => "two", 3=>"three", 4=> "four", 5 => "five", 6=> "six", 7=>"seven", 8=> "eight", 9=> "nine", 10=>"ten",
		11=>"eleven", 12=>'twelve', 13=> 'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen', 20=>'twenty',
		30=>'thirty', 40=>'forty', 50=>'fifty', 60=>'sixty', 70=>'seventy', 80=>'eighty', 90=>'ninety', 1000=>'onethousand'}

	def initialize(num)
		@num = num
		@word = find_word(@num)
		@length = @word.length
	end

	def find_word(num)
		if num == 1000
			first_word = @@words_hash[1000]
		elsif num <= 20
			first_word = @@words_hash[num]
		elsif num < 100
			first_word = @@words_hash[num.to_s[0].to_i*10]
			second_word = @@words_hash[num.to_s[-1].to_i]
		elsif num < 1000
			second_word = find_word(num.to_s[1..2].to_i)
			first_word = @@words_hash[num.to_s[0].to_i] + "hundred"
			if second_word
				first_word = first_word + "and"
			end
		end
		first_word ||= ""
		second_word ||= ""
		word = first_word + second_word
	end
end

counter = 1
sum = 0

while counter <= 1000
	new_number = Number.new(counter)
	puts counter
	puts new_number.word
	sum += new_number.length
	counter += 1
end

puts sum