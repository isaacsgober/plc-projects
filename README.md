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
├── README.md        # What it does, I/O list, notes
├── ProjectName.L5X  # Exported project (diffable XML)
├── ProjectName.ACD  # Native Studio 5000 project file
└── docs/            # Wiring diagrams, screenshots, HMI files, etc.
```

## Tools

- Studio 5000 Logix Designer
- Allen-Bradley CompactLogix / ControlLogix
