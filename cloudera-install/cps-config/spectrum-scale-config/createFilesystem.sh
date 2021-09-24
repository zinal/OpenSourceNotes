#! /bin/sh

/usr/lpp/mmfs/bin/mmcrfs fs0 -F disk-pool-stanzas -A yes \
  -B 2M --metadata-block-size 256K \
  -L 32M -T /fs0 

