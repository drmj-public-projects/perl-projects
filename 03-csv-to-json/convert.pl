#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;
use JSON;

# Files
my $csv_file  = 'data.csv';
my $json_file = 'output.json';

# CSV parser
my $csv = Text::CSV->new({
    binary => 1,
    auto_diag => 1
});

# Open CSV file
open(my $fh, "<", $csv_file)
    or die "Could not open $csv_file: $!";

# Read headers
my $headers = $csv->getline($fh);

# Store all rows
my @data;

# Process CSV rows
while (my $row = $csv->getline($fh)) {

    # Skip rows with missing columns
    if (@$row != @$headers) {
        warn "Invalid row found.\n";
        next;
    }

    # Convert row into hash
    my %record;
    @record{@$headers} = @$row;

    push @data, \%record;
}

close($fh);

# Convert data to JSON format
my $json_text = to_json(\@data, { pretty => 1 });

# Save JSON file
open(my $out, ">", $json_file)
    or die "Could not create $json_file: $!";

print $out $json_text;

close($out);

# Done message
print "Conversion completed: $json_file\n";