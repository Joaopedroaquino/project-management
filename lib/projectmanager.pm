package projectmanager;
use Mojolicious::Lite;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  app->routes->post('/user/create')->to(controller => 'user', action => 'create_user');

$r->get('/user/list')->to(controller => 'user', action => 'list_users');
# $r->post('/create_user')->to('user_controller#create_user');
# $r->get('/list_users')->to('user_controller#list_users');


}

1;
