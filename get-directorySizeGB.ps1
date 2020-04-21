# Command Line Parameters
param([string]$dir)

# Functions Section
function Get-DirectorySizeGB($dir) {
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property Length -Sum
    return [math]::Round(($result).sum/1GB, 2)
}

# Main Processing
Get-DirectorySizeGB $dir
