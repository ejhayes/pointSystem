
package pointer::api::main;

use strict;
use warnings 'all';
use 5.010;
use JSON;
use base 'ASP4::FormHandler';
use vars __PACKAGE__->VARS;
use pointer::db::point;
use pointer::db::user;
use Data::Dumper;
use Test::More;

sub run
{
	my ($self, $context) = @_;
	
	given($Form->{method}) {
		when("add"){ addPoints(@_); }
		default { apiError("method does not exist: '$_'");  }
	}
  
}# end run()

sub addPoints
{
	my ($s, $context) = @_;

  my $point = eval {
		# verify correct arguments specified
		map { if(!exists($Form->{$_})) { die "invalid arguments"; } } qw(user points reason);
		
    pointer::db::point->do_transaction(sub{
      my $user    = pointer::db::user->find_or_create( name => ucfirst $Form->{user} );
      
      # Required params:
      my %params = (
				user_id					=> $user->id,
				reason					=> $Form->{reason},
				points			=> $Form->{points}
      );
      
      # Make the build:
      my $point = pointer::db::point->create( %params );
      
      # Finally:
      return $point;
    });
  };
  
  if( $@ )
  {
    apiError($@);
  }
  else
  {
  	$Response->Write( encode_json( {success => 1, id => $point->id } ) );
  }# end if()
}# end createBuild()


sub apiError 
{
	$Response->Write( encode_json( {success => 0, error => "[" . __PACKAGE__ . "] " . shift} ) );
} #end apiErrror

1;# return true: