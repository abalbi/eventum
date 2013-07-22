package Eventum;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

sub rand {
  my $self = shift;
  my $codigo = shift;
  my $valor;
  if($codigo =~ /d6/) {
    $valor = int rand(6) + 1;
  } else {
    $valor = int rand(2);
  }
  return $valor;
}

1;
