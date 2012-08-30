group { "puppet":
	ensure => present,
}
class { 'apt':
	disable_keys      => false,
}
include apache
include php54