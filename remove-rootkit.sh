#!/bin/sh

# Check that we are running as root - else quit.
if test "$(whoami)" = "root" ; then
	:
else
	echo "Usage: remove-rootkit.sh must be run as root!"
	exit 1
fi

if grep /etc/rc.local "insmod[ \t]*/lib/modules/2.6.32[ \t]*5-amd64/kernel/sound/module_init.ko" >/dev/null 2>/dev/null ; then
	# You hvae a problem.
	ed /etc/rc.local <<XXxxXX
g/insmod[ \t]*/lib/modules/2.6.32[ \t]*5-amd64/kernel/sound/module_init.ko/s/^/### rootkit ###/
w
q
XXxxXX
else
	echo "Nothing to remove!"
fi

