# plc-projects

A collection of my PLC programming projects, primarily Allen-Bradley controllers programmed in Studio 5000 Logix Designer.

## Projects

| Project | Controller | Description |
|---|---|---|
| [GolfBall](./GolfBall) | CompactLogix | Golf ball sorting/handling machine |

## Repository layout

Each project lives in its own folder:

```
ProjectName/
├── README.md                # Machine overview, how PLC and HMI fit together
├── PLC/
│   ├── README.md            # What it does, I/O list, notes
│   ├── ProjectName.ACD      # Native Studio 5000 project file (source of truth)
│   ├── ProjectName.L5K      # Text export of the full project, used for diffs
│   └── ProjectName.L5X      # XML export; components portable into other projects
├── HMI/
│   ├── README.md            # Platform and software version, screen list, navigation, alarms
│   ├── ProjectName.<proj>   # Native HMI project or archive (source of truth)
│   ├── ProjectName.<rt>     # Compiled runtime file, if the platform uses one
│   └── exports/             # Text exports (tags, alarms, displays) where supported
└── docs/                    # Wiring diagrams, screenshots, manuals
```

## File formats

### PLC (Allen-Bradley)

| File | Purpose |
|------|---------|
| `.ACD` | The controller db binary. Open this in Studio 5000 to edit or download. |
| `.L5K` | Plain-text export of the whole project. More easily read, and diffs clearer. |
| `.L5X` | XML export. Individual routines, AOIs, and UDTs can be imported from it into other projects. |

The `.L5K` and `.L5X` are regenerated from the `.ACD` before every commit. If they get out of date, the `.ACD` is always authoritative.

### HMI

HMI file types depend on the platform. `<proj>` and `<rt>` in the layout above map to:

| Platform | Software | Project file | Runtime file | Exports |
|----------|----------|--------------|--------------|---------|
| PanelView Plus | FactoryTalk View ME | `.apa` (archive) | `.mer` | Displays (XML), tags (CSV), alarms (XML) |
| Red Lion | Crimson 3.x | `.cd3` / `.cd31` | none (downloaded directly) | Tags (CSV) |

As with the PLC, exports are regenerated before every commit, and the project file is always authoritative.
## Tools

- Studio 5000 Logix Designer
- Allen-Bradley CompactLogix / ControlLogix
