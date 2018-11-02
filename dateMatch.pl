#!/usr/bin/perl
use strict;
use warnings;

sub elementOf {
  my $elementOf;
  my ($pattern, $element) = @_;

  if ( $pattern =~ m/[^0-9\*\,]/ )
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
  #my $pattern = " 0  0  *  * *    *";
  #my $date =    "00 00 07 10 7 2018";
  my ($pattern, $date) = @_;
  
  my @patternA = split ' ', $pattern;
  my @dateA = split ' ', $date;

  if (!(((scalar @patternA) == 6) & ((scalar @dateA) == 6)))
  {
    print "Bad input!\n";
    print "Usage: dateMatch pattern date\n";
    return $main;
  }
  
  my $flag = 1;
  my $element;
  for (my $i=0; $i < 6; $i++) {
    $element = elementOf($patternA[$i], $dateA[$i]);
    $flag = $flag & $element;
  }
  $main = $flag;
  return $main;
}

exit main($ARGV[0], $ARGV[1]);
