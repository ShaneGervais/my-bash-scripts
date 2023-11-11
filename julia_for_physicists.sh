#!/bin/bash

echo "Welcome to Julia for physicists"
echo "-------------------------------"

echo "Lets check if Julia is installed!"
echo "................................."

if command -v julia &>/dev/null; then
    # Julia installed
    echo "Julia is already installed: $(julia --version)"
    echo "Now installing additional packages"
    
    julia -e 'import Pkg; Pkg.add(["CSV", "Plots", "Unitful", "PhysicalConstants", 
    "DifferentialEquations", "QuantumOptics", "PyCall", "SymPy"])'
    
    if [ $? -eq 0 ]; then

        echo "Julia is now installed with the following additional packages"
        echo "-------------------------------------------------------------"
        echo "CSV"
        echo "Plots"
        echo "Unitful"
        echo "PhysicalConstants"
        echo "DifferentialEquations"
        echo "QuantumOptics"
        echo "PyCall"
        echo "SymPy"
        echo "Thank you for using my installer!"
    else
        echo "AN ERROR HAS OCCURED WHEN TRYING TO INSTALL ADDITIONAL PACKAGES!"
    fi

else
    # Julia not installed
    echo "Julia is not installed."
    echo "-----------------------"
    echo "Getting Julia with curl"
    if curl -sSL "https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.3-linux-x86_64.tar.gz" -o julia.tar.gz; then
        echo "Opening tar folder and installing Julia"
        tar -xvzf julia.tar.gz -C /opt/
        echo "Removing tar file"
        rm julia.tar.gz
        echo 'Adding to path'
        echo 'export PATH="/opt/julia-1.9.3/bin:$PATH"' | tee -a ~/.bashrc
        source ~/.bashrc
        echo "Installed Julia!"
        echo "Now installing additional packages"
        
        julia -e 'import Pkg; try Pkg.add(["CSV", "Plots", "Unitful", "PhysicalConstants", 
        "DifferentialEquations", "QuantumOptics", "PyCall", "SymPy"]); catch println("Error installing packages. Please check your Julia installation or try again later."); end'

        if [ $? -eq 0 ]; then
            echo "Julia: $(julia --version) is installed!"
            echo "Along with the following additional packages:"
            echo "-------------------------------------------------------------"
            echo "CSV"
            echo "Plots"
            echo "Unitful"
            echo "PhysicalConstants"
            echo "DifferentialEquations"
            echo "QuantumOptics"
            echo "PyCall"
            echo "SymPy"
            echo "Thank you for using my installer!"
        else
            echo "Failed to install packages. Please check the error messages above."
        fi
    else
        echo "Failed to download Julia. Please check your internet connection!"
    fi

fi
