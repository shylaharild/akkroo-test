# Website 01 service

Class['base'] ~> Class['website']

class { 'base':
  host_name               => $host_name,
  fqdn                    => $fqdn,
  provider                => $provider,
  service                 => $service,
  vagrant_user            => $vagrant_user,
  before                  => Class['website'],
}

class { 'website':
  service => $service,
}
