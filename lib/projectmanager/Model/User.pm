package projectmanager::Model::User;

use Mojo::Base -base;
use Mojo::SQLite;

use projectmanager::Model::DB;

has 'db' => sub { projectmanager::Model::DB->new->sqlite->db };

sub create_user {
    my ($self, $nome, $idade) = @_;

    $self->db->insert('usuarios', { nome => $nome, idade => $idade });


    return 1; 
}
sub get_all_users {
    my $self = shift;

    my $users = $self->db->select('usuarios')->hashes->to_array;

    return $users;
}

1;
