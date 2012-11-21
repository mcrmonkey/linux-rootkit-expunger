linux-rootkit-expunger
======================

Linux Rootkit Expunger looks for and can remove a recently found Linux rootkit.

On Hacker News (HN) there was a
link to an article [Rootkit infects Linux web servers](http://www.h-online.com/open/news/item/Rootkit-infects-Linux-web-servers-1753969.html)
that indicates that there is a Linux rootkit in the wild.  Since I have
a bunch of servers that this could potentially effect I have
build a quick check and remove tool for this rookit.

The Key information from the article is:

	"Anti-virus software company Kaspersky Lab has analysed the
	malware. According to them, the rootkit, which it has dubbed
	Rootkit.Linux.Snakso.a, is designed to target 64-bit systems and
	has been compiled for kernel version 2.6.32-5, used in Debian
	Squeeze. The rootkit adds the line insmod /lib/modules/2.6.32
	5-amd64/kernel/sound/module_init.ko to the /etc/rc.local script, ensuring
	that the malicious module is executed each time the system boots."

The scripts are:

	* find-rookit.sh - to see if you have been infected.
	* remove-rootkit.sh - to remove a this rootkit
	* validate-file.sh - keeps a SAH1 sum of /etc/rc.local and a backup copy so if it is modified you can know.  Edit the file to configure.

To set validate-file.sh to run once ever other hour put this into your crontab.

	0 */2 * * * /home/ubuntu/rootkit-expunger/validate-file.sh

I really need help with this - I will improve these over time but I need
the help of other people that know more about how to fully protect a
GNU/Linux system from future rootkits.


Author
------
Philip Schlump

LICENSE
-------

MIT

