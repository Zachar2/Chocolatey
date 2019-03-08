$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'sdformatter' -FileFullPath "$toolsDir\SDCardFormatterv5_WinEN.zip" -Url 'https://www.sdcard.org/downloads/formatter_4/eula_windows/SDCardFormatterv5_WinEN.zip'

Get-ChocolateyUnzip -FileFullPath "$toolsDir\SDCardFormatterv5_WinEN.zip" -Destination $toolsDir

 $packageArgs = @{
  packageName   = 'sdformatter'
  fileType      = 'exe'
  file          = "$toolsDir\SDCardFormatterv5_WinEN\SD Card Formatter 5.0.1 Setup.exe"
  silentArgs    = '/s /v"/qn /norestart"'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
