#!/usr/bin/perl
use warnings;
use strict;
opendir (DIR,".");
my @files = readdir (DIR);
closedir (DIR);
my @xbmfiles = grep /.xbm$/, @files;
print "@xbmfiles\n";
foreach my $file (@xbmfiles) {
    my $outputfile = $file;
    #$outputfile =~ s/.xbm/.png/ or die "Bad file name '$file'";
    system ("xbmtopbm ./$outputfile");
}
