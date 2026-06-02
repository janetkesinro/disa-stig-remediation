<#
.SYNOPSIS
    This PowerShell script enables the Windows Hello for Business hardware security device requirement.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-06-02
    Last Modified   : 2026-06-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000255
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000255/

.TESTED ON
    Date(s) Tested  : 2026-06-02
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-CC-000255.ps1
#>

# STIG: WN11-CC-000255
# Requirement: The use of a hardware security device with Windows Hello for Business must be enabled.
# Remediation: Set RequireSecurityDevice to 1.

Write-Host "Applying remediation for WN11-CC-000255..."

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork"
$valueName = "RequireSecurityDevice"
$valueData = 1

New-Item -Path $registryPath -Force | Out-Null

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
