#################
#
# Website module
#
#################

class website (
  service = lookup('service'),
)

{
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
	  enable => true,
    ensure => running,
  }

  file { '/usr/share/nginx/html/index.html':
    content => template('website/index.html.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/usr/share/nginx/html/status.html':
    content => template('website/status.html.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  file { '/etc/nginx/conf.d/website.conf':
    content => template('website/website.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

}
