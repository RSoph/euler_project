# 1 Jan 1901 to 31 Dec 2000
# 1 Jan 1900 was a Monday.
# 1 Jan 1901 was a Tuesday.
# How many Sundays fell on the first of the month during the twentieth century?

year = 1901
day = 2
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
		if day % 7 == 0
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

# The tl;dr version of this is that we're starting on Tuesday, January 1, 1901:
# day = 2, month = 1, year = 1901.
# We're adding the number of days in each month to the 'day' variable. January has 31, so
# day becomes 33. We check if that's divisible by 7 (it's not), so February 1 1901 was not a Sunday.
# We continue this process through the 20th Century, adding one to the counter whenever day is
# divisible by 7.
# At the very end, we are on January 1 2001. If that happens to be a Sunday, then it will have been
# counted, and we need to subtract it out. As it happens, it wasn't a Sunday, so that part didn't matter
# but I'm leaving it in for completeness.