<#
.SYNOPSIS
    This PowerShell script enables auditing for Object Access - Other Object Access Events successes.

.NOTES
    Author          : Janet Kesinro
    LinkedIn        : linkedin.com/in/janetkesinro/
    GitHub          : github.com/janetkesinro
    Date Created    : 2026-06-02
    Last Modified   : 2026-06-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000083
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000083/

.TESTED ON
    Date(s) Tested  : 2026-06-02
    Tested By       : Janet Kesinro
    Systems Tested  : Windows 11 Virtual Machine
    PowerShell Ver. : Native PowerShell on Windows 11

.USAGE
    Run this script as Administrator.

    Example syntax:
    PS C:\> .\WN11-AU-000083.ps1
#>

# STIG: WN11-AU-000083
# Requirement: Windows 11 must be configured to audit Object Access - Other Object Access Events successes.
# Remediation: Enable Success auditing and disable Failure auditing for Other Object Access Events.

Write-Host "Applying remediation for WN11-AU-000083..."

auditpol /set /subcategory:"Other Object Access Events" /success:enable /failure:disable

Write-Host ""
Write-Host "Remediation complete."
Write-Host "Verification result:"

auditpol /get /subcategory:"Other Object Access Events"
