function Initialize-Logger {
    param (
        [string]$LogFilePath
    )

    $Global:LogFile = $LogFilePath
    if (!(Test-Path $LogFile)) {
        New-Item -ItemType File -Path $LogFile -Force | Out-Null
    }
}

function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logLine = "$timestamp [$Level] $Message"

    Write-Host $logLine
    Add-Content -Path $Global:LogFile -Value $logLine
}

function Write-MasterLog {
    param (
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path "logs/master.log" -Value "$timestamp $Message"
}