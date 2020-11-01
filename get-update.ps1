# Author: Michael Migsch
# Description: Gets all of the uninstalled updates of type software
# Parameters: Just the Computername, which uses $env:computername as default value.

# Functions

function Get-Update([string]$Computer=$env:COMPUTERNAME) {
    [void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic")
    $session = [Microsoft.VisualBasic.Interaction]::CreateObject("Microsoft.Update.Session", $Computer)
    $searcher = $session.CreateUpdateSearcher()
    $searcher.Search("IsInstalled=0 and Type='Software' and IsHidden=0")
}

$updateinfo = Get-Update
$updateinfo.updates | Format-Table title, LastDeploymentChangeTime
