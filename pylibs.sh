#!/bin/bash
# Run with sudo

if command -v apt &> /dev/null; then
    package_manager="apt"
    apt install -y python3-pip python3-dev 
    pip install sympy matplotlib numpy pandas IPython scipy 
fi

if command -v yum &> /dev/null; then
    package_manager="yum"
    yum install -y python3-pip python3-devel 
    pip install sympy matplotlib numpy pandas IPython scipy 
fi

if command -v dnf &> /dev/null; then
    package_manager="dnf"
    dnf install -y python3-pip python3-devel 
    pip install sympy matplotlib numpy pandas IPython scipy 
fi

if command -v zypper &> /dev/null; then
    package_manager="zypper"
    zypper install -y python3-pip python3-devel 
    pip install sympy matplotlib numpy pandas IPython scipy 
fi

if command -v pacman &> /dev/null; then
    package_manager="pacman"
    pacman -S --noconfirm python3-pip python3
    pip install sympy matplotlib numpy pandas IPython scipy 
fi

if [ -n "$package_manager" ]; then
    echo "Detected package manager: $package_manager"
    echo "Attempted to install the following:"
    echo "-----------------------------------"
    echo "- sympy"
    echo "- matplotlib"
    echo "- numpy"
    echo "- pandas"
    echo "- IPython"
    echo "- scipy"
    echo "Please verify the terminal output for any errors"
else
    echo "Unable to detect package manager."
fi
