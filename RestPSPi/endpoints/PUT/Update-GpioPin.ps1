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
    [int]$GPIO_Pin = $RequestObj.GPIO_Pin
    [int]$Value = $RequestObj.Value
    
    # Update the Pin value
    gpio write $GPIO_PIN $Value

    $Message = "The Pin $GPIO_Pin was updated to $Value"
}
else {
    $Message = "Please provide a GPIO_Pin and Value"
}

return $Message