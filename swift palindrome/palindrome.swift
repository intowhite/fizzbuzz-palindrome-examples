#!/usr/bin/swift 

/*
* Example palindrome program
*
* Make sure the file is executable on your machine ->
* chmod +x palindrome.swift
*
* Run from command line with 1 argument ->
* ./palindrome.swift pal.txt
*/

import Foundation

func get_file_contents(file :String) -> String {
// return file contents
	do {
	    let contents = try NSString(contentsOfFile: file, encoding: NSUTF8StringEncoding)
	    return contents as String
	}
	catch let error as NSError {
	    return "error: \(error)"
	}
}

func format_line(line :String) -> String {
// returns sorted, trimmed, reversed line
	let sorted = String(line.characters.sort())
	let trimmed = sorted.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
	let reversed = String(trimmed.characters.reverse())
	return reversed
}

func check_palindrome(line: String) -> String {
// returns AY/NAY flag along with formatted line
	let reversed = String(line.characters.reverse())
	if (line.lowercaseString == reversed.lowercaseString) {
		return "AY | " + String(format_line(line))
	} else {
		return "NAY | " + String(format_line(line))
	}
}

let file_name = Process.arguments[1]
let file_contents = get_file_contents(file_name)
let line_array = file_contents.componentsSeparatedByString("\n")

for line in line_array {
	print(check_palindrome(line))
}