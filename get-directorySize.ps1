function get-dirInfo($dir) {
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property Length -Sum
    return [math]::Round(($result).sum/1GB, 2)
}
