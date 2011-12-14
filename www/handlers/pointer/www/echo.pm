
package pointer::www::echo;

use strict;
use warnings 'all';
use base 'ASP4::FormHandler';
use vars __PACKAGE__->VARS;
use Data::Dumper;

sub run
{
  my ($s, $context) = @_;
  
  $Response->Write("<h1>Form Contents:</h1><pre>" . Dumper($Form) . "</pre>");
}# end run()

1;# return true:

