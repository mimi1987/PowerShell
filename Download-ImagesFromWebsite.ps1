param([string]$url)

# Functions

function Download-ImagesFromWebsite([string]$url)
{
    $website = Invoke-WebRequest -UseBasicParsing $url
    $images_src = $website.images.src
    
    foreach ($image_src in @($images_src))
    {
        $image_filename = $($image_src.split('/'))[-1]
        Invoke-WebRequest -Uri $image_src -OutFile $image_filename
        Write-Host "Downloaded image: $image_filename"
        
    }
}

# Main Processing
Download-ImagesFromWebsite $url
