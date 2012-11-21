#!/bin/sh

if grep /etc/rc.local "insmod[ \t]*/lib/modules/2.6.32[ \t]*5-amd64/kernel/sound/module_init.ko" >/tmp/$$.error 2>/tmp/$$.error ; then
	# You hvae a problem.
	echo "Rootkit Found!  This is bad."
	cat /etc/$$.error
	rm -f /etc/$$.error
	exit 1
else
	echo "All is well."
	exit 0
fi

