package DBIx::Cookbook::DBIC::Command::subquery_correlated;
use Moose;
extends qw(MooseX::App::Cmd::Command);


sub execute {
  my ($self, $opt, $args) = @_;

=for SQL

SELECT
  *
FROM
  payment p_outer
WHERE 
  amount > (SELECT AVG(amount) FROM payment p_inner WHERE p_outer.customer_id=p_inner.customer_id)

=cut

    my $p_rs = $self->app->schema->resultset('Payment');

  my $rs = $p_rs->search
    ({
      amount => { '>' => $p_rs->search
		  (
		   { customer_id => { '=' => \'me.customer_id' } }, 
                   { alias => 'p_inner' }
                  )->get_column('amount')->func_rs('AVG')->as_query
                }
       });


  while (my $row = $rs->next) {
    use Data::Dumper;
    my %data = $row->get_columns;
    warn Dumper(\%data);
  }
}

1;
