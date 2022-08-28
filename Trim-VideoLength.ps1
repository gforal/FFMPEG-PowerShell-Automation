param($InputFile,$OutputFile,$RunningTime)

If(Test-Path $InputFile) { 
    Write-Host "Input file exists"
    $ffmpegCorrectedInput = "`"" + (Get-ChildItem -Path $InputFile).FullName + "`"" 
} else { 
    Write-Host "Source file does not exist, exiting..." 
    Break Script
}

If(Test-Path $OutputFile) { 
    Write-Host "Source folder exists, exiting..." 
    Break Script
} else { 
    Write-Host "Source folder does not exist..." 
    $ffmpegCorrectedOutput = "`"" + $OutputFile + "`""
}


Write-Host "FFMPEG: " $ffmpegCorrectedInput, $ffmpegCorrectedOutput, $RunningTime

& ffmpeg -i $ffmpegCorrectedInput -c copy -t $RunningTime $ffmpegCorrectedOutput
