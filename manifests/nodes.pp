node 'pserver' {
	include vnc
	include subversion
	include httpd
	include git
}

node 'nagiosserver' {
	include httpd, nagios
	nagios::server::hostAdd {'test':
	$clienthostname = 'pclient1',
	$clientIPaddress = '192.168.131.137',
	}

node 'pclient1' {
	include vnc
	include subversion
	include git
	class { 'ntp':
		server	=> 'time.windows.com',
	}
	include httpd	

	nagios::client { 'nagiosclient-pclient1':
	nagiosserverIP	=> '192.168.131.139',
	}


}



node default {
	include localusers
}
include sudoers, schedulers
