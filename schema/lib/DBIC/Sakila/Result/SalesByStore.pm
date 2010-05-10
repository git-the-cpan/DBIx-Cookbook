package Sakila::Result::SalesByStore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Sakila::Result::SalesByStore

=cut

__PACKAGE__->table("sales_by_store");

=head1 ACCESSORS

=head2 store

  data_type: VARCHAR
  default_value: (empty string)
  is_nullable: 0
  size: 101

=head2 manager

  data_type: VARCHAR
  default_value: (empty string)
  is_nullable: 0
  size: 91

=head2 total_sales

  data_type: DECIMAL
  default_value: undef
  is_nullable: 1
  size: 27

=cut

__PACKAGE__->add_columns(
  "store",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 101 },
  "manager",
  { data_type => "VARCHAR", default_value => "", is_nullable => 0, size => 91 },
  "total_sales",
  {
    data_type => "DECIMAL",
    default_value => undef,
    is_nullable => 1,
    size => 27,
  },
);


# Created by DBIx::Class::Schema::Loader v0.05003 @ 2010-03-24 15:09:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qjk1X2mLds8AcMqRV3niSA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
