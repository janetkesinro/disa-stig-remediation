<#
.SYNOPSIS
    This PowerShell script limits enhanced diagnostic data for Windows Analytics.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-06-04
    Last Modified   : 2026-06-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000204
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000204/

.TESTED ON
    Date(s) Tested  : 2026-06-04
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-CC-000204.ps1
#>

# STIG: WN11-CC-000204
# Requirement: Enhanced diagnostic data must be limited to the minimum required to support Windows Analytics.
# Remediation: Set LimitEnhancedDiagnosticDataWindowsAnalytics to 1.

Write-Host "Applying remediation for WN11-CC-000204..."

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$valueName = "LimitEnhancedDiagnosticDataWindowsAnalytics"
$valueData = 1

New-Item -Path $registryPath -Force | Out-Null

Remove-ItemProperty `
    -Path $registryPath `
    -Name $valueName `
    -ErrorAction SilentlyContinue

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
