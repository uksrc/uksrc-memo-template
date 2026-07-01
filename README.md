# UKSRC memo template

A LaTeX template for UKSRC technical memos.

## Overview

This repository provides a reusable UKSRC memo class together with two entry points:

- [uksrc-memo-template.tex](uksrc-memo-template.tex) designed to serve as a more minimal jumping-off point;
- [uksrc-memo-example.tex](uksrc-memo-example.tex) is an expanded version of `uksrc-memo-template.tex` illustrating additional optional features of the memo class.

## Start a memo

You can start a new memo directly in Overleaf or from a local clone of this repository.

### Use in Overleaf

You can create a new Overleaf project from this template using one of the links below:

- [Open the example memo in Overleaf](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fuksrc%2Fuksrc-memo-template%2Farchive%2Frefs%2Ftags%2Fuksrc-memo-template-v0.1.0.zip&main_document=uksrc-memo-example.tex&engine=pdflatex)
- [Open the blank memo template in Overleaf](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgithub.com%2Fuksrc%2Fuksrc-memo-template%2Farchive%2Frefs%2Ftags%2Fuksrc-memo-template-v0.1.0.zip&main_document=uksrc-memo-template.tex&engine=pdflatex)

These links create a new Overleaf project from the public `uksrc-memo-template-v0.1.0` GitHub release. You can then edit the files in Overleaf and save your own copy.

### Work locally

1. Clone the repository.
2. Start from [uksrc-memo-template.tex](uksrc-memo-template.tex).
3. Update the placeholders with your memo content.
4. If the memo cites literature, uncomment the bibliography lines near the end of the starter file and add references to [uksrc-memo-template.bib](uksrc-memo-template.bib) or switch to a memo-specific `.bib` file.
5. Build with `latexmk -pdf uksrc-memo-template.tex`.

See [AUTHORING.md](AUTHORING.md) for additional file guidance.

## Key files

- [uksrc-memo.cls](uksrc-memo.cls) — memo class (page layout, colours, footer logic, macros)
- [uksrc-memo-template.tex](uksrc-memo-template.tex) — starter file for new memos
- [uksrc-memo-example.tex](uksrc-memo-example.tex) — fuller example starter file showing optional features
- [uksrc-memo-template.bib](uksrc-memo-template.bib) — example bibliography
- [aas_macros.sty](aas_macros.sty) — ADS/SciX journal macro support
- [LICENSE](LICENSE) — LaTeX Project Public License, version 1.3c
- [NOTICE.md](NOTICE.md) — third-party notice for the bundled AASTeX-derived journal macros
- [AUTHORING.md](AUTHORING.md) — quick author guide and common recipes

## Building locally

Typical local builds:

- `latexmk -pdf uksrc-memo-template.tex`
- `latexmk -pdf uksrc-memo-example.tex`

## Acknowledgements

References that aided in the production of this template include:
 - an example SDP memo helpfully provided by B. Nikolic (structure);
 - the UKSRC-SE roadmap template developed by J. Radcliffe (colour scheme and branding).

## Contributing

Contributions that improve the template, examples, or documentation are very welcome. Please make such contributions in the form of an issue and/or pull request.

<!-- Branch protection rules are in place on the main branch to:
 - Require pull request reviews before merging -->

<!-- For any additional questions or comments, please contact one of the UKSRC science validation tooling team:

Peter Sims (PO) - ps550 [at] cam.ac.uk
Tianyue Chen (SM) - tianyue.chen [at] manchester.ac.uk
Quentin Gueuning - qdg20 [at] cam.ac.uk
Ed Polehampton - edward.polehampton [at] stfc.ac.uk
Vlad Stolyarov - vs237 [at] cam.ac.uk -->
