
# bpslides.cls: A Beamer template for academic presentations

This repository contains a simple Beamer template for academic presentations.

```LaTex
\documentclass[numbering,toc,blue,wide]{bpslides}
```

You can find an example here: [.tex file](example/example.tex) and [.pdf file](example/example.pdf).

**Note**: The user can still use any option compatible with the ```beamer``` class such ```handout```, font size, etc.

_This code is distributed under the [MIT License](LICENSE)_

## Options

Main options:

- ```numbering```: include slide numbers in the (right) footer
- ```numbertotal```: include slide number and total number of slides in the (right) footer
- ```toc```: include a table of contents at the beginning of each section and include the section title in the (right) footer. If this option is not selected but the user defines sections in the document, section headings will show up in a separate slide at the beginning of each section.
- ```wide```: change the aspect ratio of the slides from 4:3 (default) to 16:9

Font typefaces:
- Sans-serif (option: ```sans```; _default_)
- Helvetica (option: ```helvetica```)
- Palatino (option: ```palatino```)
- Bookman (option: ```bookman```)
- Termes (option: ```termes```)
- Adventor (option: ```adventor```)

Colors:
- ```green``` (_default_)
- ```red```
- ```blue```
- ```orange```
- ```black```
- ```magenta```
- ```purple```

## New commands for the preambule

- **```conference```**: display the place hosting the talk in the title page using ```\conference{ ... }``` in the preamble.
- **```disclaimer```**: display a footnote in the title page using ```\disclaimer{ ... }``` in the preamble.
- **```foot```**: display some user-defined text in the bottom-left corner of slides, using ```\foot{...}```.


A "complete" preambule would be:

```Latex
\title{Title of your presentation}
\subtitle{Subtitle of the presentation}
\author{Author 1\inst{1} \and Author 2\inst{2} \and Author 3\inst{3}}
\institute{\inst{1} Institution 1, \  \inst{2} Institution 2, \  \inst{3} Institution 3}
\conference{Conference/university hosting the talk}
\date{\today}
\disclaimer{The opinions and analyses in this paper ...}
\foot{Whatever you want to write}
```

## New commands for the main text

- ```\paper{Author}{Year}``` displays a reference with format "Author (Year)".
- ```\paperalt{Author}{Year}``` displays a reference with format "Author, Year".
- ```\alert{Lorem ipsum$}``` displays "Lorem ipsum" in the main color.
- ```\note{Lorem ipsum}``` displays "Lorem ipsum" in gray and italics.
- ```\under{Lorem ipsum}``` underlines "Lorem ipsum".
- ```\boxed{Lorem ipsum}``` displays "Lorem ipsum" in a box.
- ```\vs``` equivalent to ```\vspace{0.1cm$}```.
- ```\hs``` equivalent to ```\hspace{0.1cm$}```.

## New commands for math mode


- ```\so``` displays a long right-arrow.
- ```\mathpause``` equivalent to ```\pause```, but redesigned to avoid the extra vertical spacing.
- ```\eqboxed{x = 0}``` displays x = 0 in a box (similar to ```\boxed{ }```).
- ```\llave{x=a}{text}``` draws a brace under ```x=a``` and displays a text ```text``` in math environment.

    ```latex
    \begin{equation}
        \llave{ x = \dfrac{-b \pm \sqrt{b^2 - 4ac}}{2a} }{ Solution }
    \end{equation}
    ```

## Default packages

- ```inputenc```: text encoding (loads option ``utf8``)
- ```amssymb```, ```amsmath```, ```amsthm```: math expressions, symbols and theorems.
- ```graphicx```: include figures.
- ```enumitem```: formatting ```itemize``` and ```enumerate``` environments.
- ```booktabs```: nice separation lines for tables.
- ```caption```: customize figure/table captions.
- ```subcaption```: include subfigures.
- ```stackengine```:  stack objects vertically (used for the ```\llave``` command).
- ```ulem```: nicer underline environment (used for the ```\under``` command).
- ```multirow```: merge multiple rows/columns in tables.
- ```tcolorbox```: include coloured boxes  (used for the ```\boxed{}``` and ```\eqboxed{}``` commands, as well as to re-define the ```block``` environment)