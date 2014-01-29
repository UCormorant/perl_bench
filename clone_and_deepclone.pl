#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use autodie;

use Benchmark qw(:all :hireswallclock);

use Clone qw(clone);
use Storable qw(dclone);

# http://search.cpan.org/~garu/Clone/Clone.pm#SEE_ALSO
# ネストが3-4程度まではCloneが、それ以上深くなるとStrableが速くなるとのこと

my $nest_1 = {
    id =>  0, name => 'zero',
    id =>  1, name => 'one',
    id =>  2, name => 'two',
    id =>  3, name => 'three',
    id =>  4, name => 'four',
    id =>  5, name => 'five',
    id =>  6, name => 'six',
    id =>  7, name => 'seven',
    id =>  8, name => 'eight',
    id =>  9, name => 'nine',
};

my $nest_2 = {
    id => 10, name => 'zero',  child => $nest_1,
    id => 11, name => 'one',   child => $nest_1,
    id => 12, name => 'two',   child => $nest_1,
    id => 13, name => 'three', child => $nest_1,
    id => 14, name => 'four',  child => $nest_1,
    id => 15, name => 'five',  child => $nest_1,
    id => 16, name => 'six',   child => $nest_1,
    id => 17, name => 'seven', child => $nest_1,
    id => 18, name => 'eight', child => $nest_1,
    id => 19, name => 'nine',  child => $nest_1,
};

my $nest_3 = {
    id => 20, name => 'zero',  child => $nest_2,
    id => 21, name => 'one',   child => $nest_2,
    id => 22, name => 'two',   child => $nest_2,
    id => 23, name => 'three', child => $nest_2,
    id => 24, name => 'four',  child => $nest_2,
    id => 25, name => 'five',  child => $nest_2,
    id => 26, name => 'six',   child => $nest_2,
    id => 27, name => 'seven', child => $nest_2,
    id => 28, name => 'eight', child => $nest_2,
    id => 29, name => 'nine',  child => $nest_2,
};

my $nest_4 = {
    id => 30, name => 'zero',  child => $nest_3,
    id => 31, name => 'one',   child => $nest_3,
    id => 32, name => 'two',   child => $nest_3,
    id => 33, name => 'three', child => $nest_3,
    id => 34, name => 'four',  child => $nest_3,
    id => 35, name => 'five',  child => $nest_3,
    id => 36, name => 'six',   child => $nest_3,
    id => 37, name => 'seven', child => $nest_3,
    id => 38, name => 'eight', child => $nest_3,
    id => 39, name => 'nine',  child => $nest_3,
};

my $nest_5 = {
    id => 40, name => 'zero',  child => $nest_4,
    id => 41, name => 'one',   child => $nest_4,
    id => 42, name => 'two',   child => $nest_4,
    id => 43, name => 'three', child => $nest_4,
    id => 44, name => 'four',  child => $nest_4,
    id => 45, name => 'five',  child => $nest_4,
    id => 46, name => 'six',   child => $nest_4,
    id => 47, name => 'seven', child => $nest_4,
    id => 48, name => 'eight', child => $nest_4,
    id => 49, name => 'nine',  child => $nest_4,
};

my $nest_6 = {
    id => 50, name => 'zero',  child => $nest_5,
    id => 51, name => 'one',   child => $nest_5,
    id => 52, name => 'two',   child => $nest_5,
    id => 53, name => 'three', child => $nest_5,
    id => 54, name => 'four',  child => $nest_5,
    id => 55, name => 'five',  child => $nest_5,
    id => 56, name => 'six',   child => $nest_5,
    id => 57, name => 'seven', child => $nest_5,
    id => 58, name => 'eight', child => $nest_5,
    id => 59, name => 'nine',  child => $nest_5,
};

my $nest_7 = {
    id => 60, name => 'zero',  child => $nest_6,
    id => 61, name => 'one',   child => $nest_6,
    id => 62, name => 'two',   child => $nest_6,
    id => 63, name => 'three', child => $nest_6,
    id => 64, name => 'four',  child => $nest_6,
    id => 65, name => 'five',  child => $nest_6,
    id => 66, name => 'six',   child => $nest_6,
    id => 67, name => 'seven', child => $nest_6,
    id => 68, name => 'eight', child => $nest_6,
    id => 69, name => 'nine',  child => $nest_6,
};

cmpthese(100000 => +{
    nest_1_clone  => sub { my $copy =  clone $nest_1 },
    nest_1_dclone => sub { my $copy = dclone $nest_1 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_2_clone  => sub { my $copy =  clone $nest_2 },
    nest_2_dclone => sub { my $copy = dclone $nest_2 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_3_clone  => sub { my $copy =  clone $nest_3 },
    nest_3_dclone => sub { my $copy = dclone $nest_3 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_4_clone  => sub { my $copy =  clone $nest_4 },
    nest_4_dclone => sub { my $copy = dclone $nest_4 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_5_clone  => sub { my $copy =  clone $nest_5 },
    nest_5_dclone => sub { my $copy = dclone $nest_5 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_6_clone  => sub { my $copy =  clone $nest_6 },
    nest_6_dclone => sub { my $copy = dclone $nest_6 },
}, 'auto');

print "\n";
cmpthese(100000 => +{
    nest_7_clone  => sub { my $copy =  clone $nest_7 },
    nest_7_dclone => sub { my $copy = dclone $nest_7 },
}, 'auto');

exit;
