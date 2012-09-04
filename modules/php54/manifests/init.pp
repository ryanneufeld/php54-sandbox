class php54 {
  include php54::source

  package {[
  	  "php5",
  	  "php5-mysqlnd",
  	  "php5-mcrypt",
  	  "php5-gd",
  	  "libphp-phpmailer",
  	  "php-gettext",
  	  "git"
  	] :
    ensure  => latest,
    require => [Class['php54::source']],
  }
}

