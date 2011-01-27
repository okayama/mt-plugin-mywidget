package MT::Plugin::MyWidget;
use strict;
use MT;
use MT::Plugin;
use base qw( MT::Plugin );
@MT::Plugin::MyWidget::ISA = qw( MT::Plugin );

our $PLUGIN_NAME = 'MyWidget';
our $VERSION = '1.0';

my $plugin = new MT::Plugin::MyWidget( {
    id   => $PLUGIN_NAME,
    name => $PLUGIN_NAME,
    key  => lc $PLUGIN_NAME,
    author_name => 'Alfasado Inc.',
    author_link => 'http://alfasado.net/',
    description => '<__trans phrase="Manage MyWidget.">',
    version => $VERSION,
    l10n_class => 'MT::' . $PLUGIN_NAME . '::L10N',
} );

MT->add_plugin( $plugin );

sub init_registry {
    my $plugin = shift;
    $plugin->registry( {
        widgets => {
            blog_tree => {
                label    => 'MyWidget',
                plugin   => $plugin,
                template => 'tmpl/cms/widget/mywidget.tmpl',
                singular => 1,
                set      => 'main',
                condition => sub {
                    my ( $page, $scope ) = @_;
                    return $page eq 'dashboard';
                },
                code => \&_widget_mywidget,
            },
        },
   } );
}

sub _widget_mywidget {
    my ( $app, $tmpl, $param ) = @_;
    # hoge
}


1;
