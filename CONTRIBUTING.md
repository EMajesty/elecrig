# Contributing to Elecrig

Elecrig is intended to be an ecosystem, not a catalog maintained by one person.
Contributions that make the interfaces easier to use, test, manufacture or
extend are especially valuable.

## Before designing a part

1. Read the specification your part targets, currently `spec/ER80.md`.
2. Start from a file in `cad/interfaces/` or `cad/templates/` where practical.
3. Avoid adding new "standard" dimensions when an existing interface can solve
   the problem.
4. Keep the rail interface independent from the device-specific attachment
   method whenever practical.

## What to submit

For hardware contributions, include:

- editable/native CAD when redistribution permits it;
- STEP as the preferred neutral CAD exchange format;
- 3MF and/or STL when the part is intended for printing;
- a short README describing purpose and compatibility;
- required fasteners;
- target Elecrig specification/version;
- physical verification status.

Do not submit an STL as the only source for a newly designed part.

## Suggested adapter metadata

```text
Manufacturer:
Device / family:
Tested models:
Elecrig interface:
Rail span:
Required hardware:
OEM screws reused:
Manufacturing method:
Physical fit verified: yes/no
Author:
```

## Design rules

- Reference the canonical Elecrig datums rather than copying measured geometry
  from another accessory.
- Clearly separate normative interface dimensions from convenient dimensions
  used only by your part.
- Prefer ordinary metric hardware and commercially common materials.
- Do not silently change a published interface.
- Experimental extensions are welcome, but label them experimental.

## Specification changes

Changes to a stable Elecrig interface require more scrutiny than a new
accessory because they can break community hardware.

For proposed specification changes:

1. Open an issue describing the problem.
2. Include the hardware/use cases that cannot be solved cleanly today.
3. Provide drawings or test geometry where useful.
4. Prefer additive/backward-compatible changes.
5. Do not describe an experimental interface as part of the stable standard
   until it has been merged and released.

## Pull requests

Keep pull requests focused. In the description state:

- what the contribution does;
- which specification/version it targets;
- whether it has been manufactured/tested;
- any known compatibility limitations.

Photos of physically tested hardware are strongly encouraged but not required.

## Licensing of contributions

By contributing covered hardware source to this repository, you agree to
license that contribution under **CERN-OHL-2.0-W**.

Contributions under `docs/` are licensed under **CC BY-SA 4.0**.

Contributions under `software/` are licensed under the **MIT License**, unless
the file or subproject clearly declares another compatible licence.

Only submit work you have the right to contribute. Do not upload proprietary
manufacturer CAD unless its licence explicitly permits redistribution.

## Attribution

Preserve copyright, authorship and licence notices. Contributors are encouraged
to add themselves to the relevant component README rather than adding
promotional markings to compatibility geometry.
