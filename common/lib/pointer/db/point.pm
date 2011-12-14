
package pointer::db::point;

use strict;
use warnings 'all';
use base 'pointer::db::model';

__PACKAGE__->set_up_table('points');

__PACKAGE__->belongs_to(
	user =>
		'pointer::db::user' =>
			'user_id'
);


1;# return true:

