require 'pry'

class Number

	attr_accessor :num, :word, :length

	@@words_hash = {1 => "one", 2 => "two", 3=>"three", 4=> "four", 5 => "five", 6=> "six", 7=>"seven", 8=> "eight", 9=> "nine", 10=>"ten",
		11=>"eleven", 12=>'twelve', 13=> 'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen', 20=>'twenty',
		30=>'thirty', 40=>'forty', 50=>'fifty', 60=>'sixty', 70=>'seventy', 80=>'eighty', 90=>'ninety', 1000=>'onethousand'}

	def initialize(num)
		@num = num
		@word = find_word(@num)
		@length = find_length(@word)
	end

	def find_word(num)
		if num <= 20
			word = @@words_hash[num]
		elsif num < 100
			big_word = @@words_hash[num.to_s[0].to_i*10]
			small_word = @@words_hash[num.to_s[-1].to_i]
			small_word ||= ""
			word = big_word + small_word
		elsif num < 1000
			small_word = find_word(num.to_s[1..2].to_i)
			big_word = @@words_hash[num.to_s[0].to_i] + "hundred"
			if small_word
				big_word = big_word + "and"
			end
			small_word ||= ""
			word = big_word + small_word
		elsif num == 1000
			word = @@words_hash[1000]
		end
	end

	def find_length(word)
		word.length
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