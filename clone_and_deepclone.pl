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

__END__
Benchmark: timing 100000 iterations of nest_1_clone, nest_1_dclone...
nest_1_clone: 1.40845 wallclock secs ( 1.41 usr +  0.00 sys =  1.41 CPU) @ 70921.99/s (n=100000)
nest_1_dclone: 2.62968 wallclock secs ( 2.62 usr +  0.00 sys =  2.62 CPU) @ 38167.94/s (n=100000)
                 Rate nest_1_dclone  nest_1_clone
nest_1_dclone 38168/s            --          -46%
nest_1_clone  70922/s           86%            --

Benchmark: timing 100000 iterations of nest_2_clone, nest_2_dclone...
nest_2_clone: 2.49977 wallclock secs ( 2.50 usr +  0.00 sys =  2.50 CPU) @ 40000.00/s (n=100000)
nest_2_dclone: 3.47202 wallclock secs ( 3.47 usr +  0.00 sys =  3.47 CPU) @ 28818.44/s (n=100000)
                 Rate nest_2_dclone  nest_2_clone
nest_2_dclone 28818/s            --          -28%
nest_2_clone  40000/s           39%            --

Benchmark: timing 100000 iterations of nest_3_clone, nest_3_dclone...
nest_3_clone: 3.45251 wallclock secs ( 3.45 usr +  0.00 sys =  3.45 CPU) @ 28985.51/s (n=100000)
nest_3_dclone: 4.39019 wallclock secs ( 4.38 usr +  0.00 sys =  4.38 CPU) @ 22831.05/s (n=100000)
                 Rate nest_3_dclone  nest_3_clone
nest_3_dclone 22831/s            --          -21%
nest_3_clone  28986/s           27%            --

Benchmark: timing 100000 iterations of nest_4_clone, nest_4_dclone...
nest_4_clone: 4.56922 wallclock secs ( 4.56 usr +  0.00 sys =  4.56 CPU) @ 21929.82/s (n=100000)
nest_4_dclone: 5.1285 wallclock secs ( 5.11 usr +  0.01 sys =  5.12 CPU) @ 19531.25/s (n=100000)
                 Rate nest_4_dclone  nest_4_clone
nest_4_dclone 19531/s            --          -11%
nest_4_clone  21930/s           12%            --

Benchmark: timing 100000 iterations of nest_5_clone, nest_5_dclone...
nest_5_clone: 5.5243 wallclock secs ( 5.52 usr +  0.00 sys =  5.52 CPU) @ 18115.94/s (n=100000)
nest_5_dclone: 5.89666 wallclock secs ( 5.89 usr +  0.00 sys =  5.89 CPU) @ 16977.93/s (n=100000)
                 Rate nest_5_dclone  nest_5_clone
nest_5_dclone 16978/s            --           -6%
nest_5_clone  18116/s            7%            --

Benchmark: timing 100000 iterations of nest_6_clone, nest_6_dclone...
nest_6_clone: 6.47901 wallclock secs ( 6.47 usr +  0.00 sys =  6.47 CPU) @ 15455.95/s (n=100000)
nest_6_dclone: 6.69936 wallclock secs ( 6.66 usr +  0.01 sys =  6.67 CPU) @ 14992.50/s (n=100000)
                 Rate nest_6_dclone  nest_6_clone
nest_6_dclone 14993/s            --           -3%
nest_6_clone  15456/s            3%            --

Benchmark: timing 100000 iterations of nest_7_clone, nest_7_dclone...
nest_7_clone: 7.40539 wallclock secs ( 7.40 usr +  0.00 sys =  7.40 CPU) @ 13513.51/s (n=100000)
nest_7_dclone: 7.18958 wallclock secs ( 7.18 usr +  0.00 sys =  7.18 CPU) @ 13927.58/s (n=100000)
                 Rate  nest_7_clone nest_7_dclone
nest_7_clone  13514/s            --           -3%
nest_7_dclone 13928/s            3%            --

7重構造で逆転した
