values = {
	"I": 1,
	"V": 5,
	"X": 10,
	"L": 50,
	"C": 100,
	"D": 500,
	"M": 1000
}

def convert_to_arabic(string):
	counter = 0
	total = 0
	while counter < len(string) - 1:
		if values[string[counter]] < values[string[counter+1]]:
			total -= values[string[counter]]
		else:
			total += values[string[counter]]
		counter += 1
	total += values[string[-1]]
	return total
