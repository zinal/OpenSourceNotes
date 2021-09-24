#! /bin/sh

/usr/lpp/mmfs/bin/mmcrcluster -N `pwd`/NodesList --ccr-enable -r /usr/bin/ssh -R /usr/bin/scp -C cdp.on.cps

