class php54 {
  case $operatingsystem {
    debian: {
      notify { 'This is a Debian system':}
      apt::source {'php54_dotdeb':
      	ensure      => present,
        location    => "http://packages.dotdeb.org/",
        release     => "squeeze-php54",
        repos       => "all",
        include_src => false,
        key         => '3D624A3B',
        key_source  => "http://www.dotdeb.org/dotdeb.gpg"
      }
    }
    ubuntu: {
      notify {'This is an Ubuntu system':}
      apt::ppa { "ppa:ondrej/php5": }
    }

    default: { fail("Unrecognized operating system for webserver")}
  }

  package { ["php5"] :
    ensure  => latest,
    require => [Apt::Source['php54_dotdeb']],
  }
}