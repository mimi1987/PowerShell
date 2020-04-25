# Accept two command line args for source and destination path.
param([string]$source="C:\temp\source", [string]$destination="C:\temp\destination")


# Check if a path exists else create one when create switch is set.
function Check-Folder([string]$path, [switch]$create)
{
    $exists = Test-Path $path
    if (!$exists -and $create)
    {
        # Create the path, because it doesn't exists.
        New-Item $path -ItemType Directory
        $exists = Test-Path $path
    }
    return $exists
}

# Get stats about the files in the provided path.
function Display-FolderStats([string]$path)
{
    $files = dir $path -Recurse | Where-Object {!$_.PSIsContainer}
    $totals = $files | Measure-Object -Property Length -Sum
    $stats = "" | Select-Object -Property path, count, size
    $stats.path = $path
    $stats.count = $totals.count
    $stats.size = [math]::round($totals.size/1MB,2)
    return $stats
}

# Main Processing.

# Check if source exists, exit script if not.
$source_exists = Check-Folder $source
if (!$source_exists)
{
    Write-Host "The source doesn't exist. Script can't continue: {}" -f $source
    exit
}

# Check if destination exists, if not create it.
$destination_exists = Check-Folder $destination -create
if (!$destination_exists)
{
    Write-Host "Destination directory not found. Script can't continue: {}" -f $destination
    exit
}

# Get all the files from the source directory to copy it.
$files = dir $source -Recurse | Where-Object {!$_.PSIsContainer}

# Create a folder in destination for each file extension in source.
foreach ($file in $files)
{
    # Get the file extensions for the folder names.
    $file_extension = $file.Extension.Replace('.', '')

    # Create the new path to copy files too.
    $ext_dest_dir = "$destination\$file_extension"

    # Test if the folder named after extension already exist, if not create it.
    $dirname_exists = Check-Folder $ext_dest_dir -create

    # Write a message and exit script if creation of folder is not possible.
    if (!$dirname_exists)
    {
        Write-Host "Can't create directory!"
        exit
    }

    # Copy files from source to the new destination folder named after the extension
    # to organize the files by extension.
    copy $file.fullname $ext_dest_dir
}
