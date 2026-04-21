# UKSRC memo template

Files:

- [uksrc-memo.cls](uksrc-memo.cls) — self-contained UKSRC memo class
- [uksrc-memo-template.tex](uksrc-memo-template.tex) — lean starter file for new memos
- [uksrc-memo-example.tex](uksrc-memo-example.tex) — fuller example showing optional features
- [uksrc-memo-template.bib](uksrc-memo-template.bib) — example bibliography
- [aas_macros.sty](aas_macros.sty) — ADS/SciX journal macro support
- [LICENSE](LICENSE) — LaTeX Project Public License, version 1.3c
- [NOTICE.md](NOTICE.md) — third-party notice for the bundled AASTeX-derived journal macros
- [AUTHORING.md](AUTHORING.md) — quick author guide and common recipes

## Which file should I start from?

- Start from [uksrc-memo-template.tex](uksrc-memo-template.tex) if you want the simplest authoring experience.
- Open [uksrc-memo-example.tex](uksrc-memo-example.tex) if you want to see the richer front-matter, allowed status guidance, and optional patterns in one place.
- Read [AUTHORING.md](AUTHORING.md) for the recommended workflow and common edits.
- Both `.tex` files use a single `\SetMemoMetadata{...}` block for the top-level document fields.

## References

The example file uses BibTeX by default, and the starter file includes the same lines commented out until you need citations:

- bibliography database: `uksrc-memo-template.bib`
- bibliography style: `plainnat`

Common ADS/SciX journal macros such as `\nat`, `\apj`, `\mnras`, and `\aap` are provided by `aas_macros.sty`, a small AASTeX-derived macro subset loaded by the class, so exported BibTeX entries should usually work without modification.

If a less common journal macro appears and the build fails with an undefined control sequence:

- simplest fix: replace the macro in the `.bib` file with plain journal text, e.g. `journal = {Nature}`
- reusable fix: add a matching macro definition to `aas_macros.sty`, e.g. `\newcommand\foojournal{\ref@jnl{Foo Journal}}`

## Building locally

Typical local builds:

- `latexmk -pdf uksrc-memo-template.tex`
- `latexmk -pdf uksrc-memo-example.tex`

## Acknowledgements

References that aided in the production of this template include:
 - an example SDP memo helpfully provided by B. Nikolic (structure);
 - the UKSRC-SE roadmap template developed by J. Radcliffe (colour scheme and branding).
