class metrolyrics {
  file {
    "/usr/share/php/ml_environment.php" :
      ensure => present,
      source => "puppet:///modules/metrolyrics/ml_environment.php",
      require => Class['php54'],
  }
}