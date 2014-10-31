# 1 Jan 1901 to 31 Dec 2000
# 1 Jan 1900 was a Monday.

require 'pry'

year = 1900
day = 1
sunday_counter = 0

def days(month, year)
	days = 28
	days += 2 if month == 4 || month == 6 || month == 9 || month == 11
	days += 3 if month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12
	days += 1 if month == 2 && year % 4 == 0
	days -= 1 if month == 2 && year % 100 == 0
	days += 1 if month == 2 && year % 400 == 0
	days
end

until year == 2001 do
	month = 1
	until month == 13 do
		day += days(month, year)
		if day % 7 == 0 && year != 1900
			sunday_counter += 1		
		end
		month += 1
	end
	year += 1
end

if day % 7 == 0
	sunday_counter -= 1
end

puts sunday_counter