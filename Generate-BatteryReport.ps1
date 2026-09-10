[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path ([Environment]::GetFolderPath('Desktop')) 'battery-report.html'),
    [switch]$OpenReport
)

$powerCfg = Get-Command 'powercfg.exe' -ErrorAction SilentlyContinue

if (-not $powerCfg) {
    Write-Error 'powercfg.exe was not found. This helper requires Windows 10 or Windows 11.'
    exit 1
}

try {
    $outputDirectory = Split-Path -Parent $OutputPath

    if (-not (Test-Path -LiteralPath $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
    }

    & $powerCfg.Source /batteryreport /output $OutputPath | Out-Null

    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $OutputPath)) {
        throw 'Windows could not generate the battery report.'
    }

    $resolvedReport = (Resolve-Path -LiteralPath $OutputPath).Path
    Write-Host "Battery report created: $resolvedReport" -ForegroundColor Green
    Write-Host 'You can review the HTML file yourself or upload it to Battery Health Lab for a simpler health summary.'

    if ($OpenReport) {
        Start-Process -FilePath $resolvedReport
    }
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
