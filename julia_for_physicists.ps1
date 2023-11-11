Write-Host "Welcome to Julia for physicists"
Write-Host "-------------------------------"

Write-Host "Let's check if Julia is installed!"
Write-Host "................................."

# Check if Julia is installed
if (Test-Path "$(Get-Command julia -ErrorAction SilentlyContinue)") {
    # Julia installed
    Write-Host "Julia is already installed: $((julia --version).Trim())"
    Write-Host "Now installing additional packages"

    # Install additional packages
    try {
        julia -e 'import Pkg; Pkg.add(["CSV", "Plots", "Unitful", "PhysicalConstants", 
        "DifferentialEquations", "QuantumOptics", "PyCall", "SymPy"])'
        Write-Host "Julia is now installed with the following additional packages"
        Write-Host "-------------------------------------------------------------"
        Write-Host "CSV"
        Write-Host "Plots"
        Write-Host "Unitful"
        Write-Host "PhysicalConstants"
        Write-Host "DifferentialEquations"
        Write-Host "QuantumOptics"
        Write-Host "PyCall"
        Write-Host "SymPy"
        Write-Host "Thank you for using my installer!"
    } catch {
        Write-Host "Failed to install packages. Please check the error messages above."
    }
}
else {
    # Julia not installed
    Write-Host "Julia is not installed."
    Write-Host "-----------------------"
    Write-Host "Getting Julia with curl"

    # Try to download Julia with curl and handle errors
    try {
        Invoke-WebRequest -Uri "https://julialang-s3.julialang.org/bin/windows/x64/1.9/julia-1.9.3-win64.exe" -OutFile julia-installer.exe
        Write-Host "Installing Julia"
        Start-Process -FilePath "julia-installer.exe" -ArgumentList "/S /D=C:\Julia" -Wait
        Remove-Item -Path "julia-installer.exe" -Force
        Write-Host "Installed Julia!"
        Write-Host "Now installing additional packages"

        # Install additional packages
        try {
            julia -e 'import Pkg; Pkg.add(["CSV", "Plots", "Unitful", "PhysicalConstants", 
            "DifferentialEquations", "QuantumOptics", "PyCall", "SymPy"])'
            Write-Host "Julia is now installed with the following additional packages"
            Write-Host "-------------------------------------------------------------"
            Write-Host "CSV"
            Write-Host "Plots"
            Write-Host "Unitful"
            Write-Host "PhysicalConstants"
            Write-Host "DifferentialEquations"
            Write-Host "QuantumOptics"
            Write-Host "PyCall"
            Write-Host "SymPy"
            Write-Host "Thank you for using my installer!"
        } catch {
            Write-Host "Failed to install packages. Please check the error messages above."
        }
    } catch {
        Write-Host "Failed to download Julia. Please check your internet connection and try again later."
    }
}
