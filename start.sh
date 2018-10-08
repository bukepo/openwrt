#!/bin/sh
sudo qemu-system-arm -machine virt,usb=on -usb -nographic \
    -kernel bin/targets/armvirt/32/openwrt-armvirt-32-zImage-initramfs \
    -fsdev local,security_model=passthrough,id=fsdev0,path=/home/me/Code/openwrt/luci-thread \
    -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare \
    -netdev tap,id=lan,script=qemu-lanup.sh,downscript=qemu-landown.sh \
    -device virtio-net-pci,netdev=lan \
    -netdev user,id=wan \
    -device virtio-net-pci,netdev=wan \
    -chardev pty,id=radio \
    -device virtio-serial -device virtserialport,chardev=radio,id=serial1,nr=1 \
    -append "console=ttyAMA0"

# no need for debugging
#    -chardev pty,id=radio \
#    -chardev pty,id=gdb \
#    -device virtio-serial -device virtserialport,chardev=gdb,id=serial2,nr=2 \

#    -device virtio-serial -chardev pty,id=radio0 \
#    -device virtserialport,chardev=radio0,name=serial0,nr=2
#-chardev pty,id=charserial0    \
    #-usb \
    #-device usb-serial,chardev=charserial0,id=serial0,bus=usb.0,port=1
#-device pci-serial,chardev=radio,id=serial0
#-device virtio-serial -device virtserialport,chardev=radio,id=radio0
#-device usb-serial,pty
    #-chardev pty,id=radio0 \
    #-serial chardev:radio0 \
    #-device virtio-serial-device -device virtconsole,chardev=char0 -chardev stdio,id=char0 \
    #-netdev tap,id=wan,script=qemu-wanup.sh,downscript=qemu-wandown.sh \
