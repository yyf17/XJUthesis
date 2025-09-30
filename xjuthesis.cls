%  This is file `xjuthesis.cls'.
% ----------------------------------------------------------------------------
%  This file provides a LaTeX document class for typesetting thesis of
%  Xinjiang University, Ürümqi, China.
%  Version: 2023/07/16 v1.0
% ----------------------------------------------------------------------------
%  Copyright (C) 2023-2023 Turgun imin, email: turgun_0205@163.com
%  License: GNU General Public License, version 3


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\LoadClass[cs4size,a4paper,oneside]{ctexbook} % 默认小四号（12pt）字

\RequirePackage{etoolbox}
%\RequirePackage{kvoptions}
%\SetupKeyvalOptions{
%	family=xju,
%	prefix=xju@,
%	setkeys=\kvsetkeys}
%
%\DeclareBoolOption{print}
%\DeclareBoolOption{secret}
%
%\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
%\ProcessKeyvalOptions*\relax

% 页面布局 %
%----------------------------------------------%

\RequirePackage{geometry}
\geometry{
	a4paper,
	top=30.0mm,
	bottom=30.0mm,
	left=30.0mm,
	right=30.0mm,
	headheight=3.5mm, 
	headsep=4.5mm,
	footskip=8.0mm,
}

\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}

\ctexset{
	punct=quanjiao,
	space=auto,
	autoindent=true} % 首行缩进2字符

\setlength{\baselineskip}{20pt} % 默认行距为固定值20磅

\raggedbottom
\setlength{\parskip}{\z@} % 默认段间距0磅
%\titlespacing*{\paragraph}{0pt}{0pt}{0pt} % 默认段前空0磅，段后空0磅

% 默认字体设置 %
%----------------------------------------------%

\RequirePackage{xeCJK}
\RequirePackage{ctex}

\setmainfont{Times New Roman} % 英文默认新罗马
\setsansfont{Arial}
\setmonofont{Courier New}
%\setmonofont{Consolas}

\newfontfamily\timesnewroman{Times New Roman}
\newfontfamily\arial{Arial}
\newfontfamily\couriernew{Courier New}
\newfontfamily\century{Century}

\setCJKmainfont{SimSun} % 中文默认宋体
\setCJKmonofont{SimHei}

\setCJKfamilyfont{heiti}{SimHei}
\renewcommand{\heiti}{\CJKfamily{heiti}}

\setCJKfamilyfont{hwxk}{华文行楷}
\newcommand{\hwxk}{\CJKfamily{hwxk}}

%\newfontfamily\stfont{宋体}
%\newfontfamily\htfont{SimHei}

\let\songti\relax
\newCJKfontfamily[song]\songti{SimSun}[AutoFakeBold]
\let\heiti\relax
\newCJKfontfamily[hei]\heiti{SimHei}[AutoFakeBold]

% 自定义字号 %
%----------------------------------------------%

\def\define@fontsize#1#2{%
	\expandafter\newcommand\csname #1\endcsname[1][20pt]{
		\fontsize{#2}{##1\dimexpr #2}\selectfont}}

\define@fontsize{chuhao}{42bp}
\define@fontsize{xiaochu}{36bp}
\define@fontsize{yihao}{26bp}
\define@fontsize{xiaoyi}{24bp}
\define@fontsize{erhao}{22bp}
\define@fontsize{xiaoer}{18bp}
\define@fontsize{sanhao}{16bp}
\define@fontsize{xiaosan}{15bp}
\define@fontsize{sihao}{14bp}
\define@fontsize{banxiaosi}{13bp}
\define@fontsize{xiaosi}{12bp}
\define@fontsize{dawu}{11bp}
\define@fontsize{wuhao}{10.5bp}
\define@fontsize{xiaowu}{9bp}
\define@fontsize{liuhao}{7.5bp}
\define@fontsize{xiaoliu}{6.5bp}
\define@fontsize{qihao}{5.5bp}
\define@fontsize{bahao}{5bp}

\def\cleardoublepage{%
	\clearpage
	\if@twoside
		\ifodd
			\c@page
		\else
			\thispagestyle{empty}
					\hbox{}\newpage
				\if@twocolumn
			\hbox{}\newpage
			\fi
		\fi
	\fi}

\RequirePackage{pdfpages}
\RequirePackage{array}

\def\xju@def@term#1{
	\expandafter\gdef\csname #1\endcsname##1{%
		\expandafter\gdef\csname xju@#1\endcsname{##1}}
	\csname #1\endcsname{}}

\xju@def@term{degreetype}
\xju@def@term{cntitle}
\xju@def@term{entitle}
\xju@def@term{author}
\xju@def@term{subject}
\xju@def@term{researchinterest}
\xju@def@term{advisor}
\xju@def@term{advisortitle}
\xju@def@term{defenddate}
\xju@def@term{authorizedate}
%\xju@def@term{decryptiondate}
\xju@def@term{declarationdate}

\newif\ifprint
\printtrue

\RequirePackage{afterpage}
\newcommand\emptypage{
	\null
	\thispagestyle{empty}
	\addtocounter{page}{-1}
	\newpage
}

%----------------------封面------------------------

\RequirePackage{makecell}
\RequirePackage{tabularx}

\newcommand\maketitilepage{
	\cleardoublepage
	\phantomsection
	\thispagestyle{empty}
	\begin{center}
			\parbox[t][][t]{\textwidth}
			{
				\vspace*{\fill}
				\heiti\xiaosan\xju@degreetype 学位论文
				\vspace*{\fill}
			}
		
			\parbox[t][6cm][t]{\textwidth}
			{ 
				\begin{center}
					\vspace*{\fill}
					\hwxk\chuhao\ziju{0.5} 新疆大学
					\vspace*{\fill}
				\end{center}
			}
			\\[0.4cm]

			\parbox[t][10cm][t]{\textwidth}
			{
				\raggedleft
				\xiaosan\bfseries
				\setlength{\intextsep}{0pt}
				\setlength{\extrarowheight}{0pt}
				
				\begin{tabularx}{\textwidth}{p{5.5cm}X}
					
					\makebox[10.7em][s]{\hspace{1cm}论\hspace{\fill}文\hspace{\fill}题\hspace{\fill}目\hspace{\fill}（\hspace{\fill}中\hspace{\fill}文\hspace{\fill}）：} &  
					
					\begin{minipage}[t]{\linewidth}
						\xju@cntitle
					\end{minipage} \\
					
					\vspace*{\dimexpr 20pt - \baselineskip}
					\makebox[10.7em][s]{\hspace{1cm}论\hspace{\fill}文\hspace{\fill}题\hspace{\fill}目\hspace{\fill}（\hspace{\fill}英\hspace{\fill}文\hspace{\fill}）：} &  
					
					\vspace*{\dimexpr 20pt - \baselineskip}
					\begin{minipage}[t]{\linewidth}
						\xju@entitle
					\end{minipage} \\
				
				\end{tabularx}
				
 				\vspace*{\dimexpr 33pt - \baselineskip}
				\begin{tabular}{p{5cm}p{\textwidth}}
					\makebox[10em][s]{\hspace{1cm}研\hspace{\fill}究\hspace{\fill}生\hspace{\fill}姓\hspace{\fill}名：}& \xju@author \\ 
					\makebox[10em][s]{\hspace{1cm}学\hspace{\fill}科：}   & \xju@subject    \\ 
					\makebox[10em][s]{\hspace{1cm}研\hspace{\fill}究\hspace{\fill}方\hspace{\fill}向：}   & \xju@researchinterest    \\
					\makebox[10em][s]{\hspace{1cm}导\hspace{\fill}师\hspace{\fill}姓\hspace{\fill}名\hspace{\fill}及\hspace{\fill}职\hspace{\fill}称\hspace{\fill}：}   & \xju@advisor~\xju@advisortitle    \\ 
				\end{tabular}
			}
		\\[3cm]

		\hfill
		\begin{minipage}{0.5\textwidth}
			\hspace{-2cm}
			\parbox[r][][r]{\textwidth}
			{
				\xiaosan\heiti\arial
					\makebox[\textwidth][t]{论文答辩日期\hspace{1em}\xju@defenddate}
					\makebox[\textwidth][t]{学位授予日期\hspace{1em}\xju@authorizedate}
			}
		\end{minipage}
	\end{center}
	\clearpage
}

% 页眉页码 %
%----------------------------------------------

\RequirePackage{fancyhdr}
\RequirePackage{zhnumber}
%% 自定义页眉页脚样式
%\pagestyle{fancy}
%\fancyhead{} % 清空页眉内容
%\renewcommand{\headrulewidth}{0pt}
%\fancyfoot{} % 清空页脚内容
%\fancyfoot[C]{\thepage} % 页码居中显示在页脚

\fancypagestyle{empty}{
	\fancyfoot{}
	\fancyhead{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{
	\pagestyle{fancy}
	\fancyhead{}
	\fancyhead{}
	\fancyhead[C]{\songti\wuhao\nouppercase{\leftmark}}
	\renewcommand{\headrulewidth}{0.4bp}
}

%\fancypagestyle{plain}{%
%	\fancyhf{}
%	\cfoot{\thepage}
%	
%	
%}

\fancypagestyle{headings}{
	\fancyhf{}
	\fancyhead[C]{\songti\wuhao\nouppercase{\leftmark}}
	\fancyfoot[C]{\wuhao\thepage}
	\renewcommand{\headrulewidth}{0.4pt} % 设置页眉分隔线宽度
	\renewcommand{\footrulewidth}{0pt} % 设置页脚分隔线宽度
}


\renewcommand\frontmatter{
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{plain}
}

\renewcommand\mainmatter{
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{headings}
}

\ctexset{chapter/pagestyle=headings}

% 摘要 %
%----------------------------------------------%

% 中文摘要
\newcommand\cnkeywords[1]{\noindent{\songti\bfseries 关键词：}#1}
\newenvironment{cnabstract}{
	\chapter*{摘\hspace{\ccwd}要}
	\markboth{摘\hspace{\ccwd}要}{} % 在这里手动设置页眉内容
	}{
		\clearpage
	}

% 英语摘要
\newcommand\enkeywords[1]{\noindent{\xiaosi\bfseries Key Words: }#1}
%\newenvironment{enabstract}{
%	\chapter*{\arial\bfseries Abstract}
%	\markboth{Abstract}{}
%}{
%	\clearpage
%}

\newenvironment{enabstract}{
				\newpage
				\fancyhead[C]{Abstract}
				\renewcommand{\headrulewidth}{0.4pt}
				\vspace*{-2pt}
				\centerline{\sanhao\arial\bfseries Abstract}
				\vspace*{11pt}
			}{
				\clearpage
			}


% 目录 %
%----------------------------------------------%

%\RequirePackage{titletoc}
%\RequirePackage{titlesec}
%
% 设置章节名称的格式
%\titleformat{\chapter}
%	{\centering\sanhao\heiti\arial} % 章节名称的格式
%	{第 \thechapter 章} % 标题编号的格式
%	{1em} % 章节名称和标题内容之间的间距
%	{}
%	
%\titlespacing*{\chapter}{0pt}{24pt}{18pt}
%
%\titleformat{\section}
%	{\sihao\heiti\arial} % 章节名称的格式
%	{\thesection} % 标题编号的格式
%	{1em} % 章节名称和标题内容之间的间距
%	{}
%	
%\titlespacing*{\section}{0pt}{24pt}{6pt}
%
%\titleformat{\subsection}
%	{\banxiaosi\heiti\arial} % 章节名称的格式
%	{\thesubsection} % 标题编号的格式
%	{1em} % 章节名称和标题内容之间的间距
%	{}
%
%\titlespacing*{\subsection}{0pt}{12pt}{6pt}
%
%\titleformat{\subsubsection}
%	{\xiaosi\heiti\arial} % 章节名称的格式
%	{\thesubsubsection} % 标题编号的格式
%	{1em} % 章节名称和标题内容之间的间距
%	{}
%
%\titlespacing*{\subsection}{0pt}{12pt}{6pt}

%% 调整目录的格式
%\titlecontents{chapter}
%	[0pt]
%	{\heiti\htfont\sanhao}
%	{\bf\thecontentslabel\hspace{\ccwd}}
%	{\bf}
%	{\hspace{.5em}\titlerule*{.}\contentspage}
%
%\titlecontents{section}
%	[2\ccwd]
%	{\songti \zihao{-4}}
%	{\thecontentslabel\hspace{\ccwd}}{}
%	{\hspace{.5em}\titlerule*{.}\contentspage}
%	
%\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
%	{\thecontentslabel\hspace{\ccwd}}{}
%	{\hspace{.5em}\titlerule*{.}\contentspage}


\RequirePackage{tocloft}


\setcounter{tocdepth}{2}
\renewcommand{\cftdot}{…}
\renewcommand{\cftdotsep}{0}

\renewcommand{\contentsname}{目\hspace{\ccwd}录}
\renewcommand{\cfttoctitlefont}{\hfill\sanhao\heiti}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{2 bp}
\renewcommand{\cftaftertoctitleskip}{18 bp}

\renewcommand{\cftchapfont}{\xiaosi\heiti\arial}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchappagefont}{\xiaosi\arial} 
\renewcommand{\cftbeforechapskip}{0bp}

\renewcommand{\cftsecfont}{\xiaosi}
\renewcommand{\cftbeforesecskip}{0bp}
\renewcommand{\cftsecpagefont}{\xiaosi} 

\renewcommand{\cftsubsecfont}{\xiaosi}
\renewcommand{\cftbeforesubsecskip}{0bp}
\renewcommand{\cftsubsecpagefont}{\xiaosi} 

\renewcommand{\cftsecindent}{1em}
\renewcommand{\cftsubsecindent}{2em}



% 主要符号对照表 %
%----------------------------------------------%

\newenvironment{denotation}{
	\chapter*{主要符号对照表}
	\markboth{主要符号对照表}{}
}{
	\clearpage
}


% 章节标题 %
%----------------------------------------------%

\RequirePackage{ctex}

\setcounter{secnumdepth}{3}

\ctexset{
	chapter = {
		format={\centering\sanhao\heiti\arial},
		aftername=\hspace{\ccwd},
		beforeskip={24pt},
		afterskip={18pt},
		name={第, 章},
		fixskip = true,
		number=\arabic{chapter},
		indent=0pt,
	},
	section = {
		format={\sihao\heiti\arial},
		aftername=\hspace{\ccwd},
		beforeskip={24pt},
		afterskip={6pt},
		fixskip = true,
	},
	subsection = {
		format={\banxiaosi\heiti\arial},
		aftername=\hspace{\ccwd},
		beforeskip={12pt},
		afterskip={6pt},
		fixskip = true,
	},   
	subsubsection = {
		format={\xiaosi\heiti\arial},
		aftername=\hspace{\ccwd},
		beforeskip={12pt},
		afterskip={6pt},
		fixskip = true,
	}
}

% 脚注 %
%----------------------------------------------%

\RequirePackage{pifont}
\RequirePackage[perpage,hang]{footmisc}

%\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}

\def\xju@textcircled#1{%
	\ifnum\value{#1}>9
		\ClassError{xjuthesis}%
			{Too many footnotes in this page.}{Keep footnote less than 10.}
	\fi
	\ding{\the\numexpr\value{#1}+171\relax} % 
}

\renewcommand{\thefootnote}{\xju@textcircled{footnote}}
\renewcommand{\thempfootnote}{\xju@textcircled{mpfootnote}}

\def\footnoterule{\vskip-4\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip4\p@} % 脚注线的设置
\setlength{\footnotesep}{0pt} % 脚注间的段距 
\let\xju@footnotesize\footnotesize
\renewcommand\footnotesize{\xju@footnotesize\songti\xiaowu[1]} % 脚注字体

\footnotemargin1em\relax % 悬挂缩进1.5字符
\interfootnotelinepenalty=10000  %% footnote 尽量不分页

\let\xju@makefnmark\@makefnmark
\def\xju@@makefnmark{\hbox{{\normalfont\@thefnmark}}} % 标记为正常文本大小
\pretocmd{\@makefntext}{\let\@makefnmark\xju@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\xju@makefnmark}{}{}


% 列表 %
%----------------------------------------------%

\RequirePackage{enumerate}
\RequirePackage{enumitem}

\setlist{noitemsep,nosep}
\setlist[enumerate]{label=(\arabic*)}

% 浮动设置 %
%----------------------------------------------%

\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}

% 设置浮动对象和文字之间的距离
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt} 
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}

\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}

% 图片 %
%----------------------------------------------%

\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{float}

\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.tif}
\graphicspath{{figures/}{figure/}{pictures/}%
	{picture/}{pic/}{pics/}{image/}{images/}}

\DeclareCaptionFont{songti}{\songti}
\DeclareCaptionFont{dawu}{\dawu}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\renewcommand*{\thefigure}{\thechapter.\arabic{figure}}

\renewenvironment{figure}
{
	\setlength\abovecaptionskip{6pt} %% 调整标题与图片距离
	\setlength\belowcaptionskip{12pt} %% 调整标题与下文距离
	\@float{figure}
}
{\end@float}

\captionsetup[figure]{
	justification=justified,
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=zhspace,     % 分隔符是一个空格
	font={songti, dawu, stretch=1},   % 图的字体, 宋体小四, 单倍行距
}

% 子图布局

\RequirePackage{subcaption}

\captionsetup[subfigure]{singlelinecheck=off,justification=centering}
\renewcommand\p@subfigure{\thefigure{}} % 引用时的样式
\renewcommand\thesubfigure{(\alph{subfigure})} 
\captionsetup[sub]{
	labelformat=simple
} % 子图引用格式

% 表格 %
%----------------------------------------------%

\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{tabularx}

\renewcommand{\thetable}{\thechapter.\arabic{table}}

\captionsetup[table]{
	justification=justified,
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=zhspace,     % 分隔符是一个空格
	font={songti, dawu, stretch=1},   % 表的字体, 宋体小四
	position=top,
}

\renewenvironment{table}
{%\vspace{0.3cm}  % 调整表格与上文距离
	\setlength\abovecaptionskip{6pt} %% 调整标题与表格距离
	\setlength\belowcaptionskip{12pt} %% 调整标题与下文距离
	\@float{table}}
{\end@float}

% 长表格布局



% 子表布局
%\renewcommand\thesubtable{(\alph{subtable})}
%
%\let\xju@LT@array\LT@array
%\def\LT@array{\wuhao[1.5]\xju@LT@array} % set default font size
%
%\let\xju@oldtabular\tabular
%\let\xju@endoldtabular\endtabular
%\renewenvironment{tabular} {
%	\bgroup
%	\renewcommand{\arraystretch}{1.38}
%	\xju@oldtabular
%}{
%	\xju@endoldtabular\egroup
%}


% 公式 %
%----------------------------------------------%

\RequirePackage{amsmath}
\RequirePackage{ntheorem}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{unicode-math}
\RequirePackage{wasysym}


\allowdisplaybreaks[4] %允许公式跨页面显示

\setmathfont{Latin Modern Math}% 公式字体
%\setmathfont{STIX Two Math}
%\setmathfont{XITS Math} 
%\setmathfont{Cambria Math}

\setmathfont[range={\mathbb,\mathcal}]{TeXGyrePagellaMath-Regular}

\renewcommand\theequation{\thechapter.\arabic{equation}}

\AtBeginDocument{
	\abovedisplayskip = 6bp \@plus 3bp \@minus 6bp
	\belowdisplayskip = \abovedisplayskip
	\abovedisplayshortskip = 0 bp \@plus 3bp
	\belowdisplayshortskip = 6bp \@plus 3bp \@minus 3bp
}

\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}

% 算法 %
%----------------------------------------------%

\RequirePackage{algorithm}
\RequirePackage{algorithmic}

\floatname{algorithm}{算法}
\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}}
\captionsetup[algorithm]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=zhspace,     % 分隔符是一个空格
	font={songti, dawu},   % 表的字体, 宋体小四
	position=top
}

\algsetup{linenosize=\dawu} 
\scriptsize

\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}


% 代码 %
%----------------------------------------------%

\RequirePackage{color}
\RequirePackage{listings}
\RequirePackage{xcolor}

\definecolor{codegreen}{rgb}{0.4660 0.6740 0.1880}
\definecolor{codepurple}{rgb}{0.4940 0.1840 0.5560}
\definecolor{codeorange}{rgb}{0.9290 0.6940 0.1250}

\lstset{
	basicstyle=\ttfamily,
	numbers=left,
	numberstyle=\timesnewroman,
	commentstyle=\heiti\couriernew\color{codepurple},
	keywordstyle=\color{codeorange},
	stringstyle=\color{codegreen},
	morekeywords={},
%	emph={main},
	emphstyle=\color{magenta},
	stepnumber=1,
	columns=fixed, 
	numbersep=5pt,
	backgroundcolor=\color{white},
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	frame=single,
	tabsize=2,
	captionpos=b,
	breaklines=true,
	breakatwhitespace=false,
	escapeinside={<@}{@>},
	lineskip=1pt, 
}
% 定义，定理，引理，证明 %
%----------------------------------------------%

\renewtheoremstyle{plain}
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}
{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\ ##3\theorem@separator]}
\theoremsymbol{$\blacksquare$}
\setlength{\theorempreskipamount}{0pt}
\setlength{\theorempostskipamount}{-2pt}
\setlength{\parindent}{2em}
\arraycolsep=1.6pt

\newtheorem{theorem}{\songti\bfseries 定理}[chapter]
\newtheorem{lemma}{\songti\bfseries 引理}[chapter]
\newtheorem{proposition}{\songti\bfseries 命题}[chapter]
\newtheorem{corollary}{\songti\bfseries 推论}[chapter]
\newtheorem{definition}{\songti\bfseries 定义}[chapter]
\newtheorem{example}{\songti\bfseries 例}[chapter]
\newtheorem{remark}{\songti\bfseries 注}[chapter]
\renewcommand{\thetheorem}{\arabic{section}.\arabic{theorem}}
\newtheorem*{proof}{\songti\bfseries 证明}
\newenvironment{solution}{\begin{proof}[\songti\bfseries 解]}{\end{proof}}

% 参考文献 %
%----------------------------------------------%

\RequirePackage{cite}
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical}

\RequirePackage{natbib}

\setlength{\bibsep}{0pt} % 设置参考文献条目之间的间距为0pt
\setlength{\bibhang}{3pt} % 设置参考文献条目的段前空间为3em
\AtBeginEnvironment{thebibliography}{\setstretch{1.5}} % 16pt行距


% 附录 %
%----------------------------------------------%

\renewcommand\backmatter{%
	\titleformat{\chapter}
	{\filcenter\sanhao\heiti\arial}
	{附录\,\thechapter\,}
	{1em}
	{}
	
	\titlespacing*{\chapter}{0pt}{3pt}{18pt}
}

% 致谢 %
%----------------------------------------------%

\newenvironment{acknowledgement}{
	\cleardoublepage % 新起一页
	\phantomsection % 设置虚拟的章节，用于正确引用目录页码
	\fancyhead[C]{致\hspace{\ccwd}谢} %添加页眉内容
	\addcontentsline{toc}{chapter}{致谢} % 将致谢环境添加到目录中
	\setlength{\baselineskip}{20pt}
	\setlength{\parindent}{2em}
	\vspace*{-2pt}
	\centerline{\sanhao\heiti 致\quad{}谢}
	\vspace*{11pt}
}{
	\clearpage
}

% 学位论文独创性声明及学位论文知识产权权属声明 %
%----------------------------------------------%

\newcommand\makecopyright{
%	\clearpage
	\cleardoublepage
	\phantomsection
	\fancyhead[C]{学位论文独创性声明及学位论文知识产权权属声} %添加页眉内容
	\addcontentsline{toc}{chapter}{学位论文独创性声明及学位论文知识产权权属声明}
	\begin{center}
		\heiti\sanhao
		\vspace*{-5pt}
		学位论文独创性声明\par
		\vspace*{18pt}
	\end{center}
	\hspace{2\ccwd}本人声明，所呈交的学位论文系本人在导师指导下独立完成的研究成果。文中依法引用他人的成果，均已做出明确标注或得到许可。论文内容未包含法律意义上已属于他人的任何形式的研究成果，也不包含本人已用于其他学位申请的论文或成果。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。
	
	本人如违反上述声明，愿意承担由此引发的一切责任和后果。\par
	
	\parbox[t][][t]{\textwidth}
	{	
		\vspace*{\fill}
		\begin{tabular}{m{8cm}l}
			\makebox[\textwidth][t]{论文作者签名：\includegraphics[height=1.2\baselineskip]{authorsignature}} &  \makebox[\textwidth][t]{日期：\xju@declarationdate}
		\end{tabular}
		\vspace*{\fill}
	}
	
	\vspace{4em}
	
	\begin{center}
		\heiti\sanhao
		\vspace{24pt}
		学位论文知识产权权属声明\par
		\vspace{18pt}
	\end{center}
	\hspace{2\ccwd}本人的学位论文是在学期间在导师指导下完成的，知识产权归属学校。学校享有以任何方式发表、复制、公开阅览、借阅以及申请专利等权利。本人离校后发表或使用学位论文或与该论文直接相关的学术论文或成果时，署名单位仍然为新疆大学。
	
	本学位论文属于：\par

%	保~密 $ \CheckedBox $ ，在 年 月解密后适用于本声明。\par
%	不保密 $ \Square $ 。\par

	保~密 $ \Square $ ，在~~~~~~~~~~年~~~~~~~月解密后适用于本声明。\par
	不保密 $ \CheckedBox $ 。\par
	
	（请在以上方框内打“$ \checked $”）\par
	
	\parbox[t][][t]{\textwidth}
	{	
		\vspace*{\fill}
		\begin{tabular}{m{8cm}l}
			\makebox[\textwidth][t]{论文作者签名：\includegraphics[height=1.2\baselineskip]{authorsignature}} & 
			日期：\xju@declarationdate  \\ 
			
			\makebox[\textwidth][t]{导师签名：\includegraphics[height=1.2\baselineskip]{advisorsignature}} &  \makebox[\textwidth][t]{日期：\xju@declarationdate}  \\
		\end{tabular}
		\vspace*{\fill}
	}
	\clearpage
}


% 个人简历、在学期间发表的学术论文与研究成果 %
%----------------------------------------------%

\newenvironment{achievements}{
	\cleardoublepage
	\phantomsection
	\fancyhead[C]{个人简历、在学期间发表的学术论文与研究成果} %添加页眉内容
	\addcontentsline{toc}{chapter}{个人简历、在学期间发表的学术论文与研究成果}
	\setlength{\baselineskip}{20pt}
	\setlength{\parindent}{2em}
	\vspace*{-2pt}
	\centerline{\sanhao\heiti 个人简历、在学期间发表的学术论文与研究成果}
	\vspace*{11pt}
}{
	\clearpage
}



\endinput
