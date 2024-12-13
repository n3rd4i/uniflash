$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir helper.ps1)"

$url        = 'https://dr-download.ti.com/software-development/software-programming-tool/MD-QeJBJLj8gq/8.8.1/uniflash_sl.8.8.1.4983.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'uniflash*'
  checksum      = '66b6f2102b9787a2c204018fd698db97'
  checksumType  = 'md5'
  silentArgs    = "--unattendedmodeui minimal --mode unattended"
  validExitCodes= @(0, 3010, 1641)
}
$ahkProc = Start-Ahk('cert_installer.ahk')

Install-ChocolateyPackage @packageArgs

# minimum delay to ensure the autohotkey takes efect
& Start-Sleep 1
if (Get-Process -id $ahkProc.Id -ErrorAction SilentlyContinue) {Stop-Process -id $ahkProc.Id}
