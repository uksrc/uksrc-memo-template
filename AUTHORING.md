# UKSRC Memo Authoring Guide

## What To Edit In The Starter

In [uksrc-memo-template.tex](uksrc-memo-template.tex), most authors only need to edit:

- the values inside `\SetMemoMetadata{...}`
- the revision history rows added with `\AddDocumentRevision`
- the optional approval rows added with `\AddAuthorApproval`, if approval tracking is enabled
- the memo body after `\begin{document}`


## References and BibTeX

The example file uses BibTeX by default, and the starter file includes the same lines commented out until you need citations:

- bibliography database: `uksrc-memo-template.bib`
- bibliography style: `plainnat`

Common ADS/SciX journal macros such as `\nat`, `\apj`, `\mnras`, and `\aap` are provided by `aas_macros.sty`, a small AASTeX-derived macro subset loaded by the class, so exported BibTeX entries should usually work without modification.

If a less common journal macro appears and the build fails with an undefined control sequence:

- simplest fix: replace the macro in the `.bib` file with plain journal text, e.g. `journal = {Nature}`
- reusable fix: add a matching macro definition to `aas_macros.sty`, e.g. `\newcommand\foojournal{\ref@jnl{Foo Journal}}`

## Metadata Conventions

- Recommended status values are `Draft`, `In Review`, `Approved`, and `Superseded`.
- Keep `Revision` and `Status` as separate concepts:
  `Revision` describes document evolution, while `Status` describes lifecycle stage.
- Use `Tags` for lightweight traceability and search, for example `validation, EoR, \JiraTag{SE-397}`.
- Use display dates in the form `07 April 2026`.
- Use `\IssueDate` as the memo's source-of-truth issue date.
- For memo drafts, `\today` is usually a sensible default for `\IssueDate`.
- If you need a fixed issued-on date, set `\IssueDate` manually and keep `\DocumentDate` linked to it.
- `contact` is optional. If you omit it, no contact row is printed.

Example:

```tex
\SetMemoMetadata{
  title={Short Memo Title},
  id={UKSRC-MEMO-0001},
  revision={0.1},
  status={Draft},
  tags={validation, EoR, \JiraTag{SE-397}},
  classification={Unrestricted},
  authors={First Author, Second Author},
  footer-authors={First Author, Second Author},
  % Optional:
  % contact={First Author (email@example.com)},
  % Choose one:
  % issue-date={07 April 2026},
  issue-date={\today},
  summary={Replace this with a concise executive summary.}
}
```

Supported keys include `title`, `id`, `type`, `revision`, `status`, `tags`,
`classification`, `authors`, `footer-authors`, `contact`, `lead-author`,
`issue-date`, `date`, and `summary`.

Use `authors` for the full front-page author list. Use `footer-authors` when
the footer should be shorter, for example `First Author et al.` for three or
more authors. If `footer-authors` is omitted, the footer uses the full
`authors` value.

The logo normally comes from the class default. Only override it if needed:

```tex
\setuksrclogo{path/to/logo.png}
```

Typical revision conventions:

- `0.x` for draft or pre-approval versions
- `1.0` for the first approved baseline
- `1.x` for minor approved updates
- `2.0+` for major revisions

## Common Recipes

### Add More Approval Rows

The approval/signature table is hidden by default. To include it, uncomment or add the approval block:

```tex
\ShowAuthorApprovals
\ResetAuthorApprovals
\AddAuthorApprovalSection{Authored by}
\AddAuthorApproval{First Author}{Lead Author}{UKSRC}{}
\AddAuthorApprovalSection{Approved and released by}
\AddAuthorApproval{Reviewer Name}{Reviewer}{Organisation}{}
```

Use another `\AddAuthorApproval{name}{designation}{affiliation}{signature/date}` line for each additional row. Use `\HideAuthorApprovals` if you want to suppress the section again.

### Add Revision History

Use another `\AddDocumentRevision{revision}{date}{comment}` line.

### Add A Separate Document Information Table

This is an advanced option. In most memos it is unnecessary because the front
page already shows the key controlled-document metadata clearly.

Populate the rows before `\begin{document}`:

```tex
\ResetDocumentInfoRows
\AddDocumentInfoItem{Document ID}{\DocumentID}
\AddDocumentInfoItem{Document type}{\DocumentType}
\AddDocumentInfoItem{Revision}{\DocumentRevision}
\AddDocumentInfoItem{Classification}{\DocumentClassification}
\AddDocumentInfoItem{Status}{\DocumentStatus}
\AddDocumentInfoItem{Tags}{\DocumentTags}
\AddDocumentInfoItem{Date}{\DocumentDate}
```

Then insert this after `\uksrcstandardfrontmatter` or elsewhere in the document:

```tex
\section*{Document information}
\DocumentInfoTable
```

### Add A List Of Abbreviations

Populate the list before `\begin{document}`:

```tex
\ResetAbbreviations
\AddAbbreviation{UKSRC}{United Kingdom SKA Regional Centre}
\AddAbbreviation{SKAO}{Square Kilometre Array Observatory}
```

Then insert:

```tex
\uksrclistofabbreviations
```

### Add A Clickable Jira Tag

Use the helper:

```tex
\renewcommand{\DocumentTags}{validation, EoR, \JiraTag{SE-397}}
```

This renders as `jira:SE-397` while linking to the matching UKSRC Jira ticket.

## Optional Sections

If relevant, authors may consider adding the following sections:

- options considered
- decision or recommendation
- risks and limitations

