<#
.SYNOPSIS
    This PowerShell script configures Kernel DMA Protection to block external devices that are incompatible with Kernel DMA Protection.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-06-01
    Last Modified   : 2026-06-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-EP-000310/

.TESTED ON
    Date(s) Tested  : 2026-06-01
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-EP-000310.ps1
#>

# STIG: WN11-EP-000310
# Requirement: Windows 11 Kernel DMA Protection must be enabled.
# Remediation: Set DeviceEnumerationPolicy to 0, which configures the policy to Block All.

Write-Host "Applying remediation for WN11-EP-000310..."

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"
$valueName = "DeviceEnumerationPolicy"
$valueData = 0

# Create the registry path if it does not exist
New-Item -Path $registryPath -Force | Out-Null

# Create or update the DWORD value
New-ItemProperty `
    -Path $registryPath `
    -Name $valueName `
    -PropertyType DWord `
    -Value $valueData `
    -Force | Out-Null

Write-Host ""
Write-Host "Remediation complete."
Write-Host "Verification result:"

Get-ItemProperty -Path $registryPath -Name $valueName
