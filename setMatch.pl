#!/usr/bin/perl
# This program takes a set description and a number,
# and determines if the number is in the set described.
# sets are described as in cron date columns; that is,
# [0-9] is the set of numbers 0 through 9, * is the set of all numbers,
# 5,7,8 is the set of numbers 5, 7, and 8
# sets can be unioned via ';' as well as ',', as in
# [0-13];*/5 is the set of numbers 0 through 13 as well as anything
# divisible by 5

use strict;
use warnings;
use DateTime;

sub elementOf {
  my $elementOf;
  my ($pattern, $element) = @_;

  if ( $pattern =~ m/[^0-9\*\,]/ ) # only supports '*' and ',' right now
  {
    print "Invalid character found in pattern!\n";
    $elementOf = 0;
    return $elementOf;
  }
  if ($pattern eq '*')
  {
    $elementOf = 1;
    return $elementOf;
  }
  {
    if ($element == $pattern)
    {
      $elementOf = 1;
    } else {
      $elementOf = 0;
    }
    return $elementOf;
  }
}

sub main {
  my $main = 0;
  #my $pattern = "*";
  #my $date =    "07";
  my ($pattern, $item) = @_;
  
  return elementOf($pattern, $item);
}

exit main($ARGV[0], $ARGV[1]);
