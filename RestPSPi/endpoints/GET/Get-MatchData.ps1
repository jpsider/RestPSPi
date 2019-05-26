#Mgmt_Endpoint: 
#1. Accepts both names
#2. Sends commands to both Endpoints to Flip colors
#	A. First one is async
#	B. Second on is sync
#3. Gets the Temp from Sensor 1
#4. Gets the Temp from Sensor 2
#5. Determine if the Temps are within Match Threshold (Temp1 - Temp2) if it's greater than -.5 and less than .5, its a match!
#6. Return the Temps and the result.

param(
    $RequestArgs
)

if ($RequestArgs -like '*&*') {
    # Split the Argument Pairs by the '&' character
    $ArgumentPairs = $RequestArgs.split('&')
    $RequestObj = New-Object System.Object
    foreach ($ArgumentPair in $ArgumentPairs) {
        # Split the Pair data by the '=' character
        $Property, $Value = $ArgumentPair.split('=')
        $RequestObj | Add-Member -MemberType NoteProperty -Name $Property -value $Value
    }

    # Edit the Area below to utilize the Values of the new Request Object

    # Grab the names from the Parameters/arguments
    [string]$Name01 = $RequestObj.Name01
    [string]$Name02 = $RequestObj.Name02
    
    #Write-Output "Determining if $Name01 & $Name02 are a Match!"

    #2. Sends commands to both Endpoints to Flip colors for Rainbow countdown.
    #	A. First one is async
    #Write-Output "Tasting rainbow on Pi 01"
#    Start-Process -WindowStyle Normal powershell.exe -ArgumentList "Invoke-WebRequest -Method PUT -URI http://localhost:8084/Update/GPIO"
    
    #	B. Second on is sync
    #Write-Output "Tasting rainbow on Pi 02"
#    Invoke-WebRequest -Method Put -Uri "http://localhost:8082/Update/GPIO"


    $Temp_Sensor01 = $null
    $Temp_Sensor02 = $null
    $Sensor1 = '192.168.2.3'
    $Sensor2 = '192.168.2.7'

    # Play with the lights

    # Turn off the Green
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=0&value=0"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=0&value=0"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=1&value=0"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=1&value=0"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL

    # Blink the blue
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=2&value=1"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=2&value=1"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=3&value=1"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=3&value=1"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL
    Start-Sleep -Seconds 2
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=2&value=0"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=2&value=0"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=3&value=0"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=3&value=0"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL
    Start-Sleep -Seconds 1

    # Blink the Red
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=4&value=1"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=4&value=1"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=5&value=1"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=5&value=1"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL
    Start-Sleep -Seconds 2
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=4&value=0"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=4&value=0"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=5&value=0"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=5&value=0"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL
    Start-Sleep -Seconds 1
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=4&value=1"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=4&value=1"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=5&value=1"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=5&value=1"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL
    Start-Sleep -Seconds 2
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=4&value=0"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=4&value=0"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=5&value=0"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=5&value=0"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL    

    #3. Gets the Temp from Sensor 1
    #Write-Output "Getting Temp from Pi 01"
    $Sensor1_URL = "http://$Sensor1" + ":8084/endpoint/Temp"
    $Temp_Sensor01 = Invoke-RestMethod -Method Get -Uri $Sensor1_URL 
    #4. Gets the Temp from Sensor 2
    #Write-Output "Getting Temp from Pi 02"
    $Sensor2_URL = "http://$Sensor2" + ":8084/endpoint/Temp"
    $Temp_Sensor02 = Invoke-RestMethod -Method Get -Uri $Sensor2_URL

    [float]$Temp1 = $Temp_Sensor01.Temperature
    [float]$Temp2 = $Temp_Sensor02.Temperature


    #5. Determine if the Temps are within Match Threshold (Temp1 - Temp2) if it's greater than -.5 and less than .5, its a match!
    #Write-Output "Performing Match Comparison"
    [float]$TempDifference = $Temp1 - $Temp2
    if($TempDifference -eq 0){
        $MatchResult = "ExactMatch"
    } elseif(($TempDifference -gt '-.5') -and ($TempDifference -lt '.5')){
        $MatchResult = "Match"
    } else {
        $MatchResult = "NoMatch"
    }
    #Write-Output "It's a $MatchResult"
    #6. Return the Temps and the result.
    $ReturnMessage = New-Object System.Object
    $ReturnMessage | Add-Member -MemberType NoteProperty -Name "Name01" -Value "$Name01"
    $ReturnMessage | Add-Member -MemberType NoteProperty -Name "Temp01" -Value "$Temp1"
    $ReturnMessage | Add-Member -MemberType NoteProperty -Name "Name02" -Value "$Name02"
    $ReturnMessage | Add-Member -MemberType NoteProperty -Name "Temp02" -Value "$Temp2"
    $ReturnMessage | Add-Member -MemberType NoteProperty -Name "MatchResult" -Value "$MatchResult"

    #Turn the Green on
    $Sensor1GPIO0URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=0&value=1"
    $Sensor2GPIO0URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=0&value=1"
    $Sensor1GPIO1URL = "http://$Sensor1" + ":8084/Update/GPIO?GPIO_Pin=1&value=1"
    $Sensor2GPIO1URL = "http://$Sensor2" + ":8084/Update/GPIO?GPIO_Pin=1&value=1"
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO0URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor1GPIO1URL
    $NoOutput = Invoke-RestMethod -Method Put -Uri $Sensor2GPIO1URL

}
else {
    $ReturnMessage = "Please provide Names to compare!"
}
$ReturnMessage