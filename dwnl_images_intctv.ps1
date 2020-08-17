$filename = "pic_"
$count = 0
$images | Where-Object { $_ -match '.*jpeg.*' } | foreach { $uri = "https:$_"; Invoke-WebRequest -Uri $uri -OutFile "$($filename)$(count).jpeg"; $count++  }
