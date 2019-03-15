
$count =0
do {
    $TempData = Invoke-RestMethod -Method GET -Uri "http://192.168.2.3:8084/endpoint/Temp"

    [int]$Temp = $TempData.Temperature
    [int]$Pressure = $TempData.Pressure
    [int]$Humidity = $TempData.Humidity

    Write-Output "###########################"
    Write-Output "The Temperature is: $Temp"
    Write-Output "The Pressure is: $Pressure"
    Write-Output "The Humidity is: $Humidity"
    Write-Output "###########################"

    if ($Temp -gt 76){
        Write-Output "$Temp : That's HOT!"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=0&Value=1"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=4&Value=1"
    } elseif(($Temp -le 76) -and ($Temp -ge 72) ) {
        Write-Output "$Temp : That's just right!"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=1&Value=1"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=3&Value=1"
    } elseif ($Temp -lt 72){
        Write-Output "$Temp : brrrrrrrr That's COLD!"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=5&Value=1"
        invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=2&Value=1"
    }

    start-sleep -s 5
    # Turn off all the lights
    invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=0&Value=0"
    invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=4&Value=0"
    invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=1&Value=0"
    invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=3&Value=0"
    invoke-restmethod -Method Put -Uri "http://192.168.2.3:8084/Update/GPIO?GPIO_Pin=5&Value=0"
    Write-Output "######################################################"
    $count++
} while ($count -lt 5)