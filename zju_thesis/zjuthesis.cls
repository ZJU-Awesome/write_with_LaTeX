\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}[2014/09/12 zjuthesis document class. Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

\LoadClass[cs4size,a4paper,fancyhdr,fntef,oneside,openany,cap]{ctexbook}

\makeatletter
\let\OLDappendix\appendix
\newif\if@appendixinbackmatter
\renewenvironment{appendix}
{
  \if@mainmatter
     \@appendixinbackmatterfalse\OLDappendix
  \else
      \@appendixinbackmattertrue\@mainmattertrue\OLDappendix
 \fi
}
\makeatother

%%%%%%%%%% 页面设置 %%%%%%%%%%
\RequirePackage[
	left=2.4cm,
	right=2.2cm,
	top=2.8cm,
	bottom=2.2cm,
	% headsep=0.25cm,
	% headheight=1.5cm,
	% footskip=0.79cm
]{geometry}

\RequirePackage{amsmath}		%数学公式
\RequirePackage{bm}				%公式中的粗体
\RequirePackage{cases}			%公式中的括号，例如subnumcases环境
\RequirePackage{graphicx}		%插图包
\RequirePackage{paralist}		%列表宏包
\RequirePackage{booktabs}		%三线表

%%%%%%%%%% 页眉页脚 %%%%%%%%%%
% \RequirePackage{fancyhdr}				% ctexbook中已经有fancyhdr选项，因此此宏包不用再次添加
\fancypagestyle{plain}{%
  \fancyhf{}							% 先清除当前页面的页眉页脚定义，是fancyhdr包中的定义
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\zihao{-5} \thepage}	% 改变plain默认样式的页码字体大小
  % 如果想在每章首页也有页眉，就将以下两段注释取消掉，并且修改上面的\headrulewidth（默认为0.4pt）！！
  % \fancyhead[L]{\songti\zihao{-5}浙江大学博（硕）士学位论文}
  % \fancyhead[R]{\songti\zihao{-5}\leftmark}
}
\pagestyle{fancy}
	\fancyhf{}
    \fancyhead[L]{\songti\zihao{-5}浙江大学博（硕）士学位论文}
    \fancyhead[R]{\songti\zihao{-5}\leftmark}
    \fancyfoot[C]{\zihao{-5} \thepage}

%%%%%%%%%% 本机字体设置 %%%%%%%%%%
\RequirePackage{fontspec}
\setmainfont{Times New Roman}	%MS Word中的Times New Roman。
\setsansfont{TeX Gyre Heros}	%相当于MS Word中的Helvetica。
\setmonofont{TeX Gyre Cursor}	%相当于MS Word中的Curier。
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont={SimHei}, ItalicFont={KaiTi}]{FangSong}		%设置中文正文字体为仿宋，加粗为黑体，斜体为楷体
% \setCJKsansfont{}				%中文无衬线字体，不知道怎么设置，待以后解决。
\setCJKmonofont{YouYuan}		%由于汉字都是等宽的，等宽字体通常应用在代码中，故这里选择用幼圆字体，具体有待以后更改。

%%%%%%%%%% 层次标题格式设置 %%%%%%%%%%
\setcounter{secnumdepth}{4}		%设置为四级标题
%%章标题格式设置----小三仿宋加黑
\CTEXsetup[
	name={,},
	number={\arabic{chapter}},
	format={\raggedright},
	nameformat={\zihao{-3}\bfseries},
	titleformat={\fangsong\zihao{-3}\bfseries}
]{chapter}

%%一级节标题格式设置----四号仿宋加黑
\CTEXsetup[
	format={\raggedright},
	nameformat={\zihao{4}\bfseries},
	titleformat={\fangsong\zihao{4}\bfseries}
]{section}

%%二级节标题格式设置----小四号仿宋
\CTEXsetup[
	format={\raggedright},
	nameformat={\zihao{-4}},
	titleformat={\fangsong\zihao{-4}}
]{subsection}

%%三级节标题格式设置----小四号仿宋
\CTEXsetup[
	format={\raggedright},
	nameformat={\zihao{-4}},
	titleformat={\fangsong\zihao{-4}}
]{subsubsection}

%%%%%%%%%% 目录（目次） %%%%%%%%%%
\RequirePackage{tocloft}
% tocbibind宏包将参考文献、目录等放入目录中。
\RequirePackage[chapter]{tocbibind}
%% 章节目录
\renewcommand{\contentsname}{目\hspace{1em}次}				% 重命名章节目录名，这里不用\CTEXoption{}。
\renewcommand{\cfttoctitlefont}{\hfill\fangsong\zihao{3}}	% 与下面一句命令搭配使“目次”居中。
\renewcommand{\cftaftertoctitle}{\hfill}
% \renewcommand{\cftdot}{\ensuremath{\cdot}}					% 目录“点”的样式。
\renewcommand{\cftdotsep}{2.2}								% 修改点之间的距离（全局），已经调整完毕！
\newlength{\mycontentsdotskip}								% 新建调整目录行距的长度命令。
\setlength{\mycontentsdotskip}{4.6pt}						% 距离已经按照模板示例调整完毕！
% chapter
\renewcommand{\cftchapfont}{\fangsong\zihao{-4}}
\renewcommand{\cftchapdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchappagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforechapskip}{\mycontentsdotskip}
% section
\renewcommand{\cftsecfont}{\fangsong\zihao{-4}}
\renewcommand{\cftsecdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforesecskip}{\mycontentsdotskip}
\setlength{\cftsecindent}{0pt}
% subsection
\renewcommand{\cftsubsecfont}{\fangsong\zihao{-4}}
\renewcommand{\cftsubsecdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}}
\renewcommand{\cftsubsecpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforesubsecskip}{\mycontentsdotskip}
\setlength{\cftsubsecindent}{0pt}
% 以下代码是为解决CTEX包或类文件与tocloft包产生冲突导致在目录中标题项重叠的问题。
\makeatletter
\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.5em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi%
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}
\makeatother

%%%%%%%%%% hyperref(放最后)%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	hidelinks,					% 隐藏超链接的颜色和边框。
	% draft,						% 草稿模式，提高编译速度，需要时注释掉就可以了。
	pdfinfo={					% 这是pdf中显示的信息，不要就注释掉好了o(^▽^)o。
		Title={这是一个伟大的模板},
		Author={Bruce,Sky}
		}
	}

%%%%%%%%%% 参考文献样式 %%%%%%%%%%
\bibliographystyle{GBT7714-2005NLang-ZJU}

