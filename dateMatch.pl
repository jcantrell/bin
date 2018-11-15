#!/usr/bin/perl
use DateTime;
use strict;
use warnings;

sub elementOf {
  my $elementOf;
  my ($pattern, $element) = @_;

  if ( $pattern =~ m/[^0-9\*\,]/ )
  {
    print "Invalid character found in pattern!\n";
    return 0;
  } elsif ($pattern eq '*') {
    return 1;
  } else {
    return ($element eq $pattern);
  }
}

sub dateMatch {
  my ($pattern, $date) = @_;
  my @patternA = split ' ', $pattern;
  my @dateA = split ' ', $date;

  my $flag = 1;
  for (my $i=0; $i < 6; $i++) {
    $flag = $flag & elementOf($patternA[$i], $dateA[$i]);
  }

  return $flag;
}

sub countDateMatches {
  my ($pattern, $start, $end) = @_;
  my $count = 0;
  for (my $i=$start; $i <= $end; $i += 60) {
    my $dt = DateTime->from_epoch( time_zone => 'America/Los_Angeles', epoch => $i );
    print "$i: ";
    my $is = "" . $dt->minute;
    $is .= " " . $dt->hour;
    $is .= " " . $dt->day;
    $is .= " " . $dt->month;
    $is .= " " . $dt->day_of_week;
    $is .= " " . $dt->year;
    if ( dateMatch( $pattern, $is) ) {
      print $is;
      print "\n";
      $count = $count + 1;
    }
  }
  print "start: $start, end: $end\n";
  return $count;
}

sub main {
  my ($pattern, $start, $end) = @_;
  
  my @patternA = split ' ', $pattern;

  if ( (scalar @patternA) != 6 )
  {
    print "Bad input!\n";
    print "Usage: dateMatch pattern date [offset]\n";
    return 1; 
  }
  
  return dateMatch( $pattern, $start, $end );
}

if ($#ARGV+1 == 2)
{
    print main($ARGV[0], $ARGV[1], $ARGV[1]);
    print "\n";
    exit 0;
}
elsif ($#ARGV+1 == 3)
{
    print countDateMatches( $ARGV[0], $ARGV[1], $ARGV[2] );
    print "\n";
    exit 0;
} 
else
{
  print main(0,0,0);
  exit 1;
}
