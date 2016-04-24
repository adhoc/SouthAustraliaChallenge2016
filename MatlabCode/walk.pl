#!/usr/bin/perl -w
use JSON;
use Data::Dumper qw(Dumper);

my @files = ("orbit-00002969-line-00000005-frame-00000000","orbit-00002969-line-00000005-frame-00000019","orbit-00002969-line-00000005-frame-00000038","orbit-00002969-line-00000005-frame-00000057","orbit-00002969-line-00000005-frame-00000001","orbit-00002969-line-00000005-frame-00000020","orbit-00002969-line-00000005-frame-00000039","orbit-00002969-line-00000005-frame-00000058","orbit-00002969-line-00000005-frame-00000002","orbit-00002969-line-00000005-frame-00000021","orbit-00002969-line-00000005-frame-00000040","orbit-00002969-line-00000005-frame-00000059","orbit-00002969-line-00000005-frame-00000003","orbit-00002969-line-00000005-frame-00000022","orbit-00002969-line-00000005-frame-00000041","orbit-00002969-line-00000005-frame-00000060","orbit-00002969-line-00000005-frame-00000004","orbit-00002969-line-00000005-frame-00000023","orbit-00002969-line-00000005-frame-00000042","orbit-00002969-line-00000005-frame-00000061","orbit-00002969-line-00000005-frame-00000005","orbit-00002969-line-00000005-frame-00000024","orbit-00002969-line-00000005-frame-00000043","orbit-00002969-line-00000005-frame-00000062","orbit-00002969-line-00000005-frame-00000006","orbit-00002969-line-00000005-frame-00000025","orbit-00002969-line-00000005-frame-00000044","orbit-00002969-line-00000005-frame-00000063","orbit-00002969-line-00000005-frame-00000007","orbit-00002969-line-00000005-frame-00000026","orbit-00002969-line-00000005-frame-00000045","orbit-00002969-line-00000005-frame-00000064","orbit-00002969-line-00000005-frame-00000008","orbit-00002969-line-00000005-frame-00000027","orbit-00002969-line-00000005-frame-00000046","orbit-00002969-line-00000005-frame-00000065","orbit-00002969-line-00000005-frame-00000009","orbit-00002969-line-00000005-frame-00000028","orbit-00002969-line-00000005-frame-00000047","orbit-00002969-line-00000005-frame-00000066","orbit-00002969-line-00000005-frame-00000010","orbit-00002969-line-00000005-frame-00000029","orbit-00002969-line-00000005-frame-00000048","orbit-00002969-line-00000005-frame-00000067","orbit-00002969-line-00000005-frame-00000011","orbit-00002969-line-00000005-frame-00000030","orbit-00002969-line-00000005-frame-00000049","orbit-00002969-line-00000005-frame-00000068","orbit-00002969-line-00000005-frame-00000012","orbit-00002969-line-00000005-frame-00000031","orbit-00002969-line-00000005-frame-00000050","orbit-00002969-line-00000005-frame-00000069","orbit-00002969-line-00000005-frame-00000013","orbit-00002969-line-00000005-frame-00000032","orbit-00002969-line-00000005-frame-00000051","orbit-00002969-line-00000005-frame-00000070","orbit-00002969-line-00000005-frame-00000014","orbit-00002969-line-00000005-frame-00000033","orbit-00002969-line-00000005-frame-00000052","orbit-00002969-line-00000005-frame-00000071","orbit-00002969-line-00000005-frame-00000015","orbit-00002969-line-00000005-frame-00000034","orbit-00002969-line-00000005-frame-00000053","orbit-00002969-line-00000005-frame-00000072","orbit-00002969-line-00000005-frame-00000016","orbit-00002969-line-00000005-frame-00000035","orbit-00002969-line-00000005-frame-00000054","orbit-00002969-line-00000005-frame-00000073","orbit-00002969-line-00000005-frame-00000017","orbit-00002969-line-00000005-frame-00000036","orbit-00002969-line-00000005-frame-00000055","orbit-00002969-line-00000005-frame-00000074","orbit-00002969-line-00000005-frame-00000018","orbit-00002969-line-00000005-frame-00000037","orbit-00002969-line-00000005-frame-00000056","orbit-00002969-line-00000005-frame-00000075");
#my @files = ("orbit-00002969-line-00000005-frame-00000000");

my %frames;

my $framesref = %frames;

for my $file (@files) {
  open( my $fh, '<', $file );
  my $json_text   = <$fh>;
  my $frame = JSON->new->utf8->decode($json_text);
  my $f = $frame->{'frame'};
  %frames->{$f} = $frame;
}
# print Dumper(%frames);

my @fs;

for (values %frames) {
  my $a = $_;
  #print "". $_->{'frame'} . "\n";
  @fs[$a->{'frame'}]= $a;
}

for my $f (@fs) {
  #print "frame: ". $f->{'frame'} . "\n";

  #print "latitude  = ". $f->{'latitude'} ."\n";
  #print "longitude = ". $f->{'longitude'} ."\n";

  #print Dumper ($f->{'iono'});

  for (values $f->{'iono'}) {
    if ($_ > 128) {
      print "#";
    } elsif ($_ > 64) {
      print "@";
    } elsif ($_ > 32) {
      print "!";
    } elsif ($_ > 24) {
      print "+";
    } elsif ($_ > 16) {
      print "_";
    } elsif ($_ > 8) {
      print ".";
    } else {
      print " ";
    }
  }
  print "\n";
}
