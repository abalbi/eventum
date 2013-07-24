use strict;
use Data::Dumper;
my $entorno = {};

&personaje_crear({_nombre => 'Ivana'});
&personaje_prop('Ivana','apariencia',5);

print Dumper $entorno;

sub personaje_crear {
  my $params = shift;
  die "El nombre es obligatorio para los personajes" if not $params->{_nombre};
  die "Nombre de personaje duplicado" if exists $entorno->{_personajes}->{$params->{_nombre}};
  $entorno->{_personajes}->{$params->{_nombre}} = $params;
}

sub personaje_prop {
  my $personaje_nombre = shift;
  my $prop_nombre = shift;
  my $valor = shift;
  if (defined $valor) {
    &personaje_traer($personaje_nombre)->{$prop_nombre} = $valor;
  }
  return &personaje_traer($personaje_nombre)->{$prop_nombre};
}

sub personaje_traer {
  my $personaje_nombre = shift;
  die "No existe el personaje '$personaje_nombre'" if not exists $entorno->{_personajes}->{$personaje_nombre};
  return $entorno->{_personajes}->{$personaje_nombre};
}
