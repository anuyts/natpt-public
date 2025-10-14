%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%% HELLO WORLD CLASS FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% CONTENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% 0. Identification and options.
%% 1. Included packages.
%% 2. Initializations.
%% 3. Processing author and address information.
%% 4. Processing email information.
%% 5. Formatting choices.
%% 6. Logo and banner.
%% 7. Redefining \maketitle.
%% 8. Redefining the abstract environment.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 0. IDENTIFICATION AND OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%% Identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{helloWorld}[2020/01/14 Hello World]

%%% This class file is built on top of the article class.
\LoadClass[twoside,11pt,a4paper]{article}

%%% With regards to the numbering of theorems, definitions, etc, there are two options. The default is numbering subordinate to a section. The class option twoLevelNum implements numbering subordinate to a subsection. Here we configure these options, which sets the values of \@thmNumLevel (which is used in section 9 where the theorem environments are provided) and \@tocdepth (which is used in section 5 to control the depth of the contents page appearing in the navigation/bookmarks sidebar of the pdf viewer).
\DeclareOption{twoLevelNum}{
  \def\@thmNumLevel{subsection}
  \def\@tocdepth{2}}
\DeclareOption{oneLevelNum}{
  \def\@thmNumLevel{section}
  \def\@tocdepth{1}}
%%% There are two types of papers: invited papers and regular submissions. The indication of which type is made in the header of the first page, in the initial segment of the article's reference. Here we configure these options.
\DeclareOption{invited}{
  \def\@initialSegmentArtRef{Invited Contribution, Hello World }}
\DeclareOption{regularSubmission}{
  \def\@initialSegmentArtRef{Hello World }}
%%% Language options. At the moment this class file caters to articles written English or French. More languages could easily be added, and will be when the need arises.
\DeclareOption{english}{
  \def\@numLang{1}
  \def\@lang{english}}
\DeclareOption{french}{
  \def\@numLang{2}
  \def\@lang{french}}

%%% Here we set the default options.
\ExecuteOptions{oneLevelNum, regularSubmission, english}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 1. INCLUDED PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%% Page layout
\RequirePackage[top=2.8cm, bottom=2.8cm, hmargin=2.5cm, headsep=.75cm, twoside]{geometry}

%%% Colours
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

%%% Tikz (needed to generate the banner)
\RequirePackage{tikz}

%%% xstring (needed in the author-affiliation processing, to detect and handle duplicate affiliations)
\RequirePackage{xstring}

%%% Access to last page number (for the generation of the article's journal reference from user data)
\RequirePackage{lastpage}

%%% Footnote customisation
\RequirePackage{scrextend}

%%% Header customisation
\RequirePackage{fancyhdr}

%%% Section heading customisations
\RequirePackage{titlesec}
\RequirePackage[title]{appendix}
\RequirePackage{etoolbox, apptools}
\RequirePackage{bold-extra}

%%% Theorem styling
\RequirePackage{amsthm}

%%% List customisation, for adjusting list item spacing in Section 5
\RequirePackage[shortlabels]{enumitem}

%%% If the language of the paper is not English, then load the babel package
\ifnum\@numLang=2
\RequirePackage[english, main=\@lang]{babel}
\fi

%%% Language configuration
\def\@english{english}
\ifx\@lang\@english
  \def\@and{and}
\fi

\def\@french{french}
\ifx\@lang\@french
  \def\@abstractname{R\'esum\'e}
  \def\@keywordsname{Mots clefs}
  \frenchbsetup{FrenchFootnotes=false}
  \def\@and{et}
\fi

%%% Hyperlinks and bookmarks
\RequirePackage[pdfencoding=unicode, bookmarksnumbered, colorlinks=true, urlcolor=MidnightBlue, linkcolor=blue, citecolor=blue]{hyperref}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 2. INITIALIZATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Article information
\def\@startPage{1}
\def\@volume{1}
\def\@issue{1}
\def\@pubYear{2017}
\def\@editor{xxx}
\def\@received{xxx}
\def\@accepted{xxx}

%% Author information
\def\@authorList{\relax}
\def\@authors{\relax}
\def\@shortAuthorList{\relax}
\def\@shortAuthors{\relax}
\def\@authAffilList{\relax}
\def\@emailList{\relax}
\newcount\@numAuthors
\@numAuthors=0
\newcount\@numAffils
\@numAffils=0
\newcount\@numEmails
\@numEmails=0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 3. PROCESSING AUTHOR AND ADDRESS INFORMATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Here the \author and \address macros are defined. They in turn define the \@authors and \@shortauthors which are then used below. \@authors contains the list of long author names and footnotes to their corresponding affiliation-addresses. \@shortauthors contains the list of (in the general case, short) author names.

%% Other macros defined by \author and \address are \@authorList and \@shortAuthorList, which aid in the construction of \@authors and \@shortauthors, as well as \@lastauthor, which is the name of the most recently added author, which is used in the definition of the macro \email. For the purposes of processing duplicate affiliations, the macro \@authAffilList is defined. It contains a list of authors, affiliations, reference numbers, all as strings. The macros of the xstring package are then used to detect and handle duplicate affiliations in the definition of the \address macro.

%% The ``full version'' of \author macro, with the optional short author name argument active.
\def\@@author[#1]#2{
  \ifnum\@numAuthors=0
  \g@addto@macro\@shortAuthorList{#1}
  \g@addto@macro\@shortAuthors{#1}
  \g@addto@macro\@authorList{#2}
  \g@addto@macro\@authors{#2}
  \g@addto@macro\@authAffilList{#2}
  \else
  \let\@tempShortAuthorList\@shortAuthorList
  \let\@tempAuthorList\@authorList
  \def\@shortAuthors{\@tempShortAuthorList\ and #1}
  \def\@authors{\@tempAuthorList\ \@and\ #2}
  \g@addto@macro\@shortAuthorList{, #1}
  \g@addto@macro\@authorList{, #2}
  \g@addto@macro\@authAffilList{, #2}
  \fi
  \advance\@numAuthors by 1
  \def\@lastAuthor{#1}}

%% The ``special version'' of \author with no short author name given.
\def\@author#1{\@@author[#1]{#1}}

%% The final definition of \author.
\def\author{\@ifnextchar[{\@@author}{\@author}}

%% Here the \address macro is developed, which adds an affiliation-address to \@authors as footnote, which below will be displayed in a minipage environment. It throws up an error message if no authors have been entered beforehand. It is built from the macro \@addressTwo, which in turn is built from \@addressOne.

% \@addressOne adds the appropriate reference, or footnote text containing the affiliation. Which to add depends on whether the affiliation (2nd argument) has appeared before in the list, and the conditional branching is implemented using the \IfSubStr* macro from the xstring package. In the case of duplication, the appropiate label is computed by searching back through \@authAffilList, using other macros from xstring. In the case of a new affiliation, the added footnote contains a label of the form 'HSAffiliationLabel-n', where n is the current value of \@numAffils (which keeps track of how many distinct affiliations have been processed so far).
\def\@addressOne#1#2{
  \expandarg\IfSubStr*{\@authAffilList}{#2}
  {\expandarg\StrBehind{\@authAffilList}{#2, }[\@rightString]
    \StrLeft{\@rightString}{1}[\@labelNum]
    \g@addto@macro\@authorList{\textsuperscript{\ref{HSAffiliationLabel-\@labelNum}}}
    \g@addto@macro\@authAffilList{, #2, \@labelNum}
    \g@addto@macro\@authors{\textsuperscript{\ref{HSAffiliationLabel-\@labelNum}}}}
  {\g@addto@macro\@authorList{\footnote{\textsl{#2}\label{HSAffiliationLabel-#1}}}
    \g@addto@macro\@authAffilList{, #2, #1}
    \g@addto@macro\@authors{\footnote{\textsl{#2}\label{HSAffiliationLabel-#1}}}
    \advance\@numAffils by 1}}

% \@addressTwo is a variant of \@addressOne in which the first argument is expanded before the macro is called. This ensures that when \@addressTwo is applied with first argument = \@numAffils, the *current* value of \@numAffils is used. If one instead used \@addressOne with first argument = \@numAffils, only the final version of \@numAffils would ever be used, resulting in incorrect referencing.
\def\@addressTwo#1#2{
  \begingroup \edef\@x##1{ \endgroup
    \noexpand\@addressOne{#1}{##1}}
  \@x{#2}}

% Here finally is the \address macro. It throws up a class error when it is used before any authors have been entered.
\def\address#1{
  \ifnum\@numAuthors=0
  \ClassError{helloWorld}{No author entered.}{At least one author must be entered before his/her address and email.}
  \fi
  \@addressTwo{\the\@numAffils}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 4. PROCESSING EMAIL INFORMATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Here the \email macro is defined. It takes the user-input email addresses and defines the macro \@emails which expands to a table containing the email addresses and the associated author short names. Below in the \maketitle redefinition, this table is placed in a footnote at the bottom of the first page.

%% A convenience to generate email hyperlinks.
\def\@emailLT#1{\href{mailto:#1}{#1}}

%% The main macro. It was necessary to implement a macro accepting two arguments, the first of which is the last author's short name, and the second his/her email address, because of the delicate expansion behaviour of hyperlinks (see below).
\def\@emailAuthor#1:#2:{
  \ifnum\@numEmails=0
  \g@addto@macro\@emailList{& \@emailLT{#2} (#1)}
  \def\@emails{\begin{tabular}{ll} {Email address:} \@emailList \end{tabular}}
  \else
  \g@addto@macro\@emailList{\\ & \@emailLT{#2} (#1)}
  \def\@emails{\begin{tabular}{ll} {Email addresses:} \@emailList \end{tabular}}
  \fi
  \advance\@numEmails by 1}

% The final definition of \email. It throws up an error message if no authors have been entered beforehand. Because of the expansion behaviour of hyperlinks mentioned above, the 1st argument of \emailAuthor needed to be expanded but the not the second. This is the reason for the \expandafter command in the definition.
\def\email#1{
  \ifx\@lastAuthor\undefined%
  \ClassError{helloWorld}{No author entered.}{At least one author must be entered before his/her address and email.}
  \fi
  \expandafter\@emailAuthor\@lastAuthor:#1:}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 5. FORMATTING CHOICES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Here we set out the journal style for headers, footers, section headings, various spacings, the (lack of a) table of contents, and theorem styling.

%% Definition of the macro \@articleRef which expands to the article's journal reference. This appears in alternating headers, and on the first page header.
\def\startPage#1{\def\@startPage{#1}
  \setcounter{page}{\@startPage}}
\def\volume#1{\def\@volume{#1}}
\def\issue#1{\def\@issue{#1}}
\def\pubYear#1{\def\@pubYear{#1}}
\def\@articleRef{\@initialSegmentArtRef \@volume(\@issue):\@startPage--\pageref*{LastPage}, \@pubYear.}

%% Header customisation (uses the package fancyhdr).
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead[LE,RO]{\small{\thepage}}
\fancyhead[CE]{\small{\textsl{\@shortAuthors, \@articleRef}}}
\fancyhead[CO]{\small{\textsl{\@shortTitle}}}

%% Footnote customisation (requires the package scrextend).
% \deffootnote[1.1em]{1.1em}{1.1em}{\textsuperscript{\makebox[1.1em][l]{\thefootnotemark}}}
\deffootnote[0.6em]{0em}{0em}{\textsuperscript{\thefootnotemark}}

%% Section heading customisations. Uses all the heading customisation packages. The word ``Appendix'' is incorporated as part of an appendix-section title.
\AtBeginEnvironment{appendices}{\appendixtrue}
\titleformat{\part}[block]{\Large\bfseries\scshape}{Part \thepart:}{0.5em}{}
\titleformat{\section}[block]{\large\bfseries}{\IfAppendix{\appendixname~}{\relax}\thesection\IfAppendix{: }{.}}{0.5em}{}
\titleformat{\subsection}[runin]{\normalfont\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[runin]
{\normalfont\itshape}{\thesubsubsection}{1em}{}

%% Table of contents depth (for display in bookmarks/navigation bar of pdf viewer).
\setcounter{tocdepth}{\@tocdepth}

%% Line spacing
\renewcommand{\baselinestretch}{1.1}

%% Spacing for list items (uses enumitem package)
\setlist{noitemsep, topsep=.1em}

%% Ignore any table of contents and give a message that this was done.
\def\tableofcontents{
  \ClassWarning{helloWorld}{The table of contents in the body of the article has been ignored}}

%% We use the amsthm package to style our theorems. We give one basic theorem type, defined so that the numbering works correctly. The macro \@thmNumLevel expands to either ``section'' (in the default case) or ``subsection'' (in the case where the class option twoLevelNum is used).
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[\@thmNumLevel]
%% Other theorem environments are defined by the authors, in accordance with the amsthm package.

%% The following macro is taken from here: https://tex.stackexchange.com/questions/334082/qed-symbol-after-statements-without-proof
%% Its purpose is to facilitate typesetting of theorem environments with a qed symbol which behaves the same way as in proof environments. This is for results given without a subsequent proof environment, in which one would like a qed symbol.
\newcommand{\addqed}[1]{%
  \expandafter\let\csname #1Inner\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname end#1Inner\expandafter\endcsname\csname end#1\endcsname
  \expandafter\def\csname #1\endcsname##1{%
    \ifx##1\qed\stumpqedtrue\pushQED{\qed}\fi\csname #1Inner\endcsname
  }%
  \expandafter\def\csname end#1\endcsname{%
    \ifstumpqed\popQED\fi\csname end#1Inner\endcsname
  }%
}
\newif\ifstumpqed

%% Commands for getting clickable arXiv numbers in bibliographies
\newcommand{\Arxiv}[1]{\href{http://arxiv.org/pdf/#1}{ArXiv:#1}}
\newcommand{\arxiv}[1]{\href{http://arxiv.org/pdf/#1}{arXiv:#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 6. LOGO AND BANNER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Hello world logo.
\newcommand{\hsLogo}{
  \large\textrm
  {\color{MidnightBlue} \scalebox{1.5}[4]{\Large H}\kern-.15em\raise1.2ex \vbox{\hbox{\bf ELLO}\kern-.35em\hbox{\bf WORLD}}}}

%% Colour of the background of the banner, which is a blue chosen to be consistent with the website.
\definecolor{bannerBack}{HTML}{503DBB}

%% Banner = logo + fading blue background, done using tikz (which seemed to provide the simplest way to obtain the fading effect).
\newcommand{\banner}{
  \begin{tikzpicture}
  \def\banHeight{2.5}
  \def\mypath{(0,0) rectangle (\textwidth,\banHeight)}
  \fill[left color=white, right color=bannerBack] \mypath;
  \node at (\textwidth/2,\banHeight/2) {\hsLogo};
  \draw [line width=2] (0,0) -- (\textwidth,0);
  \end{tikzpicture}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 7. REDEFINING \maketitle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% \maketitle generates the title, list of authors and related stuff. In our case this related stuff includes the author address/affiliations, emails, the banner and the first page header. The author names are in a minipage environment, and their addresses in a footnote to that environment. The email addresses are put into an ``ordinary'' (ie a non-minipage) footnote.

%% Some preliminary footnote customisations. These are also used below in the redefinition of the abstract environment.
% Redefine the endminipage command so that the footnoterule is removed
\let\oldendminipage\endminipage%
\def\endminipage{\let\footnoterule\relax\oldendminipage}
% Define a new footnote command for footnotes without markers
\def\@blfootnote{\xdef\@thefnmark{}\@footnotetext}

%% Customising the first page headers (using the package fancyhdr).
\fancypagestyle{firstPage}{\lhead{} \rhead{}
  \chead{\href{https://ddg.gg/}{\textsl{\@articleRef}}}}

%% Redefine the \title command so that it allows an optional short title argument.
\def\title{\@ifnextchar[{\@titleBoth}{\@titleJustLong}}
\def\@titleBoth[#1]#2{\def\@title{#2}
  \def\@shortTitle{#1}}
\def\@titleJustLong#1{\@titleBoth[#1]{#1}}

%% Generate DOI from publication year and number in year
\def\@numInYear{xx}
\def\numInYear#1{\def\@numInYear{#1}}
\def\@doi{10.21136/HS.\@pubYear.\@numInYear}

%% The \maketitle redefinition. It throws up error messages if no authors or emails have been entered beforehand.
\renewcommand{\maketitle}{
  \ifnum\@numAuthors=0
  \ClassError{helloWorld}{No author entered.}{At least one author must be entered.}
  \fi
  \ifx\@emails\undefined%
  \ClassError{helloWorld}{No email address entered.}{At least one email address is required.}
  \fi
  \begin{flushleft}
  \banner%
  \vskip 1.5em
  {\LARGE\bf\@title\par}
  \vskip 1em
  \begin{minipage}{.85\linewidth}
  {\large \bf \@authors \par}
  \end{minipage}
  \thispagestyle{firstPage}
  \@blfootnote{\@emails}
  \@blfootnote{\hskip 0.6em \copyright\,\@shortAuthors, \@pubYear, under a \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International License}.}
  \@blfootnote{\hskip 0.6em \href{https://dx.doi.org/\@doi}{DOI: \@doi}}
  \end{flushleft}
  \rule{\textwidth}{.5pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%% 8. REDEFINING THE ABSTRACT ENVIRONMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% The new abstract environment is set up to be flush left, and the article data -- receipt and acceptance dates, amsclasses and keywords, are displayed in a table in a footnote in a minipage at the bottom of this environment. Earlier versions had the whole abstract in a minipage environment, but this prevented the correct handling of multipage abstracts.

%% The following macros are defined to obtain the corresponding information from the author.
\def\editor#1{\def\@editor{#1}}
\def\received#1{\def\@received{#1}}
\def\accepted#1{\def\@accepted{#1}}
\def\amsclass#1{\def\@amsclass{#1}}
\def\keywords#1{\def\@keywords{#1}}
\ifnum\@numLang=2
\def\engKeywords#1{\def\@engKeywords{#1}}
\def\engTitle#1{\def\@engTitle{#1}}
\fi

%% Abstract environment redefinition. It throws up error messages if no AMS classes or keywords have been entered.
\renewenvironment{abstract}
{\ifx\@amsclass\undefined%
  \ClassError{helloWorld}{No AMS classes entered.}{Please enter AMS classes appropriate to your article.}
  \fi
  \ifx\@keywords\undefined%
  \ClassError{helloWorld}{No keywords entered.}{Please enter keywords appropriate to your article.}
  \fi
  \begin{flushleft}
  \vskip -0.5em
  {\textbf\abstractname}
  \vskip 1em
  \end{flushleft}}
{\begin{flushleft}
  \vskip -0.75em
  \ifnum\@numLang=1
    \begin{minipage}{\textwidth}
    \@blfootnote{\begin{tabular}{>{\slshape}l>{\slshape}l}
                   \multicolumn{2}{p{.85\textwidth}}{\textsl{Communicated by: \@editor.}} \\
                   {Received: \@received.} & {Accepted: \@accepted.} \\
                   \multicolumn{2}{p{.85\textwidth}}{\textsl{MSC: \@amsclass.}} \\
                   \multicolumn{2}{p{.85\textwidth}}{\textsl{Keywords: \@keywords.}}
                 \end{tabular}}
    \end{minipage}
    \vskip 0.5em
    \rule{\textwidth}{0.5pt}
  \else
    \begin{minipage}{\textwidth}
    \@blfootnote{\begin{tabular}{>{\slshape}l>{\slshape}l}
                   \multicolumn{2}{p{.85\textwidth}}{\textsl{\@keywordsname: \@keywords.}}
                 \end{tabular}}
    \end{minipage}
    \vskip 0.5em
  \fi
\end{flushleft}}

%% In the above environment the English metadata is not displayed if the article language is not English. Instead there is an additional environment for the inclusion of the English abstract and English metadata. This uses the babel package, and the English language parts are included in an "otherlanguage" environment.
\ifnum\@numLang=2
\newenvironment{engAbstract}
{\ifx\@engKeywords\undefined%
\ClassError{helloWorld}{No English keywords entered.}{Please enter English keywords appropriate to your article.}
\fi
\ifx\@engTitle\undefined%
\ClassError{helloWorld}{No English title entered.}{Please enter an English title for your article.}
\fi
\begin{otherlanguage}{english}
\begin{flushleft}
  \vskip -0.5em
  {\textbf{Abstract (\@engTitle)}}
  \vskip 1em
  \end{flushleft}}
{\begin{flushleft}
\vskip -0.75em
\begin{minipage}{\textwidth}
  \@blfootnote{\begin{tabular}{>{\slshape}l>{\slshape}l}
                 \multicolumn{2}{p{.85\textwidth}}{\textsl{Communicated by: \@editor.}} \\
                 {Received: \@received.} & {Accepted: \@accepted.} \\
                 \multicolumn{2}{p{.85\textwidth}}{\textsl{MSC: \@amsclass.}} \\
                 \multicolumn{2}{p{.85\textwidth}}{\textsl{Keywords: \@engKeywords.}}
               \end{tabular}}
             \end{minipage}
             \vskip 0.5em
             \rule{\textwidth}{0.5pt}
\end{flushleft}
\end{otherlanguage}}
\fi