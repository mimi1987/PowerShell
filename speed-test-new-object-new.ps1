# Anzahl der Durchläufe
$durchläufe = 10000

# Geschwindigkeitstest
"Geschwindigkeitstest: $durchläufe Instanzierungen"

# New-Object
"$durchläufe New-Object`t" + (Measure-Command { 1..$durchläufe | ForEach { New-Object System.Random } } ).TotalMilliseconds + "ms"

# New()
"$durchläufe new()`t`t" + (Measure-Command { 1..$durchläufe | ForEach { [System.Random]::new() } } ).TotalMilliseconds + "ms"
