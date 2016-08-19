#!/bin/bash
set -e

if [ "$1" = 'trytond' ]; then
	
	exec gosu /usr/local/bin/trytond -c trytond.conf -v
fi

exec "$@"
