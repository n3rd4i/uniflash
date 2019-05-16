$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://software-dl.ti.com/ccs/esd/uniflash/uniflash_sl.5.0.0.2289.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  softwareName  = 'uniflash*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '7FCE502D807C9859E64A715E29648E97'
  checksumType  = 'md5' #default is md5, can also be sha1, sha256 or sha512
  # silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  silentArgs    = "--unattendedmodeui minimal --mode unattended" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
