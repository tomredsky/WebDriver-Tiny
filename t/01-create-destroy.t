use lib 't';
use t   '2';

my $drv = WebDriver::Tiny->new( port => 1 );

args_are [
    POST => 'http://localhost:1/session',
    { content => '{"desiredCapabilities":{}}' },
], 'Session is created at construction time';

undef $drv;

args_are [ DELETE => 'http://localhost:1/session/:sid' ],
    'Session is removed at destruction time';
