group { "puppet":
	ensure => present,
}
class { 'apt': }
class { 'apache': }
class { 'php54' : }
class { 'devsite' : }
package{[
    "git",
    "subversion",
  ]:
  ensure  => present,
}

