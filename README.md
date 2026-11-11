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

### If the command fails

If `powercfg` returns an error such as `0x422`, "not recognized as the name of a cmdlet" or "Invalid Parameters", see [Windows battery report error messages and fixes](https://batteryhealthlab.com/guides/windows-11-battery-report-not-working.html#error-messages). On Windows 10, the [Windows 10 battery report guide](https://batteryhealthlab.com/guides/battery-report-windows-10.html) covers the Win + X route and the Command Prompt vs PowerShell syntax.

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

To understand a specific result, read [Is 80% battery health good for a laptop?](https://batteryhealthlab.com/guides/is-80-percent-battery-health-good.html). Dell, HP and Lenovo laptops also include their own battery tests; see [how to check battery health on Dell, HP and Lenovo](https://batteryhealthlab.com/guides/check-battery-health-dell-hp-lenovo.html).

## Free calculators and real battery data

Once you have a battery report, these free browser tools answer the next question. They run locally and don't upload anything:

- [Battery life calculator](https://batteryhealthlab.com/tools/laptop-battery-runtime-calculator.html): estimate runtime from capacity and the power draw shown in the report's Battery usage section.
- [mAh to Wh converter](https://batteryhealthlab.com/tools/mah-to-wh-converter.html): compare a replacement battery with your design capacity and check the 100 Wh airline limit.
- [Charger wattage checker](https://batteryhealthlab.com/tools/laptop-charger-wattage-checker.html): see whether a charger can keep up with your laptop or will let it drain while plugged in.

All tools are listed on the [Battery Health Lab tools page](https://batteryhealthlab.com/tools/). To compare your numbers with real laptops, see the [real laptop battery report data](https://batteryhealthlab.com/data/real-laptop-battery-reports.html) from four Windows laptops (CSV, CC BY 4.0).

## Privacy

These scripts only call the built-in Windows `powercfg` utility and write HTML files to locations you choose. Review scripts before running them, especially when downloaded from the internet.

## License

Released under the MIT License.
