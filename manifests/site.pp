group { "puppet":
	ensure => present,
}
class { 'apt':
	disable_keys      => false,
}

class { 'apache': }
class { 'php54' : }
class { 'metrolyrics' : }

