$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\helper.ps1"

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

$certificates = @{
  C76E488AFC115AD09DA669CBE413316FE56E9438 = 'CN=Texas Instruments, OU=WCS, O=Texas Instruments, L=Dallas, S=Texas, C=US';
  BCCCF26267CEE6B58B3818782D26F4307BCB6A4F = 'CN=Texas Instruments Inc, OU=Stellaris MCU, OU=Digital ID Class 3 - Microsoft Software Validation v2, O=Texas Instruments Inc, L=Austin, S=Texas, C=US';
  EE0C8BA018CE926432C3CC23523A34073D01954A = 'CN=Texas Instruments Incorporated, OU=Digital ID Class 3 - Microsoft Software Validation v2, O=Texas Instruments Incorporated, L=Dallas, S=Texas, C=US';
  FEFF132CF126562676138326AD817697BC5F81D6 = 'CN=Texas Instruments Incorporated, O=Texas Instruments Incorporated, L=Sugar Land, S=Texas, C=US';
}
# foreach($key in $certificates.Keys){ dir Cert:\CurrentUser\TrustedPublisher\ -Recurse | ? thumbprint -match $key | Remove-Item -WhatIf }
$installedCertificates = foreach($key in $certificates.Keys){ Get-ChildItem Cert:\CurrentUser\TrustedPublisher\|Where thumbprint -eq $key }
$nbrNeededCertificates = $certificates.count - $installedCertificates.count
if ($nbrNeededCertificates) {
  $ahkProc = Start-Ahk('chocolateyInstallCertificate.ahk')
}

Install-ChocolateyPackage @packageArgs

# minimum delay to ensure the autohotkey takes efect
& Start-Sleep 1
if (Get-Process -id $ahkProc.Id -ErrorAction SilentlyContinue) {Stop-Process -id $ahkProc.Id}
