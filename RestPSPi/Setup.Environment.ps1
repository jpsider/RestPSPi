# Useful Links:
# https://theposhwolf.com/howtos/Controlling-an-IOT-power-relay-and-BME280-sensor-with-PowerShell-on-a-Raspberry-Pi/
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6#raspbian
# https://github.com/PowerShell/PowerShell-IoT
# https://github.com/PowerShell/PowerShell-IoT#running
# https://github.com/PowerShell/PowerShell-IoT/tree/master/Examples/Microsoft.PowerShell.IoT.BME280
# https://www.raspberrypi.org/documentation/usage/gpio/
# https://www.jameco.com/Jameco/workshop/circuitnotes/raspberry-pi-circuit-note.html
# https://www.hackster.io/gotfredsen/raspberry-pi-weather-station-8562ad

# SSH to raspberryPI
# Install PowerShell 6
# Install prerequisites
sudo apt-get install libunwind8

# Grab the latest tar.gz
wget https://github.com/PowerShell/PowerShell/releases/download/v6.1.0/powershell-6.1.0-linux-arm32.tar.gz

# Make folder to put powershell
mkdir ~/powershell

# Unpack the tar.gz file
tar -xvf ./powershell-6.1.0-linux-arm32.tar.gz -C ~/powershell

# Start PowerShell from bash with sudo to create a symbolic link
sudo ~/powershell/pwsh -c New-Item -ItemType SymbolicLink -Path "/usr/bin/pwsh" -Target "\$PSHOME/pwsh" -Force

# Install Wiringpi
# https://projects.drogon.net/raspberry-pi/wiringpi/download-and-install/
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build


# Now to start PowerShell you can just run "pwsh"
sudo WIRINGPI_CODES=1 pwsh

gpio mode 0 out
gpio mode 1 out
gpio mode 2 out
gpio mode 3 out
gpio mode 4 out
gpio mode 5 out

# Install Required Modules
Install-Module Microsoft.PowerShell.IOT
Install-Module -Name RestPS
git clone https://github.com/PowerShell/PowerShell-IoT.git

# Enable the I2C device
##### Not automated:
sudo raspi-config
# Option 5
# Option P5
# Enable and Finish

# Useful Commands

Import-Module Microsoft.PowerShell.IoT
Import-Module ./PowerShell-IoT/Examples/Microsoft.PowerShell.IoT.BME280
Get-BME280Data -Fahrenheit

# playing with the data
Get-GpioPin # Note - running this may cause the hardware device to disconnect. It's a pain in the ass!
Get-BME280Device
Get-BME280Data
