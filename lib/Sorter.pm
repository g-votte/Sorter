use strict;
use warnings;

package Sorter;

#コンストラクタ
sub new {
 my $class = shift();

 my $self = {
  values => []
 };

 return bless $self, $class;
}

#set_values(values) 数列valuesをソート器に格納する
sub set_values {
 my $self = shift();

 $self->{values} = [];

 foreach my $value (@_) {
  push @{$self->{values}}, $value;
 }
}

#get_values(values) 格納された数列を返す
sub get_values {
 my $self = shift();

 return @{$self->{values}};
}

#sort() 格納された数列をソートする
sub sort {
 #quick_sort(values) 数列valuesをクイックソート
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
