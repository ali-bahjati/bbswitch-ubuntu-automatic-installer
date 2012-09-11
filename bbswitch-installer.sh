#!/bin/bash
if [ "`lspci | grep VGA | grep Intel`" != "" -a "`lspci | grep VGA | grep NVIDIA`" != "" ]
then
	sudo apt-get install dkms
	dpkg -i './bbswitch-dkms_0.4.2-2~preciseppa1_all.deb'
	echo bbswitch >> /etc/modules
	echo options bbswitch load_state=0 > /etc/modprobe.d/bbswitch-options.conf
	echo blacklist nouveau > /etc/modprobe.d/blacklist-nouveau.conf
	echo blacklist nvidia > /etc/modprobe.d/blacklist-nvidia.conf
	depmod -a
fi

