﻿$ErrorActionPreference = 'Stop';

$packageName  = 'platonnetwork-mpclib'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'platon-mpclib-windows-x86_64-0.5.0.zip'

$packageArgs = @{
  packageName   = $packageName
  file          = $fileLocation
  destination   = $toolsDir
}

# If the version of Chocolatey is less than 0.10.1, Get-ChocolateyUnzip needs `fileFullPath`.
if ((New-Object System.Version $env:CHOCOLATEY_VERSION) -le (New-Object System.Version '0.10.0')) {
  $packageArgs["fileFullPath"] = $fileLocation
}

Get-ChocolateyUnzip @packageArgs
