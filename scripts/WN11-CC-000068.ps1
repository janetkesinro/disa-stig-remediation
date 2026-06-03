<#
.SYNOPSIS
    This PowerShell script enables delegation of non-exportable credentials for remote hosts.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-06-02
    Last Modified   : 2026-06-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000068
    Documentation   : https://stigaview.com/products/win11/latest/WN11-CC-000068/

.TESTED ON
    Date(s) Tested  : 2026-06-02
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-CC-000068.ps1
#>

# STIG: WN11-CC-000068
# Requirement: Windows 11 must enable remote host delegation of non-exportable credentials.
# Remediation: Set AllowProtectedCreds to 1.

Write-Host "Applying remediation for WN11-CC-000068..."

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"
$valueName = "AllowProtectedCreds"
$valueData = 1

# Create the registry path if it does not exist
New-Item -Path $registryPath -Force | Out-Null

# Remove the existing value if present
Remove-ItemProperty `
    -Path $registryPath `
    -Name $valueName `
    -ErrorAction SilentlyContinue

# Create the required DWORD value
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
