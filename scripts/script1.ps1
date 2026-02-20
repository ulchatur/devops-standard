param (
    [string]$LogFilePath
)

. "$PSScriptRoot/common-logging.ps1"
Initialize-Logger -LogFilePath $LogFilePath

Write-Log "Script1 started"
Write-MasterLog "script1.ps1 execution started"

try {
    Write-Log "Calling example API"

    Invoke-WebRequest -Uri "https://example.com" -UseBasicParsing -ErrorAction Stop

    Write-Log "Script1 completed successfully"
    Write-MasterLog "script1.ps1 SUCCESS"
}
catch {
    Write-Log $_.Exception.Message "ERROR"
    Write-MasterLog "script1.ps1 FAILED"
    exit 1
}