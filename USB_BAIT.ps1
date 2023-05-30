#Logs current time
$currentTime = Get-Date

#Creates Log file of current user. 
$loggedInUser = $env:USERNAME
$desktopLogFile = "$env:USERPROFILE\Desktop\usb_log.txt"
$picturesLogFile = "$env:USERPROFILE\Pictures\usb_log.txt"

#Creates log file in users "Personal Drive". Remove if not used.
$serverLogFile = "P:\,.txt"

#This is the folder & file within being created to provide the illusion of an action.
$shippingFolderPath = "$env:USERPROFILE\Desktop\Shipping"
$shippingDatesFile = "$shippingFolderPath\shipping dates.txt"

# Append the current date, time, and logged-in user to the desktop log file
$desktopEntry = "USB drive plugged in at: $($currentTime.ToString())"
$desktopEntry += " User: $loggedInUser"
Add-Content -Path $desktopLogFile -Value $desktopEntry

Write-Host "Log entry added to desktop: $desktopLogFile"

# Append the current date, time, and logged-in user to the Pictures log file
$picturesEntry = "USB drive plugged in at: $($currentTime.ToString())"
$picturesEntry += " User: $loggedInUser"
Add-Content -Path $picturesLogFile -Value $picturesEntry

Write-Host "Log entry added to Pictures: $picturesLogFile"

# Append the current date, time, and logged-in user to the server log file
$serverEntry = "USB drive plugged in at: $($currentTime.ToString())"
$serverEntry += " User: $loggedInUser"
Add-Content -Path $serverLogFile -Value $serverEntry

Write-Host "Log entry added to server: $serverLogFile"

# Create the "Shipping" folder and the "shipping dates" file if they don't exist.
# This is used to create the illusion this isnt just a script running, but a folder is being opened.
# Change $shippingFolderPath to change the folder being created. Change $shippingDatesContent to change the contents in the file.
# Change $shippingDatesFile to chnage the file name being created.
if (-not (Test-Path -Path $shippingFolderPath)) {
    New-Item -ItemType Directory -Path $shippingFolderPath | Out-Null
    Write-Host "Created 'Shipping' folder on desktop"
}

if (-not (Test-Path -Path $shippingDatesFile)) {
    $shippingDatesContent = "Dates to come:"
    $shippingDatesContent | Set-Content -Path $shippingDatesFile
    Write-Host "Created 'shipping dates.txt' file"
}

# Open the "Shipping" folder
Invoke-Item -Path $shippingFolderPath
