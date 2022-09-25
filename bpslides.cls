
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

% Page layout
\DeclareOption{hdrule}{\def\hdrule{1}}	    	% Add a line below frame title
\DeclareOption{numbering}{\def\numbering{1}}	% Include numbering of pages
\DeclareOption{toc}{\def\toc{1}}			    % Include ToC at the beginning of each section
\DeclareOption{wide}{\def\aspect{1}}    	    % Include ToC at the beginning of each section

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
    \LoadClass[11pt,aspectratio=169]{beamer}
\else
    \LoadClass[10pt]{beamer}
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

\mode<presentation>{\usetheme{Dresden}\usefonttheme{default}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTS:

% Iowa font
\ifdefined\fontiowa
    \familydefault{\rmdefault}
	\renewcommand*\rmdefault{iwona}
	\renewcommand{\familydefault}{iwona}
\else\relax\fi

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

\ifdefined\colorgreen   \definecolor{main}{rgb}{0,0.5,0} \else\relax\fi
\ifdefined\colorred     \definecolor{main}{rgb}{0.8,0,0} \else\relax\fi
\ifdefined\colorblue    \definecolor{main}{rgb}{0,0.2,0.8} \else\relax\fi
\ifdefined\colorblack   \definecolor{main}{rgb}{0,0,0} \else\relax\fi
\ifdefined\colororange  \definecolor{main}{rgb}{1,0.25,0} \else\relax\fi
\ifdefined\colormagenta \definecolor{main}{cmyk}{0,1,0,0} \else\relax\fi
\ifdefined\colorpurple	\definecolor{main}{rgb}{0.5,0,1} \else\relax\fi

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADER AND FOOTER

% Set frames' footers
\setbeamertemplate{footline}{
   \begin{beamercolorbox}[colsep=1.5pt]{upper separation line foot}	\end{beamercolorbox}
   \begin{beamercolorbox}[colsep=1.5pt]{middle separation line foot} \end{beamercolorbox}
   \begin{beamercolorbox}[colsep=1.5pt]{lower separation line foot} \end{beamercolorbox} 
   \begin{beamercolorbox}{section in head/foot}
   	\vskip2pt%
   	\hspace{0.2cm}%
   	\ifx\insertshortauthor\empty\else\insertshortauthor\hspace{0.3cm}\relax\fi
   	\ifx\insertshorttitle\empty\else\insertshorttitle\hspace{0.3cm}\relax\fi
   	\ifdefined\numbering\else\hfill\fi
   	\ifx\insertshortdate\empty\else\insertshortdate\relax\fi
   	\ifdefined\numbering\hfill\insertframenumber\else\fi %
	\hspace{0.2cm} \ %
	\vskip4pt%
   \end{beamercolorbox}  }
  
% slide header
\setbeamertemplate{headline}{
}

% Set colors for headers/footers
\setbeamercolor{section in head/foot}{fg=main,bg=white}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SLIDE TITLE

\setbeamerfont{frametitle}{size=\large,series=\bf}
\setbeamerfont{framesubtitle}{size=\normalsize,shape=\it}

\setbeamertemplate{frametitle}{
    \vs\vs
    \hspace{-0.3cm}\usebeamerfont{frametitle}\insertframetitle
    \ifx\insertframesubtitle\empty\else%
        \vs\\%
        \hspace{-0.3cm}{\color{black!50}\usebeamerfont{framesubtitle}\insertframesubtitle}
    \relax\fi
    \ifdefined\hdrule%
        \vspace{-0.2cm}\\%
        \rule{\textwidth}{0.8pt}%
    \else\relax\fi%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE

\setbeamerfont{title}{size=\large,series=\bf}
\setbeamerfont{subtitle}{size=\large,series=\mdseries,shape=\it}
\setbeamerfont{author}{size=\normalsize}
\setbeamerfont{institute}{size=\normalsize}
\setbeamerfont{date}{size=\normalsize}

\setbeamercolor{title}{fg=main,bg=black!5}
\setbeamercolor{author}{fg=black,bg=white!5}
\setbeamercolor{date}{fg=black,bg=white!5}

\newcommand{\conference}[1]{\def\talk{#1}}

\setbeamertemplate{title page}{%
    \addtocounter{framenumber}{-1}%
    %
    %
    \begin{beamercolorbox}[sep=10pt,center]{title}%
        \usebeamerfont{title}%
        \inserttitle%
        \ifx\insertsubtitle\empty\else%
        		\vspace{0.2cm}\par%
		\usebeamerfont{subtitle}%
		\insertsubtitle%
        \relax\fi%
    \end{beamercolorbox}%
    %
    %
    \begin{beamercolorbox}[sep=20pt,center]{author}%
        \usebeamerfont{author}%
        \insertauthor%
        \ifx\insertinstitute\empty\else\par%
		\vspace{0.3cm}%
		\usebeamerfont{institute}%
		\insertinstitute\\%
	\relax\fi%
    \end{beamercolorbox}%
    %
    %
    \begin{beamercolorbox}[sep=0pt,center]{date}%
	\usebeamerfont{date}%
	\ifdefined\talk%
		\talk\par\vspace{0.3cm}%
	\else\relax\fi%
	\insertdate%
    \end{beamercolorbox}%
    %
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
        \end{minipage}\end{center}
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
\setbeamertemplate{section in toc}{\usebeamercolor[fg]{enumerate item}{%
    {\color{main}\inserttocsectionnumber. \inserttocsection}%
}}%

% Format of subsections in TOC:
\setbeamertemplate{subsection in toc}{\usebeamercolor[fg]{enumerate item}{%
    {\color{main}\inserttocsectionnumber.\inserttocsubsectionnumber. \inserttocsubsection}%
}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LENGTHS AND NEW COMMANDS

\setlength{\parskip}{0mm}

\newcommand{\hs}{\hspace{0.1cm}}
\newcommand{\vs}{\vspace{0.1cm}}

\newcommand{\so}{\ \ \ \Rightarrow \ \ \ }
\newcommand{\under}[1]{\underline{\smash{#1}}}

\newcommand{\paper}[2]{{{\color{main}#1} ({\color{main}#2})}}
\newcommand{\paperalt}[2]{{\color{main}#1, #2}}

\renewcommand{\note}[1]{\textit{\color{black!45}#1}}

\newcommand{\llave}[2]{%
\underbrace{ \addstackgap[4pt] {$#1$} }_{ {\footnotesize\text{\color{main}#2}} } }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIST ENVIROMENTS

\setitemize{itemsep=1.2ex, topsep=1.2ex, leftmargin=15pt}
\setenumerate{itemsep=1.2ex, topsep=1.2ex, leftmargin=20pt}

\setitemize[1]{label={\footnotesize\raise1.5pt\hbox{\donotcoloroutermaths{\color{main}$\bullet$}}}}
\setitemize[2]{label={\footnotesize\raise1.5pt\hbox{\donotcoloroutermaths{\color{main}$\circ$}}}}
\setitemize[3]{label={\footnotesize\raise1.1pt\hbox{\donotcoloroutermaths{\color{main}$-$}}}}

\setenumerate[1]{label={{\color{main}\arabic*.}}}
\setenumerate[2]{label={{\color{main}\alph*.}}}
\setenumerate[3]{label={\color{main}\roman*.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURES AND FIGURES

% Captions
\captionsetup{labelfont={color=main}}
\captionsetup{justification=centering}
\captionsetup{belowskip=5pt}
\captionsetup{aboveskip=5pt}

% Baseline array height
\renewcommand{\arraystretch}{1.0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BLOCKS

\setbeamerfont{block body}{size=\normalsize}
\setbeamercolor{block body}{fg=black,bg=black!5}

\setbeamerfont{block title}{size=\normalsize}
\setbeamercolor{block title}{fg=main,bg=black!10}

\setbeamertemplate{block begin}{%
	\begin{beamercolorbox}[wd=1\linewidth,colsep=6pt]{block title}%
    \usebeamerfont*{block title}\insertblocktitle%
	\end{beamercolorbox}%
	\usebeamerfont{block body}%
	\begin{beamercolorbox}[wd=1\linewidth,sep=8pt]{block body}%
}
\setbeamertemplate{block end}{%
	\end{beamercolorbox}\vskip10pt%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BUTTONS

\newcommand{\button}[2]{\raise-2pt\hbox{\hyperlink{#1}{\beamerbutton{\raise0.5pt\hbox{#2}}}}}
\setbeamercolor{button}{bg=main!10,fg=black}
\setbeamercolor{button border}{fg=main}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	





