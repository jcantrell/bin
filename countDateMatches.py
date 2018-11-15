#!/usr/bin/python

import datetime
import sys
import re

def elementOf( pattern, string ):
  if ( re.compile("[^0-9\*\,]").match(pattern) ):
    print "Invalid character found in pattern!\n";
    return False;
  if ( pattern == "*" ):
    return True
  return int(pattern) == int(string);

def dateMatch( pattern, date ):
  flag = True;
  for i in range(0,len(pattern.split(" "))):
    flag = flag and elementOf( pattern.split(" ")[i], date.split(" ")[i] );
  return flag;
    
def countDateMatches( pattern, start, end ):
  count = 0;
  for i in range(start, end+1, 60):
    if ( dateMatch( pattern, datetime.datetime.fromtimestamp(i).strftime("%M %H %d %m %w %Y") ) ):
      count += 1;
  return count;

count = countDateMatches( sys.argv[1], int(sys.argv[2]), int(sys.argv[3]) );
print count;
