param (
    [string]$LogFilePath
)

. "$PSScriptRoot/common-logging.ps1"
Initialize-Logger -LogFilePath $LogFilePath

Write-Log "Script2 started"
Write-MasterLog "script2.ps1 execution started"

try {
    Write-Log "Performing sample calculation"

    $result = 10 / 2
    Write-Log "Result: $result"

    Write-Log "Script2 completed successfully"
    Write-MasterLog "script2.ps1 SUCCESS"
}
catch {
    Write-Log $_.Exception.Message "ERROR"
    Write-MasterLog "script2.ps1 FAILED"
    exit 1
}