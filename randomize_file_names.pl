#!/usr/bin/env perl
use strict;
use warnings;
use File::Copy;

use feature ':5.14';

use constant DIR     => '/Users/cdeshotel/Scripts/randomize_file_names/files';
use constant NEW_DIR => '/Users/cdeshotel/Scripts/randomize_file_names/new_files';
use constant NUM     => '500';

opendir( my $dh, DIR ) || die "can't open dir $!";
while (readdir $dh) {
	my $new_name = int( rand(NUM) );
	next if $_ =~ /^\./;
	$_ =~ /.*\.(\w+)/;
	my $ext = $1;
	say "$_\t->\t$new_name.$ext";
	copy( DIR . "/$_", NEW_DIR . "/$new_name.$ext" );
}

=head1 NAME

	randomize_file_names.pl - the great file name mixer-upper

=head1 SYNOPSIS

	I needed a way to randomize the order of a set of images
	for a friend's anemic photo slideshow software.

	Files were batch added to the slideshow based on name,
	so randomizing the file names would effectively randomize
	the slideshow

	Everything in DIR will be given a random number name (from
	1 to NUM) and moved to NEW_DIR.

=head1 LIMITATIONS

	If the random integer occurs twice in the set, a file will
	be overwritten. This could be solved by loading the random
	numbers into an array and popping the names. We could even
	take the number of files in the directory and set NUM to
	that. But alas, that was beyond the scope of the project.
