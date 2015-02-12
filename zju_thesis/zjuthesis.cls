\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}[2014/09/12 zjuthesis document class. Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

\LoadClass[cs4size,a4paper,fancyhdr,fntef,oneside,openany,cap,hyperref]{ctexbook}

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

%%%%%%%%%% 参考文献样式 %%%%%%%%%%
\bibliographystyle{GBT7714-2005NLang-ZJU}

