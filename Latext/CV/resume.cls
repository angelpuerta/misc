%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[left=0.75in,top=0.6in,right=0.75in,bottom=0.6in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hyperref} % Required for hyperlinks
\usepackage{changepage} %Required for adjust width

\usepackage{fontspec}
\usepackage{fontawesome5}
\usepackage{multicol}

\pagestyle{empty} % Suppress page numbers

\setmainfont{Alegreya}
\setsansfont{Rubik}
\setlength{\columnsep}{3em}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{\textsf{  \Large #1}}} % Defines the \name command to set name
\def \phone#1{\def\@phone{#1}} % Defines the \name command to set name
\def \email#1{\def\@email{#1}} % Defines the \name command to set name
\def \country#1{\def\@country{#1}} % Defines the \name command to set name
\def \city#1{\def\@city{#1}} % Defines the \name command to set name
\def \git#1{\def\@git{#1}} % Defines the \name command to set name


% \printname is used to print the name as a page header
\def \printname {
    {\sffamily \MakeUppercase{\@name}}
}

\def \printemail {
	\href{mailto:\@email}{\faEnvelope\texttt{\char32}\@email}
}

\def \printphone {
		\href{tel:\@phone}{\faPhone\texttt{\char32}\@phone}
}

\def \printlocation {
		\faMapMarker\texttt{\char32}\@city,\texttt{\char32}\@country
}

\def \printgit{
		\href{https://github.com/\@git}{\faGithub\texttt{\char32}\@git}
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \begin{adjustwidth}{0,6cm}{2cm}
  {\footnotesize
  \begin{multicols}{3}{
  	\printemail % Print the email with \email
  \\[3pt] 
  	\printphone % Print the phone
  	
  	\columnbreak
  	
  	\printlocation %Print the location
    \\[3pt] 
  	\printgit  %Print git repository
  	\columnbreak
  }\end{multicols}
  }
  \end{adjustwidth}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\sffamily \Large #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\sffamily { \large #1}{\,}{ \footnotesize \bf \sffamily#3} \hfill 
 { \footnotesize \sffamily#2}} % Bold company name and date on the right
\smallskip
  \normalsize	
  \begin{list}{$\cdot$}{\leftmargin=0,3cm} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
