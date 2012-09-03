class php54::source {
  case $operatingsystem {
    debian: {
      apt::source {'php54_dotdeb':
        ensure      => present,
        location    => "http://packages.dotdeb.org/",
        release     => "${lsbdistcodename}-php54",
        repos       => "all",
        include_src => false,
        key         => "3D624A3B",
        key_source  => "http://www.dotdeb.org/dotdeb.gpg"
      }
    }
    ubuntu: {
      apt::ppa { "ppa:ondrej/php5": }
    }

    default: { fail("Unrecognized operating system for webserver")}
  }
}