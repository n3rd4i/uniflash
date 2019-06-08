$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# This is needed for unattended installation of Texas Instruments Drivers
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\driver_ti_1.cer"
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\driver_ti_2.cer"
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\driver_ti_3.cer"
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\driver_ti_4.cer"

$url        = 'http://software-dl.ti.com/ccs/esd/uniflash/uniflash_sl.5.0.0.2289.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'uniflash*'
  checksum      = '7FCE502D807C9859E64A715E29648E97'
  checksumType  = 'md5'
  silentArgs    = "--unattendedmodeui minimal --mode unattended"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
