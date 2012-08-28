class apache {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  package { "apache2":
    ensure => present,
  }

  file { "/etc/apache2/sites-available/default":
  	notify  => Service["apache2"],
    ensure => file,
	owner => root,
	group => root,
    source => "puppet:///modules/apache/default.vhost",
  }

  service { "apache2":
    ensure => running,
    require => [Package["apache2"], File["/etc/apache2/sites-available/default"]],
  }
}