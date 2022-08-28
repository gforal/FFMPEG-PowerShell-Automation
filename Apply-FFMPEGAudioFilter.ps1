param($SourceFolder,$DestinationFolder)

If(Test-Path $SourceFolder) { 
    Write-Host "Source folder exists" 
} else { 
    Write-Host "Source folder does not exist, exiting..." 
}

$vids = Get-ChildItem -Path $SourceFolder -Filter "*.mp4"

If(Test-Path "$destinationfolder") {
    Write-Host "Target folder exists..."
} else {
    New-Item -Path . -Name "$destinationfolder" -ItemType Directory -Force
}

ForEach($vid in $vids) {
    $inputfn = "`"" + $vid.Name + "`""
    $output = "`"" + "$destinationfolder" + "\" + $vid.Name + "`"" 
    & ffmpeg -i $inputfn -hide_banner -loglevel error -c:v copy -af `"volume=2.5`" -c:a aac -b:a 256k $output
    #Start-Process -FilePath "ffmpeg" -ArgumentList "-i $inputfn -hide_banner -loglevel error -c:v copy -af `"volume=2.5`" -c:a aac -b:a 256k $output " -Wait
}
