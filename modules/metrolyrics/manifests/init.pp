class metrolyrics {

  file {
      "/usr/share/php/ml_environment.php" :
      ensure => present,
      source => "puppet:///modules/metrolyrics/ml_environment.php",
      require => [Class['php54'],Class['metrolyrics::phpconfig']]
  }

  apache::vhost { 'ryan.metrolyrics.com':
    ssl => false,
    options => 'All',
    override => 'All',
    docroot_owner      => '503',
    docroot_group      => '503',
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
  include metrolyrics::phpconfig

  Class["php54"] -> Class["Apache::Mod::Php"] -> Class["metrolyrics::phpconfig"]


  # apache::vhost { 'm.ryan.metrolyrics.com':
  #   ssl => false,
  #   options => 'All +MultiViews +ExecCGI -Indexes',
  #   override => 'All',
  #   priority           => '01',
  #   vhost_name         => '*',
  #   docroot            => '/var/www/mobile/',
  #   configure_firewall => false,
  #   port               => '80',
  # }

  package{[
      "git",
      "nfs-kernel-server",
  ]:
    ensure  => latest,
  }
}
