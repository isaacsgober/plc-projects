# GolfBall — PLC

**Controller:** CompactLogix 5370, 1769-L24ER-QB1B

**Software:** Studio 5000 Logix Designer v36

## Overview
This program controls a programming lab machine designed to sort golfballs of 4 distinct colors into 3 separate vertical tubes. The goal is to have separate, configurable control of which color is sorted into which tube. Additionally, there should be the ability to shuffle the balls as evenly as possible upon release.

## Program structure
| Program / Routine | Purpose |
|-------------------|---------|
| MainProgram / MainRoutine   | Sequences subroutines |
| Initialize / Initialization | Power-Up Handler; Inits machine state |

## Notes
- Currently no subroutine has been created for releasing/shuffling balls
