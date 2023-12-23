package projectmanager::Controller::UserController;

use Mojo::Base 'Mojolicious::Controller';
use projectmanager::Model::User;

sub create_user {
    my $self = shift;

    my $json_data = $self->req->json;

    my $nome  = $json_data->{nome};
    my $idade = $json_data->{idade};

    my $user_model = MyApp::Model::User->new;
    my $success = $user_model->create_user($nome, $idade);

    if ($success) {
        $self->render(json => { status => 'success', message => 'Usuário criado com sucesso!' });
    } else {
        $self->render(json => { status => 'error', message => 'Erro ao criar o usuário.' });
    }
}

sub list_users {
    my $self = shift;

    my $user_model = MyApp::Model::User->new;

    my $users = $user_model->get_all_users;

    $self->render(json => $users);
}

1;





# package projectmanager::Controller::User;
# use Mojo::Base 'Mojolicious::Controller';
# use Mojolicious::Lite -signatures;
# use Mojo::SQLite;

# state $sqlite = Mojo::SQLite->new('sqlite:./database.sqlite');


# $sqlite->db->query('
#     CREATE TABLE IF NOT EXISTS usuarios (
#         id INTEGER PRIMARY KEY AUTOINCREMENT,
#         nome TEXT NOT NULL,
#         idade INTEGER
#     )
# ');

# # Inserir dados de exemplo
# $sqlite->db->query('
#     INSERT INTO usuarios (nome, idade) VALUES (?, ?)
# ', 'Joao Pedro', 24);


# sub get_instance {
#     my $self = shift;
#     return $self;
# }

# sub list ($c) {
#  my $result_set = $sqlite->db->select('usuarios', ['nome', 'idade']);
#     my @usuarios   = $result_set->hashes->each;

#     $c->render(json => \@usuarios);
# }

# 1;
