class apache {
  package { "apache2":
    ensure => present,
    require => Exec['apt_update'],
  }

  file { "/etc/apache2/sites-available/default":
    notify  => Service["apache2"],
    ensure  => file,
    owner   => root,
    group   => root,
    source  => "puppet:///modules/apache/default.vhost",
    require => Package["apache2"],
  }

  service { "apache2":
    ensure  => running,
    require => [Package["apache2"], File["/etc/apache2/sites-available/default"]],
  }
}