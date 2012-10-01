class metrolyrics::phpconfig {
  require php54
  file_line { 'php54_error_reporting':
    path => "/etc/php5/apache2/php.ini",
    line => "error_reporting = E_ALL & ~E_DEPRECATED & ~E_USER_DEPRECATED & ~E_NOTICE",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_memory_limit':
    path => "/etc/php5/apache2/php.ini",
    line => "memory_limit = 196M",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_post_max_size':
    path => "/etc/php5/apache2/php.ini",
    line => "post_max_size = 500M",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_upload_max_size':
    path => "/etc/php5/apache2/php.ini",
    line => "upload_max_filesize = 500M",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_socket_timeout':
    path => "/etc/php5/apache2/php.ini",
    line => "default_socket_timeout = 600",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_max_execution':
    path => "/etc/php5/apache2/php.ini",
    line => "max_execution_time = 300",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_display_errors':
    path => "/etc/php5/apache2/php.ini",
    line => "display_errors = on",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_display_startup_errors':
    path => "/etc/php5/apache2/php.ini",
    line => "display_startup_errors = on",
    notify  => Service["apache2"],  # this sets up the relationship
  }
  file_line { 'php54_timezone':
    path => "/etc/php5/apache2/php.ini",
    line => "date.timezone = 'America/Vancouver'",
    notify  => Service["apache2"],  # this sets up the relationship
  }
}