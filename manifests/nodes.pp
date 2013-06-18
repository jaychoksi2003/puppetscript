node 'pserver' {
	include vnc
	include subversion
	include nginx
	include git
}

node 'pclient1' {
	include nginx
	include vnc
}

include local-users
