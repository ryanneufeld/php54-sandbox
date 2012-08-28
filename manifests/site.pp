group { "puppet":
	ensure => present
}
include apache
include php54