package Koha::Schema::Result::BorrowerAttributeType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Koha::Schema::Result::BorrowerAttributeType

=cut

__PACKAGE__->table("borrower_attribute_types");

=head1 ACCESSORS

=head2 code

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 repeatable

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 unique_id

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 opac_display

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 password_allowed

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 staff_searchable

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 authorised_value_category

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 display_checkout

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 category_code

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 1
  size: 10

=head2 class

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "repeatable",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "unique_id",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "opac_display",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "password_allowed",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "staff_searchable",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "authorised_value_category",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "display_checkout",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "category_code",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 1, size => 10 },
  "class",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("code");

=head1 RELATIONS

=head2 category_code

Type: belongs_to

Related object: L<Koha::Schema::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category_code",
  "Koha::Schema::Result::Category",
  { categorycode => "category_code" },
  { join_type => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 borrower_attributes

Type: has_many

Related object: L<Koha::Schema::Result::BorrowerAttribute>

=cut

__PACKAGE__->has_many(
  "borrower_attributes",
  "Koha::Schema::Result::BorrowerAttribute",
  { "foreign.code" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2012-09-02 08:44:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EpdavGdH3uR/eaNLJIoHCg


# You can replace this text with custom content, and it will be preserved on regeneration
1;