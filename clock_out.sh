#!/bin/bash
#run with sudo
echo "All done! Have a nice rest of your day! Give me a few moments to update :)"

dnf update -y
dnf update --refresh -y
echo $?
shutdown -P 1