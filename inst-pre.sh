#/usr/bin/bash
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum install yum-plugin-fastestmirror -y
yum --enablerepo=elrepo-kernel install kernel-ml -y
currker=$(awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg |grep '(5.')
grub2-set-default "$currker"
grub2-editenv list
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot
