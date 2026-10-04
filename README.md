# Windows Battery Report Helper

Two small PowerShell helpers for generating built-in Windows battery diagnostics without remembering the full `powercfg` commands.

- `Generate-BatteryReport.ps1` creates a battery capacity and usage report.
- `Generate-SleepStudyReport.ps1` creates a Modern Standby activity report on supported PCs.

Both reports are generated locally. The scripts do not upload or transmit your data.

## Requirements

- Windows 10 or Windows 11
- Windows PowerShell 5.1 or PowerShell 7+
- A laptop or other Windows device that reports battery information
- Modern Standby (S0 Low Power Idle) support for SleepStudy

## Generate a Windows battery report

1. Download `Generate-BatteryReport.ps1`.
2. Open PowerShell in the downloaded file's folder.
3. Run:

```powershell
.\Generate-BatteryReport.ps1
```

The default output is `battery-report.html` on your Desktop. To generate and immediately open the report:

```powershell
.\Generate-BatteryReport.ps1 -OpenReport
```

To choose a different location:

```powershell
.\Generate-BatteryReport.ps1 -OutputPath "C:\Reports\battery-report.html"
```

If PowerShell blocks the script, you can use Windows' command directly instead:

```powershell
powercfg /batteryreport /output "$env:USERPROFILE\Desktop\battery-report.html"
```

## Diagnose Modern Standby drain with SleepStudy

On a PC that supports `Standby (S0 Low Power Idle)`, run:

```powershell
.\Generate-SleepStudyReport.ps1 -Duration 7 -OpenReport
```

The script checks Modern Standby support and creates `sleepstudy-report.html` on the Desktop. SleepStudy focuses on screen-off and standby behavior; it does not measure battery wear.

For session summaries, energy change, DRIPS residency, top offenders, and controlled testing, read the [complete Windows SleepStudy report guide](https://batteryhealthlab.com/guides/windows-sleepstudy-report-battery-drain.html). For capacity and cycle information, use the battery-report helper above.

## Understand battery report results

The most useful values are:

- **Design capacity:** the battery's original rated capacity.
- **Full charge capacity:** the maximum charge currently reported by the battery.
- **Cycle count:** the number of complete charge cycles, when the manufacturer reports it.

For a simpler summary, open the free [Battery Health Lab analyzer](https://batteryhealthlab.com/) and select the generated HTML report. Analysis runs in your browser, and the report stays on your device.

## Privacy

These scripts only call the built-in Windows `powercfg` utility and write HTML files to locations you choose. Review scripts before running them, especially when downloaded from the internet.

## License

Released under the MIT License.
