\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}[2014/09/12 zjuthesis document class. Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

\LoadClass[cs4size,a4paper,fancyhdr,fntef,oneside,openany,cap]{ctexbook}

%%%%%%%%%% Option %%%%%%%%%%
% 博士、硕士可选参数，用于区别格式
\newif\if@doctor
\DeclareOption{doctor}{\@doctortrue}
\DeclareOption{master}{\@doctorfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

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

%%%%%%%%%% 全局命令定义 %%%%%%%%%%
\newcommand\ZJUspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}	% 用以产生2个字符空格。

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
\RequirePackage{ulem}			%下划线

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

%%%%%%%%%%% 封面及中英标题页 %%%%%%%%%%
% 定义封面及标题页设置中常用的下划线命令（默认宽度90pt）
\renewcommand\ULthickness{0.7pt}			% 重新定义下划线的厚度
\newcommand\ZJUunderline[2][90pt]{\hskip1pt\uline{\hbox to #1{\hss#2\hss}}\hskip3pt}
% 重新定义\maketitle命令
\renewcommand\maketitle{
% \@mainmatterfalse
	\ZJUmakecover
	% \ZJUmakeCNtitlepage
	% \if@doctor
	% 	\ZJUmakeENtitlepage
	% \else
	% 	\relex
	% \fi
	% \global\let\maketitle\relax
}
% 封面
\newcommand\ZJUmakecover{
	\clearpage
	\thispagestyle{empty}
	分类号：\ZJUunderline[90pt]{TM863}
	\hfill
	单位代码：\ZJUunderline[60pt]{10335} \par
	密\quad 级：\ZJUunderline[90pt]{公开}
	\hfill
	学\ZJUspace 号：\ZJUunderline[60pt]{12345678} \par
	\vspace{10mm}
	\begin{center}
		\includegraphics[width=60mm]{./logo/ZJDX.eps}\par
		\vspace{4mm}
		{
			\if@doctor
				{\songti \zihao{-1}博士学位论文}
			\else
				{\songti \zihao{-1}硕士学位论文}
			\fi
		}\par
		\vspace{4mm}
		\includegraphics[width=22.8mm]{./logo/QSY.eps}
	\end{center}
	\vspace{2mm}
	\begin{center}
		\begin{tabular}[t]{rl}
			{\zihao{3}\bfseries 中文论文题目:} &
			{\begin{minipage}[t][61pt]{260pt}
				\zihao{-2} \fangsong\bfseries
				\uline{这个题目的下划线可以自动适应题目字数的变化\hfill}
			\end{minipage}}\\%[20pt]
			{\zihao{3}\bfseries 英文论文题目:} &
			{\begin{minipage}[t][61pt]{260pt}
				\fontsize{16}{23}\bfseries
				\uline{This is a very long title which is used for testing \hfill}
			\end{minipage}}
		\end{tabular}
		\vskip 15mm
		\begin{tabular}{rl}
			{\zihao{4}\songti 申请人姓名:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{倪和陈}}\\[3mm]
			{\zihao{4}\songti 指导教师:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{陈和倪}}\\[3mm]
			{\zihao{4}\songti 合作导师:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{倪陈}}\\[3mm]
			{\zihao{4}\songti 专业名称:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{地球物理}}\\[3mm]
			{\zihao{4}\songti 研究方向:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{和稀泥的艺术}}\\[3mm]
			{\zihao{4}\songti 所在学院:} & {\zihao{4}\fangsong \ZJUunderline[200pt]{这个学院}}\\
		\end{tabular}
	\end{center}
	\vfill
	\begin{center}
		{\zihao{-3}\songti\bfseries 论文提交日期\ZJUunderline[150pt]{2017年3月3日}}
	\end{center}
}


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
\renewcommand{\contentsname}{目\ZJUspace 次}				% 重命名章节目录名，这里不用\CTEXoptions{}。
% \CTEXoptions[contentsname={目\hspace{1em}次}]
\renewcommand{\cfttoctitlefont}{\hfill\fangsong\zihao{3}}	% 与下面一句命令搭配使“目次”居中。
\renewcommand{\cftaftertoctitle}{\hfill}
% \renewcommand{\cftdot}{\ensuremath{\cdot}}					% 目录“点”的样式。
\renewcommand{\cftdotsep}{2.2}								% 修改点之间的距离（全局），已经调整完毕！
\newlength{\ZJUcontentsdotskip}								% 新建调整目录行距的长度命令。
\setlength{\ZJUcontentsdotskip}{4.6pt}						% 距离已经按照模板示例调整完毕！
% chapter
\renewcommand{\cftchapfont}{\fangsong\zihao{-4}}
\renewcommand{\cftchapdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchappagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforechapskip}{\ZJUcontentsdotskip}
% section
\renewcommand{\cftsecfont}{\fangsong\zihao{-4}}
\renewcommand{\cftsecdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforesecskip}{\ZJUcontentsdotskip}
\setlength{\cftsecindent}{0pt}
% subsection
\renewcommand{\cftsubsecfont}{\fangsong\zihao{-4}}
\renewcommand{\cftsubsecdotsep}{\cftdotsep}					% 修改章节目录的点之间的距离。
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}}
\renewcommand{\cftsubsecpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforesubsecskip}{\ZJUcontentsdotskip}
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

%% 插图目录
\renewcommand{\listfigurename}{插\ZJUspace 图}				% 重命名插图目录名。
\renewcommand{\cftloftitlefont}{\hfill\fangsong\zihao{3}}	% 与下面一句命令搭配使“插图”居中。
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftfigfont}{\fangsong\zihao{-4}}
\renewcommand{\cftfigdotsep}{\cftdotsep}					% 修改差图目录的点之间的距离。
\renewcommand{\cftfigleader}{\cftdotfill{\cftfigdotsep}}
\renewcommand{\cftfigpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforefigskip}{\ZJUcontentsdotskip}

%% 表格目录
\renewcommand{\listtablename}{表\ZJUspace 格}				% 重命名表目录名。
\renewcommand{\cftlottitlefont}{\hfill\fangsong\zihao{3}}	% 与下面一句命令搭配使“表格”居中。
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\cfttabfont}{\fangsong\zihao{-4}}
\renewcommand{\cfttabdotsep}{\cftdotsep}					% 修改插图目录的点之间的距离。
\renewcommand{\cfttableader}{\cftdotfill{\cfttabdotsep}}
\renewcommand{\cfttabpagefont}{\rmfamily\zihao{-4}}
\setlength{\cftbeforetabskip}{\ZJUcontentsdotskip}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}		% 在toc目录文件中插入‘\let\CTEX@spaceChar\relax’字符，用以删除目录中的空格字符，其空格字符由\CTEX@spaceChar定义。

%%%%%%%%%% hyperref(放最后)%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	% CJKbookmarks,
	% unicode,
	hidelinks,					% 隐藏超链接的颜色和边框。
	% draft,						% 草稿模式，提高编译速度，需要时注释掉就可以了。
	pdfinfo={					% 这是pdf中显示的信息，不要就注释掉好了o(^▽^)o。
		Title={这是一个伟大的模板},
		Author={Bruce,Sky}
		}
	}

%%%%%%%%%% 参考文献样式 %%%%%%%%%%
\bibliographystyle{GBT7714-2005NLang-ZJU}

