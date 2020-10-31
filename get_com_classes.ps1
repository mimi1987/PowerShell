Get-ChildItem -Path REGISTRY::HKEY_Classes_Root -Include ProgID -Recurse | ForEach-Object { $_.GetValue("")} | Sort-Object | Format-Wide -Column 3 -Property @{Expression={$_}} -Force
