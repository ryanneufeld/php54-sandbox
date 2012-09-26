class metrolyrics {
  file {
      "/usr/share/php/ml_environment.php" :
      ensure => present,
      source => "puppet:///modules/metrolyrics/ml_environment.php",
      require => Class['php54'],
  }

  apache::vhost { 'ryan.metrolyrics.com':
    ssl => false,
    options => 'All +MultiViews +ExecCGI -Indexes',
    override => 'All',
    priority           => '00',
    vhost_name         => '*',
    docroot            => '/var/www/',
    configure_firewall => false,
    port               => '80',
  }

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