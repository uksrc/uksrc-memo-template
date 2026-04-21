\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uksrc-memo}[2026/03/19 UKSRC memo class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\PassOptionsToClass{11pt}{article}
\PassOptionsToClass{a4paper}{article}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{etoolbox}
\RequirePackage{keyval}
\RequirePackage{lmodern}
\RequirePackage[margin=25mm,bottom=30mm,includeheadfoot,footskip=18mm]{geometry}
\RequirePackage[english]{babel}
\RequirePackage[table]{xcolor}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{graphicx}
\RequirePackage{mdwlist}
\RequirePackage{url}
\RequirePackage{natbib}
\RequirePackage{eurosym}
\RequirePackage{xspace}
\RequirePackage[small,labelfont=bf,margin=0.5cm]{caption}
\RequirePackage{tabularx}
\RequirePackage{longtable}

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}

% Support common journal macros used in ADS-exported BibTeX entries.
\IfFileExists{aas_macros.sty}{%
  \RequirePackage{aas_macros}%
}{%
  \providecommand{\aap}{A\&A}
  \providecommand{\aapr}{A\&A Review}
  \providecommand{\aaps}{A\&AS}
  \providecommand{\aj}{AJ}
  \providecommand{\apj}{ApJ}
  \providecommand{\apjl}{ApJL}
  \providecommand{\apjs}{ApJS}
  \providecommand{\araa}{ARA\&A}
  \providecommand{\mnras}{MNRAS}
  \providecommand{\nat}{Nature}
  \providecommand{\pasa}{PASA}
  \providecommand{\pasp}{PASP}
  \providecommand{\pasj}{PASJ}
  \providecommand{\prd}{Phys. Rev. D}
  \providecommand{\prl}{Phys. Rev. Lett.}
}

\definecolor{uksrcNavy}{HTML}{070067}
\definecolor{uksrcGreen}{HTML}{E80067}
\definecolor{uksrcGrey}{HTML}{4F5650}
\definecolor{uksrcHeaderText}{HTML}{FFFFFF}
\definecolor{uksrcRule}{HTML}{070067}
\definecolor{uksrcTint}{HTML}{F4F6FB}

\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 1pt minus 1pt}
\setstretch{1.0}

\newcommand{\uksrczeropadday}[1]{\ifnum#1<10 0\fi\number#1}
\newcommand{\UKSRCTodayFormat}{%
  \uksrczeropadday{\day}\space
  \ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
  \space\number\year}

\captionsetup{
  font=footnotesize,
  labelfont={bf,color=uksrcNavy},
  textfont={color=uksrcNavy}
}

\titleformat{name=\section}{\normalfont\Large\sffamily\bfseries\color{uksrcNavy}}{\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{14pt}{8pt}
\titleformat{\subsection}{\normalfont\large\sffamily\bfseries\color{uksrcGreen}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}
\titleformat{\subsubsection}{\normalfont\normalsize\sffamily\bfseries\color{uksrcNavy}}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{10pt}{4pt}
\titleformat{name=\section,numberless}{\normalfont\Large\sffamily\bfseries\color{uksrcNavy}}{}{0em}{}

\providecommand{\DocumentTitle}{UKSRC Memo Title}
\providecommand{\DocumentID}{UKSRC-MEMO-0001}
\providecommand{\DocumentType}{MEMO}
\providecommand{\DocumentRevision}{0.1}
\providecommand{\DocumentStatus}{Draft}
\providecommand{\DocumentTags}{}
\providecommand{\DocumentClassification}{Unrestricted}
\providecommand{\DocumentAuthors}{Primary Author}
\providecommand{\DocumentFooterAuthors}{\DocumentAuthors}
\providecommand{\DocumentContact}{}
\providecommand{\LeadAuthor}{Primary Author}
\providecommand{\IssueDate}{\today}
\providecommand{\DocumentDate}{\IssueDate}
\providecommand{\SummaryText}{Replace this text with a concise executive summary.}
\providecommand{\uksrcdisclaimertext}{The UKSRC memos are intended to support the rapid recording of technical work, investigations, design notes, and open questions. A memo may reflect the views of its authors at the time of writing and should not automatically be taken as formal UKSRC policy, project baseline, or final design guidance.}
\providecommand{\uksrclogopath}{figures/logos/SKAO_ukSRC_logo_colour_rgb.png}
\newcommand{\UKSRCAbbreviationRows}{}
\providecommand{\abbreviationtable}{%
  \begin{tabularx}{\textwidth}{|l|X|}
    \hline
    \UKSRCAbbreviationRows
  \end{tabularx}
}
\newcommand{\setuksrclogo}[1]{\renewcommand{\uksrclogopath}{#1}}
\providecommand{\uksrclink}[2]{#2}
\newcommand{\JiraTag}[1]{\uksrclink{https://uksrc.atlassian.net/browse/#1}{jira:#1}}

\makeatletter
\define@key{uksrcmemo}{title}{\renewcommand{\DocumentTitle}{#1}}
\define@key{uksrcmemo}{id}{\renewcommand{\DocumentID}{#1}}
\define@key{uksrcmemo}{type}{\renewcommand{\DocumentType}{#1}}
\define@key{uksrcmemo}{revision}{\renewcommand{\DocumentRevision}{#1}}
\define@key{uksrcmemo}{status}{\renewcommand{\DocumentStatus}{#1}}
\define@key{uksrcmemo}{tags}{\renewcommand{\DocumentTags}{#1}}
\define@key{uksrcmemo}{classification}{\renewcommand{\DocumentClassification}{#1}}
\define@key{uksrcmemo}{authors}{\renewcommand{\DocumentAuthors}{#1}}
\define@key{uksrcmemo}{footer-authors}{\renewcommand{\DocumentFooterAuthors}{#1}}
\define@key{uksrcmemo}{contact}{\renewcommand{\DocumentContact}{#1}}
\define@key{uksrcmemo}{lead-author}{\renewcommand{\LeadAuthor}{#1}}
\define@key{uksrcmemo}{issue-date}{%
  \renewcommand{\IssueDate}{#1}%
  \renewcommand{\DocumentDate}{#1}%
}
\define@key{uksrcmemo}{date}{\renewcommand{\DocumentDate}{#1}}
\define@key{uksrcmemo}{summary}{\renewcommand{\SummaryText}{#1}}
\newcommand{\SetMemoMetadata}[1]{\setkeys{uksrcmemo}{#1}}
\AtBeginDocument{%
  \renewcommand{\today}{\UKSRCTodayFormat}%
  \@ifpackageloaded{hyperref}{%
    \let\uksrclink\href
    \hypersetup{%
      colorlinks=true,
      linkcolor=black,
      citecolor=uksrcNavy,
      urlcolor=black,
      filecolor=black
    }%
  }{}%
  \renewcommand{\@makefnmark}{\textsuperscript{\normalfont\color{uksrcNavy}\@thefnmark}}%
}
\newcommand{\UKSRCDocInfoRows}{}
\newcommand{\UKSRCAuthorRows}{}
\newcommand{\UKSRCDocHistoryRows}{}

\newcommand{\ResetDocumentInfoRows}{\gdef\UKSRCDocInfoRows{}}
\newcommand{\AddDocumentInfoItem}[2]{\g@addto@macro\UKSRCDocInfoRows{{#1} & {#2}\\\hline}}

\newcommand{\ResetAbbreviations}{\gdef\UKSRCAbbreviationRows{}}
\newcommand{\AddAbbreviation}[2]{\g@addto@macro\UKSRCAbbreviationRows{{#1} & {#2}\\\hline}}

\newif\ifUKSRCShowAuthorApprovals
\UKSRCShowAuthorApprovalsfalse
\newcommand{\ShowAuthorApprovals}{\UKSRCShowAuthorApprovalstrue}
\newcommand{\HideAuthorApprovals}{\UKSRCShowAuthorApprovalsfalse}
\newcommand{\ResetAuthorApprovals}{\gdef\UKSRCAuthorRows{}}
\newcommand{\AddAuthorApprovalSection}[1]{\g@addto@macro\UKSRCAuthorRows{\multicolumn{4}{|l|}{\textbf{#1}}\\\hline}}
\newcommand{\AddAuthorApproval}[4]{\g@addto@macro\UKSRCAuthorRows{{#1} & {#2} & {#3} & {#4}\\\hline}}

\newcommand{\ResetDocumentHistory}{\gdef\UKSRCDocHistoryRows{}}
\newcommand{\AddDocumentRevision}[3]{\g@addto@macro\UKSRCDocHistoryRows{{#1} & {#2} & {#3}\\\hline}}
\makeatother

\pagestyle{fancy}

\newcommand{\FooterBlock}{%
  \footnotesize
  \begingroup
  % The footer uses fixed-width metadata columns; suppress harmless
  % underfull-box diagnostics from page-output boxing without changing layout.
  \hbadness=10000\relax
  \color{uksrcNavy}%
  \setlength{\tabcolsep}{4pt}%
  \renewcommand{\arraystretch}{1.05}%
  \begin{tabularx}{\textwidth}{@{}>{\raggedright\arraybackslash}p{0.48\textwidth}@{}>{\raggedleft\arraybackslash}p{0.48\textwidth}@{}}
    \textbf{Document ID:} \DocumentID & \textbf{Classification:} \DocumentClassification\\
    \textbf{Revision:} \DocumentRevision & \textbf{Author(s):} \DocumentFooterAuthors\\
    \textbf{Date:} \DocumentDate & \textbf{Page:} \thepage\ of \pageref{LastPage}
  \end{tabularx}%
  \endgroup
}

\newcommand{\IfNonempty}[2]{\ifdefempty{#1}{}{#2}}

\fancyhf{}
\fancyhead[L]{}
\fancyhead[C]{}
\fancyhead[R]{}
\fancyfoot[L]{}
\fancyfoot[C]{\FooterBlock}
\fancyfoot[R]{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.6pt}
\makeatletter
\renewcommand{\footrule}{%
  \vskip-\footruleskip
  \hbox to\headwidth{\color{uksrcRule}\leaders\hrule height\footrulewidth\hfill}\vskip\footruleskip}
\makeatother

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\FooterBlock}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0.6pt}%
}

\newcommand{\ExecutiveSummaryBox}{%
  \begingroup
  \setlength{\tabcolsep}{10pt}%
  \renewcommand{\arraystretch}{1.18}%
  \arrayrulecolor{uksrcRule}%
  \begin{tabularx}{\linewidth}{|>{\columncolor{uksrcTint}}X|}
    \hline
    \SummaryText\\
    \hline
  \end{tabularx}%
  \arrayrulecolor{black}%
  \endgroup
}

\newcommand{\DocumentInfoTable}{%
  \begingroup
  \setlength{\tabcolsep}{8pt}%
  \renewcommand{\arraystretch}{1.12}%
  \arrayrulecolor{uksrcRule}%
  \begin{tabular}{|>{\columncolor{uksrcNavy}\color{uksrcHeaderText}\bfseries}L{0.28\linewidth}|L{0.60\linewidth}|}
    \hline
    \UKSRCDocInfoRows
  \end{tabular}%
  \arrayrulecolor{black}%
  \endgroup
}

\newcommand{\AuthorApprovalTable}{%
  \begingroup
  \setlength{\tabcolsep}{8pt}%
  \renewcommand{\arraystretch}{1.12}%
  \arrayrulecolor{uksrcRule}%
  \begin{longtable}{|>{\raggedright\arraybackslash}p{0.18\linewidth}|>{\raggedright\arraybackslash}p{0.18\linewidth}|>{\raggedright\arraybackslash}p{0.21\linewidth}|>{\raggedright\arraybackslash}p{0.21\linewidth}|}
    \hline
    \rowcolor{uksrcNavy}\color{uksrcHeaderText}\textbf{Name} & \color{uksrcHeaderText}\textbf{Designation} & \color{uksrcHeaderText}\textbf{Affiliation} & \color{uksrcHeaderText}\textbf{Signed / Date}\\
    \hline
    \endfirsthead
    \hline
    \rowcolor{uksrcNavy}\color{uksrcHeaderText}\textbf{Name} & \color{uksrcHeaderText}\textbf{Designation} & \color{uksrcHeaderText}\textbf{Affiliation} & \color{uksrcHeaderText}\textbf{Signed / Date}\\
    \hline
    \endhead
    \hline
    \endfoot
    \endlastfoot
    \UKSRCAuthorRows
  \end{longtable}%
  \arrayrulecolor{black}%
  \endgroup
}

\newcommand{\DocumentHistoryTable}{%
  \begingroup
  \setlength{\tabcolsep}{8pt}%
  \renewcommand{\arraystretch}{1.12}%
  \arrayrulecolor{uksrcRule}%
  \begin{longtable}{|p{0.14\linewidth}|p{0.18\linewidth}|p{0.50\linewidth}|}
    \hline
    \rowcolor{uksrcNavy}\color{uksrcHeaderText}\textbf{Revision} & \color{uksrcHeaderText}\textbf{Date of issue} & \color{uksrcHeaderText}\textbf{Comments}\\
    \hline
    \endfirsthead
    \hline
    \rowcolor{uksrcNavy}\color{uksrcHeaderText}\textbf{Revision} & \color{uksrcHeaderText}\textbf{Date of issue} & \color{uksrcHeaderText}\textbf{Comments}\\
    \hline
    \endhead
    \hline
    \endfoot
    \endlastfoot
    \UKSRCDocHistoryRows
  \end{longtable}%
  \arrayrulecolor{black}%
  \endgroup
}

\newcommand{\uksrcfrontpage}{%
  \thispagestyle{empty}
  \vspace*{-6mm}
  \begin{center}
    \includegraphics[width=0.63\textwidth]{\uksrclogopath}\par
    \vspace{6mm}
    {\color{uksrcNavy}\fontsize{26}{31}\selectfont\sffamily\bfseries\DocumentTitle}\par
    \vspace{5mm}
    {\Large\sffamily\bfseries\color{uksrcGreen} UKSRC \DocumentType}
  \end{center}

  \vspace{10mm}

  \begingroup
  \centering
  \renewcommand{\arraystretch}{1.32}
  \arrayrulecolor{uksrcRule}
  \noindent\begin{tabular}{|>{\columncolor{uksrcNavy}\color{white}\bfseries}L{0.30\textwidth}|L{0.58\textwidth}|}
    \hline
    Document ID & \DocumentID\\
    \hline
    Revision & \DocumentRevision\\
    \hline
    Author(s) & \DocumentAuthors\\
    \hline
    \IfNonempty{\DocumentContact}{Contact & \DocumentContact\\\hline}%
    Release date & \DocumentDate\\
    \hline
    Document classification & \DocumentClassification\\
    \hline
    Status & \DocumentStatus\\
    \hline
    \IfNonempty{\DocumentTags}{Tags & \DocumentTags\\\hline}%
  \end{tabular}
  \arrayrulecolor{black}
  \endgroup
}

\newcommand{\uksrcdisclaimerpage}{%
  \newpage
  \section*{UKSRC Memo Disclaimer}
  \small
  \noindent\uksrcdisclaimertext
}

\newcommand{\uksrctableofcontents}{%
  \newpage
  \renewcommand{\contentsname}{Table of Contents}
  \tableofcontents
}

\newcommand{\uksrclistoffigures}{%
  \newpage
  \listoffigures
  \addcontentsline{toc}{section}{List of figures}%
}

\newcommand{\uksrclistoftables}{%
  \newpage
  \listoftables
  \addcontentsline{toc}{section}{List of tables}%
}

\newcommand{\uksrclistofabbreviations}{%
  \newpage
  \section*{List of abbreviations}
  \addcontentsline{toc}{section}{List of abbreviations}%
  \abbreviationtable
}

\newcommand{\uksrclistofsymbols}{%
  \newpage
  \section*{List of symbols}
  \addcontentsline{toc}{section}{List of symbols}%
}

\newcommand{\uksrcsummary}{%
  \newpage
  \section*{Summary}
  \addcontentsline{toc}{section}{Summary}%
}

\newcommand{\uksrcreferencedocs}{%
  \newpage
  \section*{Applicable and reference documents}
  \addcontentsline{toc}{section}{Applicable and reference documents}%
}

\newcommand{\uksrcstandardfrontmatter}{%
  \uksrcfrontpage
  \uksrcdisclaimerpage
  \bigskip
  \section*{Executive summary}
  \ExecutiveSummaryBox
  \ifUKSRCShowAuthorApprovals
    \medskip
    \section*{Author(s) \& approval}
    \AuthorApprovalTable
  \fi
  \medskip
  \section*{Document history}
  \DocumentHistoryTable
  \uksrctableofcontents
}

\endinput
