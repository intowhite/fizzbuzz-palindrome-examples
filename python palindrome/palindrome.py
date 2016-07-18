#-
# Example palindrome program
#
# Run from command line with 1 argument ->
# python ./palindrome.py pal.txt
#-

import sys
import string

def sarah_palindrome ():
	cries = get_text()
	map (checkpalindrome,cries)

def get_text ():
# Read file passed from command line arg

	textfile_path = sys.argv[1]
	textfile = open(textfile_path,'r')
	text = list(textfile)
	return [x.strip() for x in text]

def checkpalindrome ( word ):
# Checks if the string is a palindrome

	if (word.lower() == word[::-1].lower()):
		print 'AY |', r_lexical(word)
	else:
		print 'NAY |', r_lexical(word)

def r_lexical ( word ):
# Sort and format for output

	word = word.replace(' ','')
	li = list(word)
	li.sort()
	li.sort(key=lambda x:(x.islower(), x))
	s = ''.join(li)
	return s[::-1]

sarah_palindrome()