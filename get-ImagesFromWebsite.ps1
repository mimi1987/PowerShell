function Get-ImagesFromWebsite {
  param(
    [string]$URL,
    [string]$Base_URL
  )

  $Respond = Invoke-WebRequest -Uri $URL
  $Images = $Respond.Images.Src
  [int]$counter = 0

  foreach ($link in $Images){
    if($link -match '^(https?)?\.www\.*'){
      Invoke-WebRequest -Uri $link -OutFile "Bild-$count.jpg"
      $count++
    }else{
      Invoke-WebRequest -Uri $Base_URL$link -OutFile "Bild-$count.jpg"
      $count++
    }
  } 
}
