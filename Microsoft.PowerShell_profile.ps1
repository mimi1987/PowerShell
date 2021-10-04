# MY POWERSHELL CONFIGURATION

    # Sets the Syntax Colors
    Set-PSReadLineOption -Colors @{
    "Variable" = "DarkYellow"
    "Keyword" = "DarkRed"
    "Parameter" = "Cyan"
    "Number" = "DarkMagenta"
    }


# MY FUNCTION DECLARATIONS
    function Get-ScreenSize {
        param(
            [double]$ZollMin,
            [double]$ZollMax
        )

        $ZollMin = [math]::round($ZollMin * 2.54 / 100, 2)
        $ZollMax = [math]::round($ZollMax * 2.54 / 100, 2)

        ("{0}-{1}m" -f $ZollMin, $ZollMax) -replace ",", "." | Set-Clipboard
    }
