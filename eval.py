#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  is_cm.py
#  
#  Copyright 2020 Renato Reis Leme <renato@logos>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

import itertools, os

T = [[]]
X = []

def complement (s) : 
	global X
	return set(X).difference(s)

# input  :: set s
# output :: interior set of s
def Int(s):
	global T
	interior = []
	for x in T:
		if set(x).issubset(set(s)):
			interior = set(interior).union(set(x))
	return set(interior)
	
def is_cm (r_factor):
	
	global T
	global X 
	
	rows, columns = os.popen('stty size', 'r').read().split()
	
	T = [[],[1],[1,3],[1,4],[1,2,3],[1,3,4],[1,2,3,4]]
	X = set(T[len(T)-1])
	o_pairs = list(itertools.product(T, repeat = r_factor))
	cm = 0
	str1 = "CM: "
	str2 = " V: "
	
	for o in o_pairs:
		valid = 1
		for i in o:
			if (i == [] or i == list(X)):
				valid = 0
		if ( Int ( complement ( Int ( complement ( Int ( complement ( o[0] ) ) ).union ( Int ( o[1] ).union ( Int ( o[2] ) ) ) ) ).union ( Int ( Int ( complement ( Int ( complement ( o[0] ) ) ).union ( o[1] ) ) ).union ( Int ( Int ( complement ( Int ( complement ( o[0] ) ) ).union ( o[2] ) ) ) ) ) ) != X and valid ):
			print (str1),
			print str(T),
			print (str2).rjust(int(columns) - len(str(T)) - len(str1) - len(str2) - len(str(o))),
			print str(o)
			break

def main(args):
		
	is_cm(int(args[1]))
	
	return
	
if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
