$Uri = 'https://techsnips.io/contributors/'
$Contributors = Invoke-WebRequest -Uri $Uri -UseBasicParsing

$Contributors.Images.Where({$_.Src -like "*contributor*"}) |
ForEach-Object {
    $Filename = $_.Src.split('/')[-1]
    Invoke-WebRequest -Uri $_.Src -OutFile C:\Images\$Filename
}
