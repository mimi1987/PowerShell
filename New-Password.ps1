# Autor: Michael Migsch
# Beschreibung: Erstellt ein Passwort variabler Länge.
# Version: 1.0

# Funktion Passwortgenerator
function New-Password ([int] $Anzahl, [switch]$Zwischenablage) {
    $Kennwort = ""
    $PasswortGenerator = New-Object System.Random

    for ($i=0;$i -lt $Anzahl;$i++) {
        $Kennwort = $Kennwort + [char]$PasswortGenerator.Next(33,127)
    }
    
    if ($zwischenablage) {
        $Kennwort | clip.exe
    }
    
    return $Kennwort
}
