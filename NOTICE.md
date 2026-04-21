# Third-party notices

## AASTeX journal macros

`aas_macros.sty` is a standalone subset derived from the journal macro definitions in AASTeX 7.0.1, specifically `aastex701.cls` dated May 2025.

AASTeX 7.0.1 is copyright 2025 American Astronomical Society and is distributed under the LaTeX Project Public License, version 1.3c or later.

The upstream AASTeX package is available from CTAN:

- https://ctan.org/pkg/aastex

The LaTeX Project Public License is available from:

- https://www.latex-project.org/lppl.txt

Changes in this repository:

- Extracted only the journal abbreviation macro definitions needed for ADS/SciX-exported BibTeX entries.
- Kept the helper styling macro used by those definitions.
- Added a small number of backward-compatible aliases used by older ADS/AAS macro sets.
- Packaged the subset as `aas_macros.sty` so the UKSRC memo class can resolve journal macros without loading the full AASTeX article class.
