package Test::Work;
use Data::Dumper;
use base qw(Test::Class);
use lib 'lib';
use Test::More;
use Test::Exception;
use MockManager;
use Test::Mojo;

sub before : Test(setup) {
};

sub Eventum_rand : Test(1) {
  my $self = shift;
  my $t = Test::Mojo->new('Eventum');
  my $rand = Eventum->rand;
  ok($rand > -1 and $rand < 2);
}

sub Eventum_rand_d6 : Test(1) {
  my $self = shift;
  my $t = Test::Mojo->new('Eventum');
  my $rand = Eventum->rand('d6');
  ok($rand > 0 and $rand < 7);
}

1;
__PACKAGE__->new->runtests
