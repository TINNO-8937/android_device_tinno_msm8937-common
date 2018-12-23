#!/vendor/bin/sh

# Static swiftness
echo 1 > /proc/sys/vm/swap_ratio_enable
echo 70 > /proc/sys/vm/swap_ratio

# Swap disk - 200MB size
if [ ! -f /data/system/swap/swapfile ]; then
     dd if=/dev/zero of=/data/system/swap/swapfile bs=1m count=200
fi
mkswap /data/system/swap/swapfile
swapon /data/system/swap/swapfile -p 32758
