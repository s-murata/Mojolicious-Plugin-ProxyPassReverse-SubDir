use strict;
use Test::More;
use Mojolicious::Lite;
use Test::Mojo;

plugin 'ProxyPassReverse::SubDir';

get '/*' => sub {
    my $c = shift;
  $c->render( text => $c->url_for('/') );
};

my $prefix = '/subdir';

my $t = Test::Mojo->new;
$t->get_ok($prefix)
    ->status_is(200)
    ->content_is('/');

$t->get_ok($prefix => { 'X-Forwarded-Host' => 'On' })
    ->status_is(200)
    ->content_is($prefix);

done_testing();
