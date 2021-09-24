#! /bin/sh

mmchnode --ces-enable --ces-group=hdfscluster1 -N ipas-vm-0-107,ipas-vm-0-108

mmces address add --ces-group hdfscluster1 --ces-ip 10.10.0.110

