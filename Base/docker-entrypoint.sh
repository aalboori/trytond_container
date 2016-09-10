#!/bin/bash
set -e

if [ "$1" = 'trytond' ]; then
	
	# Run setup scripts for the server
	if [ -d /docker-entrypoint-init.d ]; then
		for f in /docker-entrypoint-init.d/*.sh; do
			[ -f "$f" ] && . "$f"
		done
	fi
	
	# Reset permissions to the data directory
	chown -R trytond:trytond "$TRYTOND_DATA"
	
	exec gosu trytond /usr/local/bin/trytond -c trytond.conf -v
fi

exec "$@"
