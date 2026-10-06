# GolfBall

A golf ball sorting and handling machine built as a lab project. Balls are fed in, identified by color, and sorted into three storage tubes, with fill levels and sort order shown on an HMI.

## Hardware

- **Controller:** Allen-Bradley CompactLogix 1769-L24ER-QB1B (firmware v36)
- **HMI:** Red Lion CR1000-07000
- **Software:** Studio 5000 Logix Designer

## Program structure

`MainRoutine` calls everything else in scan order:

| Routine | Called | Purpose |
|---|---|---|
| Initialization | Until `PLC_Init_Done` is set | System initialization; same logic as the Power-Up Handler |
| SysMon | Every scan | System monitoring |
| SysCtl | Every scan | System control |
| TubeFill_Indexing | Every scan | Builds the tube capacity/fill-level array |
| Color_Indexing | Every scan | Builds the sorting (color) array |
| TEMPORARYTubeDrops | Every scan | Placeholder, to be replaced by tube emptying and ball shuffling routine(s) |
| Mode_Dispatch | Every scan | Runs the active mode's logic |

Auto is enabled only when the machine is in AUTO mode, initialization is complete, and the run circuit is latched.

The project uses Structured Text wherever practical.

## Status

🚧 In progress

## Notes

- This is a lab machine with a process stop only; it has no E-stop.

## Workflow

The PLC owns all process state and configuration; the HMI only displays it and sends requests.

Studio 5000 and Crimson run on lab computers where Git can't be installed, so a GitHub Codespace was opened to serve as
the Git client. Each session, files pulled from GitHub are verified against the last session's output with SHA-256 hashes
(`GolfBall/tools/hashcheck.ps1`) before work begins. Changes are committed on a branch per issue and merged through PRs.
