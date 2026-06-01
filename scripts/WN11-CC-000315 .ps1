<#
.SYNOPSIS
    This PowerShell script disables the Windows Installer policy "Always install with elevated privileges".

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-05-31
    Last Modified   : 2026-05-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 2026-05-31
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1
#>

# STIG: WN11-CC-000315
# Requirement: The Windows Installer feature "Always install with elevated privileges" must be disabled.
# Remediation: Set AlwaysInstallElevated to 0 in both HKLM and HKCU.

Write-Host "Applying remediation for WN11-CC-000315..."

$registryPaths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"
)

$valueName = "AlwaysInstallElevated"
$valueData = 0

foreach ($registryPath in $registryPaths) {

    if (-not (Test-Path $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    New-ItemProperty `
        -Path $registryPath `
        -Name $valueName `
        -PropertyType DWord `
        -Value $valueData `
        -Force | Out-Null
}

gpupdate /force

Write-Host ""
Write-Host "Remediation complete."
Write-Host "Verification results:"

Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated"
Get-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated"
