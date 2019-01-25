# Import required modules:
Import-Module Microsoft.PowerShell.IoT
Import-Module ./PowerShell-IoT/Examples/Microsoft.PowerShell.IoT.BME280
Import-Module ./PowerShell-IoT/Examples/Microsoft.PowerShell.IoT.LED
Import-Module RestPS

# Get the desired Device
$script:device = Get-BME280Device -id 0x77

# Just used temporarily

New-Item -Path "/RestPS" -ItemType Directory
New-Item -Path "/RestPS/Endpoints" -ItemType Directory
New-Item -Path "/RestPS/Endpoints/GET" -ItemType Directory
New-Item -Path "/RestPS/Endpoints/PUT" -ItemType Directory

$data = @(
    @{
        'RequestType'    = 'GET'
        'RequestURL'     = '/Endpoint/Status'
        'RequestCommand' = 'Return 1'
    }
    @{
        'RequestType'    = 'GET'
        'RequestURL'     = '/endpoint/Temp'
        'RequestCommand' = '/RestPS/Endpoints/GET/Get-Temp.ps1'
    }
    @{
        'RequestType'    = 'PUT'
        'RequestURL'     = '/Update/GPIO'
        'RequestCommand' = '/RestPS/Endpoints/PUT/Update-GPIOpin.ps1'
    }
)
$data | ConvertTo-Json | Out-File -FilePath "/RestPS/Endpoints/Routes.json" -Encoding ascii

#writes the endpoint file
$ScriptData01 = 'Get-BME280Data -Fahrenheit' | out-file -FilePath '/RestPS/Endpoints/GET/Get-Temp.ps1' -Encoding ascii

#writes the endpoint file
$ScriptData02 = '
param( 
    $RequestArgs 
) 
 
if ($RequestArgs -like "*&*") { 
    # Split the Argument Pairs by the "&" character 
    $ArgumentPairs = $RequestArgs.split("&") 
    $RequestObj = New-Object System.Object 
    foreach ($ArgumentPair in $ArgumentPairs) { 
        # Split the Pair data by the "=" character 
        $Property, $Value = $ArgumentPair.split("=") 
        $RequestObj | Add-Member -MemberType NoteProperty -Name $Property -value $Value 
    } 
 
    # Edit the Area below to utilize the Values of the new Request Object 
    [int]$GPIO_Pin = $RequestObj.GPIO_Pin 
    [int]$Value = $RequestObj.Value 
     
    # Update the Pin value 
    gpio write $GPIO_PIN $Value 
 
    $Message = "The Pin $GPIO_Pin was updated to $Value" 
} 
else { 
    $Message = "Please provide a GPIO_Pin and Value" 
} 
return $Message' | out-file -FilePath '/RestPS/Endpoints/PUT/Update-GPIOpin.ps1'

Start-RestPSListener -RoutesFilePath "/RestPS/Endpoints/Routes.json" -Port 8084





