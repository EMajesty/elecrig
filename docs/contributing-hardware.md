# Contributing hardware

## Before you start

1. Read the specification your part targets.
2. Start from `cad/interfaces/` or `cad/templates/` where practical.
3. Avoid inventing new standard dimensions when an existing interface works.
4. Keep the Elecrig rail interface separate from device-specific geometry where
   practical.

## What to include

For a new hardware contribution, include:

- STEP
- editable/native CAD when redistribution permits it
- 3MF and/or STL for printable parts
- a short README
- required fasteners
- target Elecrig specification/version
- physical verification status

Please do not submit STL as the only source for a newly designed part.

## Suggested component metadata

```text
Manufacturer:
Device / family:
Tested models:
Elecrig interface:
Specification version:
Rail span:
Required hardware:
OEM screws reused:
Manufacturing method:
Physical fit verified: yes/no
Author:
```

## Design guidance

- Reference canonical Elecrig datums rather than copying geometry from another
  accessory.
- Separate interface dimensions from dimensions used only by your part.
- Prefer ordinary metric hardware and common materials.
- Label experimental extensions clearly.
- Do not silently redefine a published interface.

## Adapters

Where possible, attach adapters using the device's existing bottom-cover screws. This avoids modifying the device and makes the mount easy to remove.

Rubber feet may be removed when they interfere with the adapter. Keep the original hardware so the device can be returned to its original configuration.

Avoid permanent modifications to the device where a reversible mounting method will work.

### Device adapter rail mounting

For devices spanning multiple rails, two mounting positions are available on each side:

| Rail span | Outer positions | Inner positions |
| --- | ---: | ---: |
| 2 rails | 100 mm apart | 60 mm apart |
| 3 rails | 180 mm apart | 140 mm apart |

Where practical, device adapters should use the **outer positions on the left** and the **inner positions on the right**.

This asymmetric layout reduces the space needed between neighboring devices.

This is a recommended convention, not a compatibility requirement. Other mounting arrangements may be used when better suited to the device or adapter.

## Pull requests

Keep pull requests focused.

Please mention:

- what the contribution does
- which specification/version it targets
- whether it has been manufactured/tested
- known compatibility limitations

Photos of physically tested parts are encouraged.
