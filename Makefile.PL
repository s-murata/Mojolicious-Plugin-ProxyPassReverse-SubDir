use inc::Module::Install;
name 'Mojolicious-Plugin-ProxyPassReverse-SubDir';
all_from 'lib/Mojolicious/Plugin/ProxyPassReverse/SubDir.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
