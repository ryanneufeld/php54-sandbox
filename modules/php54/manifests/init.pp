class php54 {
  include php54::source

  package {[
  	  "php5",
      "php5-cli",
  	  "php5-mysqlnd",
      "php5-memcache",
      "php5-memcached",
  	  "php5-mcrypt",
      "php5-xmlrpc",
      "php5-curl",
  	  "php5-gd",
  	  "libphp-phpmailer",
  	  "php-gettext",
  	  "git"
  	] :
    ensure  => latest,
    require => [Class['php54::source']],
    notify  => Service["apache2"],  # this sets up the relationship
  }
}

