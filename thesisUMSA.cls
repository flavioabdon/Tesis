%%
%% This is file `thesisUNSA.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `thesisUnal')
%%
%% This is a generated file.
%%
%% Copyright 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%%
%% This file was generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This file has the LPPL maintenance status "maintained".
%%
%% This file may only be distributed together with a copy of the LaTeX
%% base system. You may however distribute the LaTeX base system without
%% such generated files.
%%
%% The list of all files belonging to the LaTeX base distribution is
%% given in the file `manifest.txt'. See also `legal.txt' for additional
%% information.
%%
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{thesisUnal}[2008/01/01 v1.0 Standard LaTeX document class]

%\RequirePackage[latin1]{inputenc}
%\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage{anysize} 
\RequirePackage{amsfonts}
%
\RequirePackage{amsmath}
\RequirePackage{amsxtra}
\RequirePackage{amstext}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{amsthm}
\RequirePackage{verbatim}
\RequirePackage{makeidx}
\RequirePackage{multicol}
\RequirePackage{marvosym}
\RequirePackage{ifpdf}
\ifpdf
    \RequirePackage{graphicx,color}%
    \DeclareGraphicsExtensions{.pdf}
\else
    \RequirePackage[dvips]{graphicx,color}%
    \DeclareGraphicsExtensions{.eps}
\fi
\RequirePackage{setspace}

\def\@author{}
\def\@degreeauthor{}
\def\@advisor{}
\def\@degreeadvisor{}
\def\@coadvisor{}
\def\@degreecoadvisor{}
\def\@title{}
\def\@perfil{}
\def\@degree{}
\def\@titledegree{}
\def\@university{}
\def\@faculty{}
\def\@department{}
\def\@city{}
\def\@date{}
\def\@code{}
\def\@titlespanish{}
\def\@titleenglish{}
\def\@abstractspanish{}
\def\@abstractenglish{}
\def\@keywordspanish{}
\def\@keywordenglish{}
\ifpdf
    \def\@logouniversity{imagesThesis/logo_university.pdf}
\else
    \def\@logouniversity{imagesThesis/logo_university.eps}
\fi
\def\@logosize
\def\@space{1}

\def\@note{}
\def\@mention{}
\gdef\@juries{}
\def\@advisornote{}
\def\@coadvisornote{}
\def\@datenote{}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage \@titlepagetrue
\newif\if@openright
\newif\if@mymainmatter \@mymainmattertrue
\newif\if@appearindex \@appearindextrue
\newif\if@mainmatter \@mainmattertrue
\newif\if@smalltitle \@smalltitlefalse
\newif\if@spanish \@spanishtrue
\newif\if@proposal \@proposalfalse
\newif\if@head \@headtrue
\newif\if@plain
\newif\if@harvard \@harvardfalse

\def\BibTeX{B{\footnotesize IB}\TeX}
\def\pdfLaTeX{pdf\LaTeX}
\def\rulehead{\rule[-4pt]{\textwidth}{0.8pt}\hskip-\textwidth}
\def\headempty{\clearpage\thispagestyle{empty}}

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{plain}{\@plaintrue}
\DeclareOption{graph}{\@plainfalse}
\DeclareOption{spanish}{\@spanishtrue}
\DeclareOption{english}{\@spanishfalse}
\DeclareOption{proposal}{\@proposaltrue}
\DeclareOption{singlespace}{\def\@space{1}}
\DeclareOption{doublespace}{\def\@space{2}}
\DeclareOption{onehalfspace}{\def\@space{1.5}}
\DeclareOption{harvard}{\@harvardtrue}
\DeclareOption{amsplain}{\@harvardfalse}

\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\DeclareOption{letterpaper}{\setlength\paperheight{11in}\setlength\paperwidth{8.5in}}
\def\@sizepage{
    \addtolength\hoffset{14.6mm}      %
    \addtolength\voffset{-9.4mm}     %
    \setlength\textwidth{150mm}       %
    \setlength\textheight{235mm}      %
    \setlength\topmargin{0mm}         %
    \setlength\oddsidemargin{0mm}     %
    \setlength\evensidemargin{-13mm}    %
    \setlength\parskip{2mm}           %
    \setlength\headsep{5mm}           %
    \setlength\footskip{6mm}}

\ExecuteOptions{letterpaper,12pt,oneside,singlespace,onecolumn,final,openright,plain,spanish,amsplain}
\ProcessOptions
\input{bk1\@ptsize.clo}
%\@sizepage

\if@spanish
    \RequirePackage[spanish]{babel}
    \addto\layoutspanish{\def\@seccntformat#1{\csname the#1\endcsname.\space}}
    \def\labelenumi{\theenumi.}
    \def\labelenumii{(\theenumii)}
    \def\labelenumiii{\theenumiii.}
    \def\labelenumiv{\theenumiv.}
    \def\labelitemi{\textbullet}
    \def\labelitemii{\normalfont\bfseries \textendash}
    \def\labelitemiii{\textasteriskcentered}
    \def\labelitemiv{\textperiodcentered}
\else
    \RequirePackage[english]{babel}
    \newcommand\labelenumi{\theenumi.}
    \newcommand\labelenumii{(\theenumii)}
    \newcommand\labelenumiii{\theenumiii.}
    \newcommand\labelenumiv{\theenumiv.}
    \newcommand\labelitemi{\textbullet}
    \newcommand\labelitemii{\normalfont\bfseries \textendash}
    \newcommand\labelitemiii{\textasteriskcentered}
    \newcommand\labelitemiv{\textperiodcentered}
\fi

\AtBeginDocument{
\def\@roman#1{\romannumeral #1}
\if@spanish\renewcommand{\tablename}{Tabla}\fi
\if@spanish
    \if@proposal
        \gdef\@titledegree{Propuesta}
    \else
        \gdef\@titledegree{Trabajo}
    \fi
        \g@addto@macro\@titledegree{ de tesis para optar al t\'itulo de}
\else
        \gdef\@titledegree{Thesis}
    \if@proposal
        \g@addto@macro\@titledegree{ Proposal}
    \else
        \g@addto@macro\@titledegree{ Work}
    \fi
        \g@addto@macro\@titledegree{ to Obtain the Degree of}
\fi
}

\def\@narrowbox#1{\setlength{\fboxrule}{0.5pt}\setlength{\fboxsep}{0pt}\fbox{#1}}

\newcommand\logouniversity[2][45mm]{\def\@logosize{#1}\def\@logouniversity{#2}}

\def\infothesis{\@ifnextchar[\@valueDocument{}}
\def\@valueDocument[#1]{\setkeys{values}{#1}
%\setcounter{page}{0}
\pagestyle{empty}
% \begin{minipage}[c][\textheight][c]{\textwidth}
%    \centering%
%    \bigskip %
%    \bigskip %
%    \begin{spacing}{1.2}%
%   \@university%
%    \@faculty%
%    \@department%
%    \end{spacing}
%    \bigskip
%    \includegraphics[height=\@logosize]{\@logouniversity}\\%
%    \bigskip%
%    \@title%
%    \vfill%
%    \begin{spacing}{1.2}%
%    \@author%
% 	 \@degreeauthor%
%    \@code%
%    \vfill%
%    \@city%
%    \end{spacing}%
%    \@date%
%    \bigskip %
%    \bigskip %
%\end{minipage}
%%
%\thispagestyle{empty}%
\if@twoside
    \clearpage
    \vphantom{\qquad}
    %\thispagestyle{empty}%
    \clearpage
\else
    \clearpage
\fi\begin{minipage}[c][\textheight][c]{\textwidth}
    \centering
    \vspace{0cm}
    \begin{spacing}{1.8}
    \@university
    \@faculty
    \@department
    \end{spacing}
    \vspace{0.0cm}
    \includegraphics[height=8cm,width=3.5cm]{\@logouniversity}\\
    \vspace{0.5cm}
    \@perfil
    \vspace{1.0cm}
    \begin{spacing}{1.4}
    \@title
    \end{spacing}
    %\vspace{0.5cm}
    \begin{spacing}{1}
    \@titledegree
    \@degree
    \end{spacing}
    \vspace{1.2cm}
    \@author
    \@advisor
    \vfill
    \vspace{0.8cm}
    \@city
    \@date
    \vspace{0.8cm}

\end{minipage}
\if@twoside
    \clearpage
    \vphantom{\qquad}
    %\thispagestyle{empty}%
    \clearpage
\else
    \clearpage
\fi
\pagestyle{headings}%
}

% ---------------------------------------------------------------
% Macros de tamaño de tipografía para la carátula.
% Valores por defecto: Times New Roman (sin corrección de escala).
% Thesis.tex los redefine si se usa Latin Modern (escala ×0.9508).
% ---------------------------------------------------------------
\def\@cv@author@sz{16}       \def\@cv@author@bl{19.2}
\def\@cv@advisor@sz{14}      \def\@cv@advisor@bl{16.8}
\def\@cv@title@sz{16}        \def\@cv@title@bl{19.2}
\def\@cv@perfil@sz{16}       \def\@cv@perfil@bl{19.2}
\def\@cv@titledeg@sz{11}     \def\@cv@titledeg@bl{13.2}
\def\@cv@degree@sz{11}       \def\@cv@degree@bl{13.2}
\def\@cv@univ@sz{20}         \def\@cv@univ@bl{24}
\def\@cv@faculty@sz{16}      \def\@cv@faculty@bl{19.2}
\def\@cv@dept@sz{16}         \def\@cv@dept@bl{19.2}
\def\@cv@city@sz{12}         \def\@cv@city@bl{14.4}
\def\@cv@date@sz{12}         \def\@cv@date@bl{14.4}

\define@key{values}{author}{\def\@author{{\fontsize{\@cv@author@sz}{\@cv@author@bl}\selectfont\textbf{POR: \MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{degreeauthor}{\def\@degreeauthor{}}
\define@key{values}{code}{\def\@code{}}
\define@key{values}{advisor}{\def\@advisor{{\fontsize{\@cv@advisor@sz}{\@cv@advisor@bl}\selectfont\textbf{TUTOR: \MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{degreeadvisor}{\def\@degreeadvisor{}}
\define@key{values}{coadvisor}{\def\@coadvisor{}}
\define@key{values}{degreecoadvisor}{\def\@degreecoadvisor{}}
\define@key{values}{title}{\def\@title{{\fontsize{\@cv@title@sz}{\@cv@title@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{perfil}{\def\@perfil{{\fontsize{\@cv@perfil@sz}{\@cv@perfil@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{titledegree}{\def\@titledegree{{\fontsize{\@cv@titledeg@sz}{\@cv@titledeg@bl}\selectfont\textbf{#1}}\\[1ex]}}
\define@key{values}{degree}{\def\@degree{{\fontsize{\@cv@degree@sz}{\@cv@degree@bl}\selectfont\textbf{#1}}\\[1ex]}}
\define@key{values}{university}{\def\@university{{\fontsize{\@cv@univ@sz}{\@cv@univ@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{faculty}{\def\@faculty{{\fontsize{\@cv@faculty@sz}{\@cv@faculty@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{department}{\def\@department{{\fontsize{\@cv@dept@sz}{\@cv@dept@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{city}{\def\@city{{\fontsize{\@cv@city@sz}{\@cv@city@bl}\selectfont\textbf{\MakeUppercase{#1}}}\\[1ex]}}
\define@key{values}{date}{\def\@date{{\fontsize{\@cv@date@sz}{\@cv@date@bl}\selectfont\textbf{#1}}\\[-2ex]}}

\def\abstractthesis{\@ifnextchar[\@valueAbstract{}}
\def\@valueAbstract[#1]{\setkeys{values}{#1}
    \if@spanish
        \@titlespanish
        \@titleenglish
        \@abstractspanish
        \@abstractenglish
        \@keywordspanish
        \@keywordenglish
    \else
        \@titleenglish
        \@titlespanish
        \@abstractenglish
        \@abstractspanish
        \@keywordenglish
        \@keywordspanish
    \fi
    \pagestyle{empty}
    \if@twoside
        \clearpage
        \vphantom{\qquad}
        \thispagestyle{empty}%
    \fi
}

\define@key{values}{titlespanish}{\def\@titlespanish{\ \\[-5ex]\subsubsection*{T\'itulo en espa\~nol}\ \\[-5ex]\noindent#1}}
\define@key{values}{titleenglish}{\def\@titleenglish{\ \\[-5ex]\subsubsection*{Title in English}\ \\[-5ex]\noindent#1}}
\define@key{values}{abstractspanish}{\def\@abstractspanish{\\[-5ex]\paragraph*{Resumen:}#1}}
\define@key{values}{abstractenglish}{\def\@abstractenglish{\\[-5ex]\paragraph*{Abstract:}#1}}
\define@key{values}{keywordspanish}{\def\@keywordspanish{\\[-5ex]\paragraph*{Palabras clave:}#1}}
\define@key{values}{keywordenglish}{\def\@keywordenglish{\\[-5ex]\paragraph*{Keywords:}#1}}

\def\acceptationnote{\@ifnextchar[\@valueNote{}}
\def\@valueNote[#1]{\setkeys{valuesNote}{#1}
\begin{minipage}[c][\textheight][c]{\textwidth}
    \raggedleft\parbox{8cm}{\centering\begin{Large}\textbf{\if@spanish Nota de aceptaci\'on\else Acceptation Note\fi}\end{Large}}
    \@note
	\@mention
    \@juries
    \@advisornote
    \@coadvisornote
    \@datenote
\end{minipage}
    \pagestyle{empty}
    \clearpage
    \if@twoside
        \vphantom{\qquad}
        \thispagestyle{empty}%
    \fi
}

\define@key{valuesNote}{note}{\def\@note{\\\bigskip\smallskip\parbox{8cm}{\centering\begin{large}\begin{spacing}{1.2}
\if@spanish Trabajo de tesis\\#1\else Thesis Work\\#1\fi\end{spacing}\end{large}}}}
\define@key{valuesNote}{mention}{\def\@mention{\\\bigskip\parbox{8cm}{\centering\begin{large}\begin{spacing}{1.2}``\if@spanish Menci\'on #1\else #1 mention\fi''\end{spacing}\end{large}}}}
\define@key{valuesNote}{juryone}{\g@addto@macro\@juries{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Jurado \else Jury \fi\\#1\\}}}
\define@key{valuesNote}{jurytwo}{\g@addto@macro\@juries{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Jurado \else Jury \fi\\#1\\}}}
\define@key{valuesNote}{jurythree}{\g@addto@macro\@juries{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Jurado \else Jury \fi\\#1\\}}}
\define@key{valuesNote}{jury}{\g@addto@macro\@juries{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Jurado \else Jury \fi\\#1\\}}}
\define@key{valuesNote}{advisor}{\def\@advisornote{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Director \else Advisor \fi\\#1\\}}}
\define@key{valuesNote}{coadvisor}{\def\@coadvisornote{\vfill\raggedleft\parbox{8cm}{\rule{8cm}{0.8pt}\\\if@spanish Codirector \else Coadvisor \fi\\#1\\}}}
\define@key{valuesNote}{date}{\def\@datenote{\vskip 5mm\raggedright\parbox{8cm}{#1\\}}}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\rulehead\thepage\hfil{\scriptsize\leftmark}\hfil}%%{\thepage\hfil\slshape\leftmark}%\if@head\rulehead\fi
      \def\@oddhead{\rulehead\hfil{\scriptsize\rightmark}\hfil\thepage}%%{{\slshape\rightmark}\hfil\thepage}%\if@head\rulehead\fi
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth{\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mymainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
        \if@mainmatter
          \thesection. \ %
        \fi
        \fi
        ##1}}}}
\else
\def\ps@headings{%
  \let\@oddfoot\@empty%
  \def\@oddhead{\rulehead\hfil{\scriptsize\rightmark}\hfil\thepage}%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright{\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mymainmatter
          \@chapapp\ \thechapter. \ %
        \fi
      \fi
      ##1}}}}
\fi


\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{}%\thepage\hfil\slshape\leftmark
    \def\@oddhead{}%\slshape\rightmark\hfil\thepage
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-0.5em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-0.5em}%
                                      {\normalfont\normalsize\bfseries}}

\newlength{\@widthtext}

\newcommand\frontmatter{%
  \pagestyle{headings}
  \@mymainmatterfalse
  \pagenumbering{Roman}
  % Nombres en español (mayúsculas) para cuerpo y listas
  \renewcommand{\tablename}{TABLA}
  \renewcommand{\figurename}{FIGURA}
  % Formato de entradas en Índice de Tablas: "TABLA 1. Caption..."
  \renewcommand*{\l@table}[2]{%
    \bgroup
      \def\numberline####1{\tablename~####1.\enspace}%
      \@dottedtocline{1}{0em}{0em}{##1}{##2}%
    \egroup}
  % Formato de entradas en Índice de Figuras: "FIGURA 1. Caption..."
  \renewcommand*{\l@figure}[2]{%
    \bgroup
      \def\numberline####1{\figurename~####1.\enspace}%
      \@dottedtocline{1}{0em}{0em}{##1}{##2}%
    \egroup}
  % Inyectar override en .lot y .lof para anular el reset de babel a "Cuadro"
  % Babel escribe \babel@toc{spanish}{} al inicio del .lot/.lof y resetea los nombres.
  % Este \addtocontents escribe la corrección justo después en el mismo archivo.
  \addtocontents{lot}{\protect\renewcommand{\protect\tablename}{TABLA}}
  \addtocontents{lof}{\protect\renewcommand{\protect\figurename}{FIGURA}}
  \setstretch{\@space}
  \def\bigrule{\titlerule[1pt]}
  \def\bigaboverule{\rule{\textwidth}{1.5pt}\hspace{-\textwidth}\rule[-3.5pt]{\textwidth}{0.5pt}\\[1ex]}
  \def\bigbelowrule{\rule{\textwidth}{0.5pt}\hspace{-\textwidth}\rule[-4.5pt]{\textwidth}{1.5pt}}
  % --- ESTILO ANTERIOR DE CAPÍTULO (COMENTADO) ---
  % \if@plain
  %   \renewcommand{\thechapter}{}
  %   \titleformat{\chapter}[display]{\bfseries\LARGE}{\vskip-1cm\filleft\MakeUppercase{\chaptertitlename}\enspace\Huge\thechapter}{3ex}{\bigaboverule\filright}[\vspace{-1.5ex}\bigbelowrule]
  % \else
  %   \titleformat{\chapter}[display]{\LARGE\sf}{\settowidth{\@widthtext}{\chaptertitlename}\vskip-1cm\rule{\@widthtext}{1pt}\hphantom{\chapternumberorfigure}\bigrule\\[-8.5pt] \vrule height48pt width 1pt depth-18pt \chaptertitlename\chapternumberorfigure\bigrule\vrule height49pt width1pt depth0pt}{20pt}{\normalfont\Huge}
  % \fi
  % --- NUEVO ESTILO DE CAPÍTULO: CAPÍTULO N (romano) en 1.ª línea, TÍTULO en 2.ª línea ---
  \titleformat{\chapter}[display]
    {\normalsize\bfseries}
    {CAP\'ITULO\space\Roman{chapter}}
    {1.5ex}
    {\MakeUppercase}

  \titleformat{name=\chapter,numberless}
    {\normalsize\bfseries}
    {}
    {0pt}
    {\MakeUppercase}

  \titlespacing*{\chapter}{0pt}{0pt}{3ex plus 1ex minus .2ex}
  \titlespacing*{name=\chapter,numberless}{0pt}{0pt}{3ex plus 1ex minus .2ex}
}

\newcommand\mainmatter{%
  \cleardoublepage
  \@mymainmattertrue
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \pagenumbering{arabic}
  \setstretch{\@space}
  \gdef\thechapter{\@arabic\c@chapter}
  \if@spanish
    \def\chaptertitlename{Cap\'itulo}
  \else
    \def\chaptertitlename{Chapter}
  \fi
 \def\chapternumberorfigure{\;\mbox{\fontsize{72}{74}\usefont{OT1}{ptm}{m}{n}\selectfont\thechapter}\;}
}

\newcommand\backmatter{%
  \if@twoside
    \def\@evenhead{\rulehead\thepage\hfil{\scriptsize\leftmark}\hfil}
    \def\@oddhead{\rulehead\hfil{\scriptsize\leftmark}\hfil\thepage}
  \else
    \def\@evenhead{\rulehead\thepage\hfil{\scriptsize\rightmark}\hfil}
    \def\@oddhead{\rulehead\hfil{\scriptsize\rightmark}\hfil\thepage}
  \fi
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mymainmatterfalse
  \gdef\thechapter{}
}

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \if@appearindex
                        \thispagestyle{plain}%
                    \else
                        \thispagestyle{empty}%
                    \fi
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mymainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \if@spanish
                            \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
                         \else
                            \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter.}#1}%
                         \fi
                       \else
                            \if@appearindex
                                \addcontentsline{toc}{chapter}{#1}%
                            \else
                                \@appearindextrue
                            \fi
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@smalltitle
                        \if@plain
                            \def\chaptertitlename{\vskip-2cm}
                            \@makechapterhead{#2}%
                        \else
                            \def\chaptertitlename{#2}
                            \@makechapterhead{\vskip-2ex}%
                        \fi
                    \else
                        \@makechapterhead{#2}%
                    \fi
                      \@afterheading
                      \@smalltitlefalse
                    }
\RequirePackage{titlesec}

\def\@makechapterhead#1{%
}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
}}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
%\renewcommand\labelenumi{\theenumi.}
%\renewcommand\labelenumii{(\theenumii)}
%\renewcommand\labelenumiii{\theenumiii.}
%\renewcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%\renewcommand\labelitemi{\textbullet}
%\renewcommand\labelitemii{\normalfont\bfseries \textendash}
%\renewcommand\labelitemiii{\textasteriskcentered}
%\renewcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \if@spanish
    \def\chaptertitlename{Ap\'endice}
  \else
    \def\chaptertitlename{Appendix}
  \fi
  \def\chapternumberorfigure{\;\,\mbox{\fontsize{72}{74}\usefont{OT1}{ptm}{m}{n}\selectfont\thechapter}\;\,}
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{4pt}
\setlength\belowcaptionskip{6pt}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{3}
\setcounter{tocdepth}{3}
\newcommand\@indexchapter[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \if@appearindex
        \thispagestyle{plain}%
    \else
        \thispagestyle{empty}%
    \fi
    \global\@topnum\z@
    \@afterindentfalse
    \addcontentsline{toc}{chapter}{#1}%
    \chaptermark{#1}%
    {\parindent\z@\centering\normalfont\normalsize\bfseries\MakeUppercase{#1}\par\nobreak}%
    \vspace{3ex plus 1ex minus .2ex}%
    \@afterheading
}

\newcommand\tableofcontents{%
    \setstretch{1}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \@smalltitletrue
    \if@spanish
        \renewcommand{\contentsname}{\'INDICE}
    \fi
    \@indexchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \setstretch{\@space}
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.2em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.1em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.0em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

%%%%%%%%%%%%%%%%%%%%%%5555
\newcommand\resumen[1]{
    %\clearpage
    %\setcounter{page}{0}
    %\@appearindexfalse
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/dedicatory_graph2.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/dedicatory_graph2.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
}

%%%%%%%%%%%%%%%%%%%5


\newcommand\dedicatory[1]{
    %\clearpage
    \setcounter{page}{0}
    \@appearindexfalse
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/dedicatory_graph2.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/dedicatory_graph2.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
}
\newcommand\acknowledgement[1]{
    %\clearpage
    \setcounter{page}{0}
    \@appearindexfalse
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/acknowledgement_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/acknowledgement_graph.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase#1}{\MakeUppercase#1}%
}
\newcommand\conclusion[1]{
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/conclusion_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/conclusion_graph.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase#1}{\MakeUppercase#1}%
}
\newcommand\futurework[1]{
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/futurework_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/futurework_graph.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase#1}{\MakeUppercase#1}%
}
\newcommand\introduction[1]{
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/introduction_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/introduction_graph.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase#1}{\MakeUppercase#1}%
}


\renewcommand\glossary[1]{
    \setstretch{1}
    \@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/glossary_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/glossary_graph.eps}\;\,}
    \fi
    \include{#1}%
    %\@mkboth{\MakeUppercase#1}{\MakeUppercase#1}%
    \setstretch{\@space}
}
\newcommand\listoffigures{%
    \setstretch{1}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@spanish
        \renewcommand{\listfigurename}{\'Indice de figuras}
    \fi
    \@smalltitletrue
    \@indexchapter{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \setstretch{\@space}
    }

\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand\listoftables{%
    \setstretch{1}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \if@spanish
        \renewcommand{\listtablename}{\'Indice de tablas}
    \fi
    \@smalltitletrue
    \@indexchapter{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \setstretch{\@space}
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}




\newenvironment{thebibliography}[1]
     {\setstretch{1}\@smalltitletrue
    \ifpdf
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/bibliograhy_graph.pdf}\;\,}
    \else
        \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/bibliograhy_graph.eps}\;\,}
    \fi
     \chapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
     \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\setstretch{\@space}}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\setstretch{1}\@smalltitletrue
                \ifpdf
                    \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/index_graph.pdf}\;\,}
                \else
                    \def\chapternumberorfigure{\;\,\includegraphics[height=49pt]{imagesThesis/index_graph.eps}\;\,}
                \fi
               \chapter{\indexname}
               \begin{multicols}{2}
               \if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                %\twocolumn[\@makeschapterhead{\indexname}]%

                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem
                }
               {\end{multicols}\if@restonecol\onecolumn\else\clearpage\fi\setstretch{\@space}}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}

\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\RequirePackage{enumerate}
\RequirePackage[breaklinks]{hyperref}

\RequirePackage[small,sc,hang]{caption}
\DeclareCaptionLabelSeparator{dot}{.  }
\captionsetup{labelsep=dot}


\if@harvard
    \RequirePackage[abbr,agsm,agsmcite,square]{harvard}%%
    \def\harvardurl#1{\textbf{URL:}\ \textit{#1}}
\else
    \bibliographystyle{amsplain}
\fi

\clubpenalty10000
\widowpenalty10000
\sloppy

\endinput
