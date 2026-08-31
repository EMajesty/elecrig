# Elecrig

**Open modular mounting hardware for music gear.**

Elecrig is an open hardware ecosystem for building pedalboards, synth rigs,
controllers, power systems, cable management, I/O panels, tiers, stands, cases,
and other music-hardware assemblies from standard metric 20-series T-slot
aluminium extrusion.

The first mechanical interface is **Elecrig Rail 80 (ER80)**: a rail system
built around 20-series extrusion and an 80 mm rail centre-to-centre pitch.

> Status: early development / pre-v1.0. Dimensions and interfaces may change
> until the first stable specification is released.

## Goals

Elecrig aims to make it easy to:

- build boards and rigs in arbitrary sizes;
- attach devices positively without permanent adhesive where possible;
- reuse standard extrusion and M5 hardware;
- design compatible accessories without reverse-engineering a reference build;
- share pedal/device adapters and other modules as community-maintained parts;
- manufacture and sell compatible hardware while keeping improvements to
  covered Elecrig hardware source open under the project's licence.

## Repository layout

```text
spec/              Normative Elecrig mechanical specifications
cad/interfaces/    Canonical interface geometry / skeleton models
cad/templates/     Starter models for new compatible parts
reference-builds/  Complete example assemblies
adapters/          Device-specific mounts
accessories/       Cable, power, I/O, tier, stand, case, etc. components
docs/              Guides, photos and explanatory documentation
software/          Optional generators/tools/scripts
LICENSES/          Licence texts
```

## Elecrig Rail 80

The current prototype uses:

- metric 20-series T-slot extrusion;
- 2040 rails laid flat in the reference pedalboard;
- 80 mm rail centre-to-centre spacing;
- M5 fasteners and T-slot / hammer nuts.

These dimensions are **provisional** until `spec/ER80.md` reaches v1.0.

The specification defines compatibility. Reference builds are examples, not
requirements.

## Designing something compatible

Start from the interface geometry or a template in `cad/`.

A compatible part should document:

- the Elecrig specification/version it targets;
- how many rails it spans;
- required hardware;
- print/manufacturing assumptions;
- whether physical fit has been verified;
- known device compatibility where applicable.

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Licensing

Elecrig is open hardware.

- Hardware designs, CAD, drawings, mechanical specifications, adapters,
  accessories and reference builds: **CERN Open Hardware Licence Version 2 –
  Weakly Reciprocal (`CERN-OHL-2.0-W`)**.
- General prose documentation and illustrations in `docs/`:
  **CC BY-SA 4.0**.
- Software in `software/`: **MIT** unless stated otherwise.

See [LICENSE.md](LICENSE.md) and `LICENSES/`.

The canonical CERN OHL v2 texts are published by CERN:
https://cern-ohl.web.cern.ch/

## Compatibility and naming

Until a formal trademark policy exists, please use **Elecrig-compatible** to
describe third-party parts that conform to a published Elecrig specification.
Do not imply that a third-party product is an official Elecrig project release.

## Project links

Project site: 

CAD workspace: 

Printable releases: 

## Contributing

Contributions are welcome: new adapters, accessories, reference builds,
specification feedback, documentation and compatibility testing.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.
