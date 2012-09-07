class apache {
  package { "apache2":
    ensure => latest,
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

  file {"/etc/apache2/mods-enabled/headers.load" :
    ensure => 'link',
    source => "/etc/apache2/mods-available/headers.load",
    notify => Service['apache2'],
    require => Package["apache2"],
  }

  file {"/etc/apache2/mods-enabled/rewrite.load" :
    ensure => 'link',
    source => "/etc/apache2/mods-available/rewrite.load",
    notify => Service['apache2'],
    require => Package["apache2"],
  }

  file {"/etc/apache2/mods-enabled/cache.load" :
    ensure => 'link',
    source => "/etc/apache2/mods-available/cache.load",
    notify => Service['apache2'],
    require => Package["apache2"],
  }

  service { "apache2":
    ensure  => running,
    require => [Package["apache2"], File["/etc/apache2/sites-available/default"]],
  }
}