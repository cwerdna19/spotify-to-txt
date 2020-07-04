#

$path = ".\current_spotify_song.txt"

While ($True) {
  $current_song = (
    Get-Process | Where-Object {
      ($_.ProcessName -eq 'spotify') -and ($_.mainWindowTitle -ne '')
    } | Select-Object -ExpandProperty mainWindowTitle
  )
  $no_song = "Not playing..."
  $line = @('\', '|', '/', '-', '\', '|', '/', '-')
  $write = ""

  If ($current_song -eq "Spotify Premium"){
    $no_song | Out-File -FilePath $path -Encoding utf8
    $write = "`rCurrent song: " + $no_song
  } Else {
    $current_song | Out-File -FilePath F:\Programming\Powershell\OBS\current_spotify_song.txt -Encoding utf8
    $write = "`rCurrent song: " + $current_song
  }

  $time = 10
  While ($time -gt 0) {
    For ($n = 0; $n -lt $line.length; $n++) {
      Write-Host -NoNewLine $write $line[$n] "                                   "
      Start-Sleep -Milliseconds 125
    }
    $time -= 1
  }
}
