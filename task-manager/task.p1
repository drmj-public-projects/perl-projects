#!/usr/bin/perl

use strict;
use warnings;

my $command = $ARGV[0];

if ($command eq "add") {

    my $task = $ARGV[1];

    open(my $fh, ">>", "tasks.txt")
        or die "Cannot open file";

    print $fh "0|$task\n";

    close($fh);

    print "Task added!\n";
} elsif ($command eq "list") {

    open(my $fh, "<", "tasks.txt")
        or die "Cannot open file";

    my $index = 1;

    while (my $line = <$fh>) {

        chomp($line);

        my ($status, $task) = split(/\|/, $line);

        if ($status == 0) {
            print "[$index] [ ] $task\n";
        } else {
            print "[$index] [X] $task\n";
        }

        $index++;
    }

    close($fh);
} elsif ($command eq "done") {

    my $task_number = $ARGV[1];

    if (!defined $task_number) {
        die "Usage: perl tareas.pl done <task_number>\n";
    }

    if ($task_number !~ /^\d+$/ || $task_number < 1) {
        die "Task number must be a positive integer\n";
    }

    open(my $fh, "<", "tasks.txt")
        or die "Cannot open tasks.txt for reading\n";

    my @tasks = <$fh>;

    close($fh);

    if ($task_number > scalar @tasks) {
        die "Task does not exist\n";
    }

    my $index = $task_number - 1;

    chomp($tasks[$index]);

    my ($status, $task) = split(/\|/, $tasks[$index], 2);

    $tasks[$index] = "1|$task\n";

    open(my $out, ">", "tasks.txt")
        or die "Cannot open tasks.txt for writing\n";

    print $out @tasks;

    close($out);

    print "Task marked as completed!\n";
} else {
    print "Unknown command\n";
}