
package pointer::db::user;

use strict;
use warnings 'all';
use base 'pointer::db::model';

__PACKAGE__->set_up_table('users');

__PACKAGE__->has_many(
  points  =>
    'pointer::db::point' =>
      'point_id'
);

1;# return true:

