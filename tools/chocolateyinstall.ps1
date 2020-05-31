$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir helper.ps1)"

$url        = 'http://software-dl.ti.com/ccs/esd/uniflash/uniflash_sl.6.0.0.2710.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'uniflash*'
  checksum      = '4081E62EED5FAB178FE7B7631EB90853F6F466F37F447050D765A8C91ACE073F'
  checksumType  = 'sha256'
  silentArgs    = "--unattendedmodeui minimal --mode unattended"
  validExitCodes= @(0, 3010, 1641)
}
$ahkProc = Start-Ahk('cert_installer.ahk')

Install-ChocolateyPackage @packageArgs

# minimum delay to ensure the autohotkey takes efect
& Start-Sleep 1
if (Get-Process -id $ahkProc.Id -ErrorAction SilentlyContinue) {Stop-Process -id $ahkProc.Id}
