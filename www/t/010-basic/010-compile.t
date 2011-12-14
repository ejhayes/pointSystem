#!/usr/bin/perl -w

use strict;
use warnings 'all';
use Test::More 'no_plan';
use ASP4::API;
use pointer::db::point;
use JSON;

my $api = ASP4::API->new;

use_ok('pointer::db::model');
use_ok('pointer::db::point');
use_ok('pointer::db::user');

my $res = $api->ua->post("/v1.0/add/", {
	user => 'eric',
	reason => 'made this test',
	points => '7'
});

ok $res->is_success, "POST was successful";

# verify our return result
my $ret = decode_json $res->content;
diag explain $ret;
is $ret->{success}, 1, "call was successful";

# verify db information
my $point = pointer::db::point->retrieve($ret->{id});

ok defined($point), "point was found in the db";

is $point->user->name, "Eric", "username correct";
is $point->reason, "made this test", "reason is correct";
is $point->points, 7, "points added is correct";

# remove from testing
my $user = $point->user;
$point->delete;
$user->delete;

# More tests can go here or in other files.

