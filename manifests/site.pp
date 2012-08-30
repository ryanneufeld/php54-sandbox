group { "puppet":
	ensure => present,
}
class { 'apt': }
include apache
include php54