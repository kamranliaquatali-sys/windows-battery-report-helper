# Windows Battery Report Helper

A small PowerShell helper for generating the built-in Windows battery report without remembering the full `powercfg` command.

The report is generated locally on your computer. The script does not upload or transmit the report anywhere.

## Requirements

- Windows 10 or Windows 11
- Windows PowerShell 5.1 or PowerShell 7+
- A laptop or other Windows device that reports battery information

## Usage

1. Download `Generate-BatteryReport.ps1`.
2. Open PowerShell in the downloaded file's folder.
3. Run:

```powershell
.\Generate-BatteryReport.ps1
```

The default output is `battery-report.html` on your Desktop.

To generate and immediately open the report:

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

## Understanding the results

The most useful values are:

- **Design capacity:** the battery's original rated capacity.
- **Full charge capacity:** the maximum charge currently reported by the battery.
- **Cycle count:** the number of complete charge cycles, when the manufacturer reports it.

For a simpler summary, open the free [Battery Health Lab](https://batteryhealthlab.com/) analyzer and select the generated HTML report. Analysis runs in your browser, and the report stays on your device.

## Privacy

This script only calls the built-in Windows `powercfg` utility and writes an HTML file to the location you choose. Review scripts before running them, especially when downloaded from the internet.

## License

Released under the MIT License.
