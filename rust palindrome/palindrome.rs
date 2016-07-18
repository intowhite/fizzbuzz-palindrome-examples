//-
// Example palindrome program

// Compile first ->
// rustc nazgul.rs

// Run from command line with 1 argument ->
// ./nazgul pal.txt
//-

use std::env;
use std::fs::File;
use std::io::{Read,BufReader};


fn main() {
// Read file passed from command line arg

	if let Some(arg1) = env::args().nth(1) {
		let mut data = String::new();
	    let f = File::open(arg1).unwrap();
	    let mut br = BufReader::new(f);
	    br.read_to_string(&mut data).unwrap();
	    for line in data.lines() {
	    	checkpalindrome(line);
	    }
	}
}

fn checkpalindrome(s: &str) {
// Check if str in palindrome

	let s_rev = s.chars().rev().collect::<String>();
	if s.to_lowercase() == s_rev.to_lowercase() {
		r_lexical("AY |",s);
	} else {
		r_lexical("NAY |",s);
	}
}

fn r_lexical(p: &str, s: &str) {
// Sort and format for output

    let mut chars: Vec<char> = s.chars().collect();
    chars.sort_by(|first, second| second.cmp(first));
    let mut clean = String::new();
    for c in chars {
    	clean.push(c);
    }
    clean.replace(" ","");

    println!("{0} {1}", p, clean);
}