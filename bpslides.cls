
% Borja Petit, 2021

\ProvidesClass{bpslides}[2021 Borja Petit, Template for beamer]

% Font family
\DeclareOption{iowa}{\def\fontiowa{1}}
\DeclareOption{sans}{\def\fontsf{1}}
\DeclareOption{helvetica}{\def\fonthelvet{1}}
\DeclareOption{palatino}{\def\fontpala{1}}
\DeclareOption{bookman}{\def\fontbookman{1}}
\DeclareOption{termes}{\def\fonttermes{1}}
\DeclareOption{adventor}{\def\fontadventor{1}}

% Include numbering of pages
\DeclareOption{numbering}{\def\numbering{1}}	

% Include numbering of pages
\DeclareOption{numbertotal}{\def\numbering{1}\def\numbertotal{1}}	

% Include ToC at the beginning of each section
\DeclareOption{toc}{\def\toc{1}}

% 16:9 aspect ratio
\DeclareOption{wide}{\def\aspect{1}}    	    	

% Colors:
\DeclareOption{red}{\def\colorred{1}}
\DeclareOption{green}{\def\colorgreen{1}}
\DeclareOption{blue}{\def\colorblue{1}}
\DeclareOption{black}{\def\colorblack{1}}
\DeclareOption{orange}{\def\colororange{1}}
\DeclareOption{magenta}{\def\colormagenta{1}}
\DeclareOption{purple}{\def\colorpurple{1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\ifdefined\aspect
    \LoadClass[aspectratio=169]{beamer}
\else
    \LoadClass[]{beamer}
\relax\fi

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amssymb,amsmath,amsthm}		% To include math environments
\RequirePackage{graphicx}					% To insert pictures
\RequirePackage{enumitem}
\RequirePackage{ragged2e} \justifying 			% To justify paragraphs
\RequirePackage{booktabs}					% Nice lines for tables
\RequirePackage{caption}						% Redefine figure/table captions format
\RequirePackage{subcaption}					% Subfigures
\RequirePackage{stackengine}                			%
\RequirePackage{ulem}                       			% Nice underline environment
\RequirePackage{multirow}					% Merge multiple rows/columns in tables
\RequirePackage{tcolorbox}

\mode<presentation>{\usetheme{Dresden}\usefonttheme{default}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTS:

% San-serif (default) font
\ifdefined\fontsf
	\renewcommand\familydefault{\sfdefault}
	\RequirePackage{sfmath}
\else\relax\fi

% Helvetica font
\ifdefined\fonthelvet
	\RequirePackage[scaled]{helvet} 
	\renewcommand\familydefault{phv}
	\RequirePackage[helvet]{sfmath}
\else\relax\fi

% Palatino font
\ifdefined\fontpala
	\RequirePackage{palatino} 
	\renewcommand\familydefault{ppl}
	\RequirePackage[lm]{sfmath}
\else\relax\fi

% Palatino font
\ifdefined\fontbookman
	\RequirePackage{bookman} 
	\renewcommand\familydefault{pbk}
\else\relax\fi

% Termes font
\ifdefined\fonttermes
	\RequirePackage{tgtermes} 
	\renewcommand\familydefault{qtm}
\else\relax\fi

% Adventor font
\ifdefined\fontadventor
	\RequirePackage{tgadventor} 
	\renewcommand\familydefault{qag}
	\RequirePackage{sfmath}
\else\relax\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORS

\definecolor{main}{rgb}{0,0.5,0}
\definecolor{darkyellow}{rgb}{0.71, 0.65, 0.26}
\ifdefined\colorgreen\definecolor{main}{rgb}{0,0.5,0}\else\relax\fi
\ifdefined\colorred\definecolor{main}{rgb}{0.8,0,0}\else\relax\fi
\ifdefined\colorblue\definecolor{main}{rgb}{0,0.2,0.8}\else\relax\fi
\ifdefined\colorblack\definecolor{main}{rgb}{0,0,0}\else\relax\fi
\ifdefined\colororange\definecolor{main}{rgb}{1,0.25,0}\else\relax\fi
\ifdefined\colormagenta\definecolor{main}{cmyk}{0,1,0,0}\else\relax\fi
\ifdefined\colorpurple\definecolor{main}{rgb}{0.5,0,1}\else\relax\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SLIDE LAYOUT

% colors of structure
\setbeamercolor{structure}{fg=main}

% slide margins
\setbeamersize{text margin left=0.6cm} 
\setbeamersize{text margin right=0.6cm}

% no navigation symbols
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{mini frames}{}

% make "pause" to put things transparent
\setbeamercovered{transparent=10}

% Define headline
\setbeamertemplate{headline}{
   \begin{beamercolorbox}[colsep=0pt]{upper separation line head}\end{beamercolorbox}%
   \begin{beamercolorbox}[colsep=0pt]{middle separation line head}\end{beamercolorbox}%
   \begin{beamercolorbox}[colsep=0pt]{lower separation line head}\end{beamercolorbox}%
   \begin{beamercolorbox}{section in head}\end{beamercolorbox}%
}
%
% Define footline
\newcommand{\foot}[1]{\def\lfoot{#1}}
\setbeamertemplate{footline}{
   \begin{beamercolorbox}[colsep=1.5pt]{upper separation line foot}\end{beamercolorbox}%
   \begin{beamercolorbox}[colsep=1.5pt]{middle separation line foot}\end{beamercolorbox}%
   \begin{beamercolorbox}[colsep=1.5pt]{lower separation line foot}\end{beamercolorbox}%
   \begin{beamercolorbox}{section in foot}%
   	\vskip2pt \ \hspace{0.1cm}
   	\ifdefined\lfoot
            {\color{black!60}\lfoot}
        \else\relax\fi\hfill%
        \ifx\insertsection\empty\else%
                {\color{black!60}\insertsection \ $-$ \ }%
            \relax\fi%
        \ifdefined\numbering%
            \ifdefined\numbertotal%
                {\color{black!60}\insertframenumber/\inserttotalframenumber}%
            \else%
                {\color{black!60}\insertframenumber}%
            \fi%
        \fi%
	\hspace{0.2cm} \ \vskip4pt%
   \end{beamercolorbox}%
}

% Define title of slides
%
\setbeamertemplate{frametitle}{
    \vspace{-0.03cm}
    \begin{beamercolorbox}[sep=0.3cm,wd=1\paperwidth]{myframetitle}%
        {\Large{\color{main}\insertframetitle}}%
        \ifx\insertframesubtitle\empty\else%
            \\{\large\color{black!70}\textit{\insertframesubtitle}}
        \relax\fi
    \end{beamercolorbox}%
    \vspace{-0.03cm}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE

\setbeamerfont{title}{size=\Large}
\setbeamerfont{subtitle}{size=\large,series=\mdseries,shape=\it}
\setbeamerfont{author}{size=\normalsize}
\setbeamerfont{institute}{size=\small}
\setbeamerfont{date}{size=\normalsize}

\setbeamercolor{title}{fg=main,bg=white}
\setbeamercolor{author}{fg=black,bg=white}
\setbeamercolor{date}{fg=black,bg=white}
\setbeamercolor{disc}{fg=black,bg=white}

\newcommand{\conference}[1]{\def\talk{#1}}
\newcommand{\disclaimer}[1]{\def\discla{#1}}

\setbeamertemplate{title page}{%
    %
    { \ } \vfill
    \addtocounter{framenumber}{-1}%
    %
    %
    \begin{beamercolorbox}[wd=0.95\paperwidth,sep=10pt,center]{title}%
        \usebeamerfont{title}%
        {\Large\color{main}\inserttitle}%
        \ifx\insertsubtitle\empty\else%
            \vspace{0.2cm}\par%
		\usebeamerfont{subtitle}%
		\insertsubtitle%
        \relax\fi%
    \end{beamercolorbox}%
    %
    %
    \begin{beamercolorbox}[wd=0.95\paperwidth,sep=10pt,center]{author}%
        \usebeamerfont{author}%
        \insertauthor%
        \ifx\insertinstitute\empty\else\par%
		\vspace{0.4cm}%
		\usebeamerfont{institute}%
		\insertinstitute\\%
	\relax\fi%
    \end{beamercolorbox}%
    %
    %
    \begin{beamercolorbox}[wd=0.95\paperwidth,sep=10pt,center]{date}%
	\usebeamerfont{date}%
	\ifdefined\talk%
		{\color{darkyellow}\talk}\par\vspace{0.3cm}%
	\else\relax\fi%
	\insertdate%
    \end{beamercolorbox}%
    %
    \vfill
    \ifdefined\discla\par
    \begin{beamercolorbox}[wd=0.95\paperwidth,sep=5pt,left]{disc}%
	\setlength{\parskip}{-5mm}%
        \noindent\scriptsize\discla
    \end{beamercolorbox}%
    \else\relax\fi%
    \vspace{-0.5cm}
    %
    }
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TABLE OF CONTENTS:

% Add table of contents at the beginning of each section:
\ifdefined\toc %
    \AtBeginSection[]{%
        \begin{frame}[plain]{Outline}%
        \addtocounter{framenumber}{-1} 
        \begin{center}\begin{minipage}[b]{0.95\textwidth}%
            \tableofcontents[currentsection,hideallsubsections,subsubsectionstyle=hide]%
        \end{minipage}\end{center}\vfill
        \end{frame}}%
\else
    % if "toc" not selected, show new slides with sections headings:
    \renewcommand\section[1]{%
        \begin{frame}[plain]\centering%
        \addtocounter{framenumber}{-1}%
        {\color{main}\Large{#1}\vs\\%
        \rule{0.7\textwidth}{0.8pt}}%
        \end{frame}}%
\relax\fi

% Format of sections in TOC:
\setbeamertemplate{section in toc}{%
    \usebeamercolor[fg]{enumerate item}{%
    {\color{main}\inserttocsectionnumber. \inserttocsection}%
}}%

% Format of subsections in TOC:
\setbeamertemplate{subsection in toc}{
    \usebeamercolor[fg]{enumerate item}{%
    {\color{black!50}\hspace{0.5cm}%
    \footnotesize\inserttocsectionnumber.\inserttocsubsectionnumber \ \ \inserttocsubsection\vspace{-0.1cm}\par}%
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LENGTHS AND NEW COMMANDS

\setlength{\parskip}{0mm}

% Setting space below and above equations
\setlength\abovedisplayskip{13pt}
\setlength\belowdisplayskip{13pt}
\setlength\abovedisplayshortskip{13pt}
\setlength\belowdisplayshortskip{13pt}

\newcommand{\hs}{\hspace{0.1cm}}
\newcommand{\vs}{\vspace{0.1cm}}

\newcommand{\so}{\ \ \ \ {\color{main}\longrightarrow} \ \ \ \ }
\newcommand{\under}[1]{\underline{\smash{#1}}}
\newcommand{\llave}[2]{{\color{main}\underbrace{\addstackgap[4pt]{\color{black}$#1$}}_{{\footnotesize\text{{\color{main}#2}}}}}}

\newcommand{\mathpause}{\vspace*{-\baselineskip}\pause}

\newcommand{\paper}[2]{{{\color{main}#1} ({\color{main}#2})}}
\newcommand{\paperalt}[2]{{\color{main}#1, #2}}

\newcommand\eqboxed[1]{{\setlength\fboxrule{1pt}\setlength\fboxsep{8pt}\fcolorbox{main}{black!5}{\enspace$#1$\enspace}}}
\renewcommand\boxed[1]{{\setlength\fboxrule{1pt}\setlength\fboxsep{8pt}\fcolorbox{main}{black!5}{\enspace#1\enspace}}}

\renewcommand{\note}[1]{\textit{\color{black!50}#1}}

\renewcommand{\footnoterule}{}

\renewcommand{\alert}[1]{{\color{main}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIST ENVIROMENTS

\setitemize[1]{itemsep=1.2ex, topsep=1.2ex,leftmargin=15pt, label={\scriptsize\raise1.25pt\hbox{\donotcoloroutermaths{\color{main}$\bullet$}}}}
\setitemize[2]{itemsep=1.2ex, topsep=1.2ex, leftmargin=12pt, label={\footnotesize\raise1.5pt\hbox{\donotcoloroutermaths{\color{main}$\circ$}}}}
\setitemize[3]{itemsep=1.2ex, topsep=1.2ex, leftmargin=20pt, labelsep=8pt, label={\footnotesize\raise1.1pt\hbox{\donotcoloroutermaths{\color{main}$-$}}}}

\setenumerate[1]{itemsep=1.2ex, topsep=1.2ex, leftmargin=20pt, label={\color{main}\arabic*.}}
\setenumerate[2]{itemsep=1.2ex, topsep=1.2ex, leftmargin=20pt, label={\color{main}(\alph*)}}
\setenumerate[3]{itemsep=1.2ex, topsep=1.2ex, leftmargin=20pt, label={\color{main}\roman*.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES AND FIGURES

% Captions
\captionsetup{labelfont={color=main}}
\captionsetup{justification=centering}
\captionsetup{belowskip=2pt}
\captionsetup{aboveskip=5pt}

% Baseline array height
\renewcommand{\arraystretch}{1.0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BLOCKS

\newtcolorbox{bpblock}[2][]{arc=0pt , colback=black!5 , colbacktitle=black!10 , colframe=black!0 , title=#2 , left=2mm , right=2mm , coltitle=main , toptitle=1.5mm , bottomtitle=0.9mm , fonttitle=\normalsize}

\renewenvironment{block}[2]{\begin{bpblock}{#1}#2}{\end{bpblock}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BUTTONS

\newcommand{\button}[2]{\raise-1pt\hbox{\hyperlink{#1}{\beamerbutton{\raise0.0pt\hbox{#2}}}}}
\setbeamercolor{button}{bg=main!8,fg=black}
\setbeamercolor{button border}{fg=main}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	




