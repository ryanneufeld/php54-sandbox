class devsite {
  apache::vhost { 'test.localdomain':
    ssl                => false,
    options            => 'All',
    override           => 'All',
    docroot_owner      => 'vagrant',
    docroot_group      => 'vagrant',
    priority           => '00',
    vhost_name         => '*',
    docroot            => '/var/www',
    configure_firewall => false,
    port               => '80',
  }

  apache::mod {"rewrite":}
  apache::mod {"headers":}
  apache::mod {"cache":}
  apache::mod {"expires":}
  apache::mod {"actions":}
  include apache::mod::php
  include devsite::phpconfig

  Class["php54"] ->
  Class["Apache::Mod::Php"] ->
  Class["devsite::phpconfig"]

}
