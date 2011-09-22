use strict;
use warnings;

package Sorter;

sub new {
 my $class = shift();

 my $self = {
  values => []
 };

 return bless $self, $class;
}

sub set_values {
 my $self = shift();

 $self->{values} = [];

 foreach my $value (@_) {
  push @{$self->{values}}, $value;
 }
}

sub get_values {
 my $self = shift();

 return @{$self->{values}};
}

sub sort {
 sub quick_sort {
  my @values = @{shift()};

  if(@values<=0){
   return @values;
  }

  my $pivot = $values[0];
  my @firsthalf;
  my @secondhalf;

  foreach (@values[1..$#values]) {
   if ($_<=$pivot) {
    push @firsthalf, $_;
   }else{
    push @secondhalf, $_;
   }
  }

  @firsthalf = quick_sort(\@firsthalf);
  @secondhalf = quick_sort(\@secondhalf);

  push(@firsthalf, $pivot);
  push(@firsthalf, @secondhalf);

  return @firsthalf;
 }

 my $self = shift;
 @{$self->{values}} = quick_sort(\@{$self->{values}});
}

1;
