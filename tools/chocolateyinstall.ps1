$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir helper.ps1)"

$url        = 'http://software-dl.ti.com/ccs/esd/uniflash/uniflash_sl.5.1.0.2397.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'uniflash*'
  checksum      = '4EDD650A39F1227F4B2EACA6840A0487FDAFE8AC70917C3EEA686173D5118054'
  checksumType  = 'sha256'
  silentArgs    = "--unattendedmodeui minimal --mode unattended"
  validExitCodes= @(0, 3010, 1641)
}
$ahkProc = Start-Ahk('cert_installer.ahk')

Install-ChocolateyPackage @packageArgs

# minimum delay to ensure the autohotkey takes efect
& Start-Sleep 1
if (Get-Process -id $ahkProc.Id -ErrorAction SilentlyContinue) {Stop-Process -id $ahkProc.Id}
