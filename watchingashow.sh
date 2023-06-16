#!/bin/bash

#run with sudo

echo "Ok I'll make sure to update and shutdown while you're asleep :)"

echo "What time should I go to sleep?"

read time

echo "OK! Going to sleep at ${time}"

dnf update -y
dnf update --refresh -y
shutdown -P ${time}