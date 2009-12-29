#!perl -T

use strict;
use warnings;
use Test::More tests => 7;

BEGIN {
    use_ok( 'Win32::WMIC' );
}

my $wmic = Win32::WMIC->new;

ok (length($wmic->query('useraccount list brief')) > 0,
    "query $wmic->{query} successful");
ok (length($wmic->{query}) > 0,
    "query variable set");
ok (length($wmic->{data}) > 0,
    "data variable set");
ok (length($wmic->data) > 0,
    "data function successful");

$wmic = undef;
$wmic = Win32::WMIC->new;

eval { $wmic->data };
ok ($@ =~ "No resultset exists",
    "No resultset failure");
eval { $wmic->query };
ok ($@ =~ "No query specified",
    "No query failure");

