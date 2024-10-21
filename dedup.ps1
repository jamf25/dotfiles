# Define the path to the CSV file
$csvFile = "path_to_your_csv_file.csv"

# Import the CSV file
$data = Import-Csv -Path $csvFile

# Check for duplicate "name"
$duplicateNames = $data | Group-Object -Property name | Where-Object { $_.Count -gt 1 }

# Check for duplicate "ip address"
$duplicateIPs = $data | Group-Object -Property "ip address" | Where-Object { $_.Count -gt 1 }

# Print duplicates for "name"
if ($duplicateNames) {
    Write-Host "Duplicate Names found:"
    foreach ($group in $duplicateNames) {
        $group.Group | ForEach-Object { Write-Host "Name: $($_.name), IP: $($_.'ip address')" }
    }
} else {
    Write-Host "No duplicate Names found."
}

# Print duplicates for "ip address"
if ($duplicateIPs) {
    Write-Host "Duplicate IP Addresses found:"
    foreach ($group in $duplicateIPs) {
        $group.Group | ForEach-Object { Write-Host "Name: $($_.name), IP: $($_.'ip address')" }
    }
} else {
    Write-Host "No duplicate IP Addresses found."
}
