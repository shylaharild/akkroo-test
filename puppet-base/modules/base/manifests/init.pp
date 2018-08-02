############################
#
# Base module
#
############################

class base(
  $host_name = lookup('host_name'),
  $fqdn = lookup('fqdn'),
)

{
  file { '/etc/sysconfig/network':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('base/etc-sysconfig-network.erb'),
    require => Exec['hostname'],
  }

  file { '/etc/hostname':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('base/etc-hostname.erb'),
    require => Exec['hostname'],
  }

  file { '/etc/hosts':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('base/etc-hosts.erb'),
  }

  $command = "hostname ${host_name}"

  exec {  'hostname':
    command => $command,
    path    => '/usr/bin/:/bin/',
  }
}
