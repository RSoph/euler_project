# A common security method used for online banking is to ask the user for three
# random characters from a passcode. For example, if the passcode was 531278,
# they may ask for the 2nd, 3rd, and 5th characters; the expected reply would
# be: 317.

# Below are fifty successful login attempts.

# Given that the three characters are always asked for in order, analyse the
# file so as to determine the shortest possible secret passcode of unknown 
# length.

combinations = [319, 680, 180, 690, 129, 620, 762, 689, 762, 318, 368, 710, 720, 710, 629, 168, 160, 689, 716, 731, 736, 729, 316, 729, 729, 710, 769, 290, 719, 680, 318, 389, 162, 289, 162, 718, 729, 319, 790, 680, 890, 362, 319, 760, 316, 729, 380, 319, 728, 716]
# combinations = [620, 623]

code_hash = {}

for combo in combinations:
	combo = str(combo)
	if combo[0] not in code_hash.keys():
		code_hash[combo[0]] = {
			combo[1]: [combo[2]]
		}
	elif combo[1] not in code_hash[combo[0]].keys():
		code_hash[combo[0]][combo[1]] = [combo[2]]
	elif combo[2] not in code_hash[combo[0]][combo[1]]:
		code_hash[combo[0]][combo[1]].append(combo[2])

print code_hash

# I'm not proud of this, I have no idea what the solution is. The answer is
# 73162890 and I know that because I got out a pen and paper and did this by
# hand.

# 129
# 16 0/2
# 168
# 180
# 289
# 290
# 31 6/8/9
# 36 2/8
# 38 0/9
# 62 0/9
# 68 0/9
# 690
# 71 0/6/8/9
# 72 0/8/9
# 73 1/6
# 76 0/2/9
# 790
# 890