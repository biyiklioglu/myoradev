#!/bin/sh

#exec &>> /tmp/myoradev.$$.log
#set -x
#echo "$@ $$"


#integer minor=$3
major=$2
minor=$3

USER=oracle
GROUP=oinstall
PERM=660
DEVPATH=/dev/oracle
#PREFIX=DATA
CONFFILE=/etc/sysconfig/myoradev


if [ ! -d $DEVPATH ]
then
	mkdir $DEVPATH
	chmod 755 $DEVPATH
fi

DEVNAME=`/bin/awk '/'$1'/{print $2}' $CONFFILE`

if [ "$DEVNAME" != "" ]
then

/bin/mknod $DEVPATH/$DEVNAME b $major $minor
/bin/chown $USER:$GROUP $DEVPATH/$DEVNAME
/bin/chmod $PERM $DEVPATH/$DEVNAME

fi
