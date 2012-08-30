class php54 {
	apt::source {'php54_dotdeb':
		location    =>"http://packages.dotdeb.org/",
		release     => "squeeze-php54",
		repos       => "all",
		include_src => false,
	}

	exec { "import-gpg":
		command => "/usr/bin/wget -q http://www.dotdeb.org/dotdeb.gpg -O -| /usr/bin/apt-key add -"
	}

	package { [
		"php5"
	] :
		ensure => latest,
		require => Exec["apt_update"],
	}
}