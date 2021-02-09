f = open("program.txt")
text = f.read()



def RemoveSpaces(text):
	text = text.split('\n')
	for i in range(len(text)):
		if not '#' in text[i]:
			text[i] = text[i].replace(' ', '')
		else:
			idx = text[i].find('#')
			text[i] = text[i][idx:]
			text[i] += '\n'
	answer = ''
	for value in text:
		answer += value
	return answer

def getTokens(text):
	for letter in text:
		if letter == "#": print("COMMENT: ")

def prettyPrint(text):
	# split on \n
	# insert \n after ;
	# insert newline after {
	# insert newline before }

	text = text.split("\n")
	for i in range(len(text)):
		text[i] = text[i].strip()
	answer = ""
	for entry in text:
		needsBreak = False
		for letter in entry:
			if letter == "#":
				needsBreak = True
			answer += letter
		if needsBreak:
			amswer += "\n"


	return answer
	

f = open("program.txt")
text = f.read()
# print(prettyPrint(text))

print(text)
