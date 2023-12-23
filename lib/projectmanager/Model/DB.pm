package projectmanager::Model::DB;

use Mojo::Base -base;
use Mojo::SQLite;

has 'sqlite' => sub { Mojo::SQLite->new('sqlite:./database.sqlite') };

1;
