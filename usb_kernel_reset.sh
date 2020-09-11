# reset all usb ports

if [ $USER != "root" ]
	then
		echo "Please run as root!"
		exit
fi
for i in /sys/bus/pci/drivers/[uoex]hci_hcd/*:*; do
    [ -e "$i" ] || continue
    sudo echo "${i##*/}" > "${i%/*}/unbind"
    echo "${i##*/} > ${i%/*}/unbind"
    echo "${i##*/}" > "${i%/*}/bind"
    echo "${i##*/} > ${i%/*}/bind"
done


