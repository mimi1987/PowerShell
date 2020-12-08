$Day = (Get-Date).DayOfYear
$Year = (Get-Date).Year

Write-Host "Hallo, $env:USERNAME!" -ForegroundColor White -BackgroundColor Blue
Write-Host "Heute ist der $Day. Tag des Jahres $Year."
# ...und viele weitere Definitionen

# Sets the apperance of the console

Set-PSReadLineOption -Colors @{
  "Number" = "DarkMagenta"
  "Parameter" = "Cyan"
  "Variable" = "#FFA400"
  "Keyword" = "DarkRed"
}


# Sets the prompt

function prompt
{
  "PS $(Get-Date -Format HH:mm)>"
  $Host.UI.RawUI.WindowTitle = "$(Get-Location) +++ User: $env:USERNAME"
}
