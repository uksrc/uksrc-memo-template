# UKSRC Memo Authoring Guide

Key files:

- [uksrc-memo.cls](uksrc-memo.cls): the reusable UKSRC memo class
- [uksrc-memo-template.tex](uksrc-memo-template.tex): the lean starter file for new memos
- [uksrc-memo-example.tex](uksrc-memo-example.tex): a fuller example showing optional features

## Quick Start

1. Copy [uksrc-memo-template.tex](uksrc-memo-template.tex) to a memo-specific filename if you want to keep the starter untouched.
2. Update the `\SetMemoMetadata{...}` block near the top of the file.
3. Replace the placeholder sections with your memo content.
4. If the memo cites literature, uncomment the bibliography lines near the end of the starter file and add references to [uksrc-memo-template.bib](uksrc-memo-template.bib) or switch to a memo-specific `.bib` file.
5. Build with `latexmk -pdf <your-file>.tex`.

## What To Edit In The Starter

In [uksrc-memo-template.tex](uksrc-memo-template.tex), most authors only need to edit:

- the values inside `\SetMemoMetadata{...}`
- the revision history rows added with `\AddDocumentRevision`
- the optional approval rows added with `\AddAuthorApproval`, if approval tracking is enabled
- the memo body after `\begin{document}`

## What Usually Stays Unchanged

Most authors should leave these untouched unless they are maintaining the template itself:

- page layout, colours, and footer logic in [uksrc-memo.cls](uksrc-memo.cls)
- title-page layout in [uksrc-memo.cls](uksrc-memo.cls)
- the helper macro definitions for approval/history tables in [uksrc-memo.cls](uksrc-memo.cls)
- the underlying metadata macros in [uksrc-memo.cls](uksrc-memo.cls)

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

### Use BibTeX

The example file uses this default setup, and you can uncomment the same lines in the starter when needed:

```tex
\bibliographystyle{plainnat}
\bibliography{uksrc-memo-template}
```

Common ADS/SciX journal macros such as `\nat`, `\apj`, `\mnras`, and `\aap` are provided by [aas_macros.sty](aas_macros.sty), a small AASTeX-derived macro subset loaded by the class.

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

## Choosing Between The Two `.tex` Files

- Use [uksrc-memo-template.tex](uksrc-memo-template.tex) when you want the cleanest possible starting point.
- Use [uksrc-memo-example.tex](uksrc-memo-example.tex) when you want a reminder of the richer features available in the class.
