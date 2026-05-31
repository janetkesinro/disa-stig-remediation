<#
.SYNOPSIS
    This PowerShell script configures the Windows 11 account lockout duration to 15 minutes.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-05-30
    Last Modified   : 2026-05-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000005
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000005/

.TESTED ON
    Date(s) Tested  : 2026-05-30
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-AC-000005.ps1
#>

# STIG: WN11-AC-000005
# Requirement: Account lockout duration must be configured to 15 minutes or greater.
# Remediation: Set account lockout duration to 15 minutes.

Write-Host "Applying remediation for WN11-AC-000005..."

net accounts /lockoutduration:15

gpupdate /force

Write-Host ""
Write-Host "Remediation complete."
Write-Host "Current account lockout policy:"
net accounts
