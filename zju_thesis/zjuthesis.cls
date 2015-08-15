% !Mode:: "TeX:UTF-8"
% !TEX root = main.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}[2014/09/12 zjuthesis document class. Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

%---------- Option ----------
% 博士、硕士可选参数，用于区别格式
\newif\if@doctor
\DeclareOption{doctor}{\@doctortrue}
\DeclareOption{master}{\@doctorfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[cs4size,fancyhdr,fntef,openright,cap]{ctexbook}[2011/03/11]

%---------- 加载宏包 ----------
\RequirePackage{amsmath}		%数学公式
\RequirePackage{bm}				%公式中的粗体
\RequirePackage{cases}			%公式中的括号，例如subnumcases环境
\RequirePackage{graphicx}		%插图包
\RequirePackage{paralist}		%列表宏包
\RequirePackage{booktabs}		%三线表
\RequirePackage{ulem}			%下划线
\RequirePackage{array}			%表格处理必备宏包

%---------- 全局命令定义 ----------
\@namedef{ZJU@spaceChar}{\hspace{1em}}			% 修改原来CTEX@spaceChar为ZJU@spcaeChar，ctex2.0宏包已经没有CTEX@spaceChar命令。
\newcommand\ZJUspace{\protect\ZJU@spaceChar\protect\ZJU@spaceChar}		% 用以产生2个字符空格。

% 封面
\renewcommand*\title[1]{\gdef\ZJU@title{#1}}							% 论文中文标题
\newcommand*\englishtitle[1]{\long\gdef\ZJU@englishtitle{#1}}			% 论文英文标题
\renewcommand*\author[1]{\gdef\ZJU@author{#1}}							% 作者姓名，也就是你的名字
\newcommand*\classification[1]{\gdef\ZJU@classification{#1}}			% 分类号
\newcommand*\serialnumber[1]{\gdef\ZJU@serialnumber{#1}}				% 单位代码
\newcommand*\secretlevel[1]{\gdef\ZJU@secretlevel{#1}}					% 密级
\newcommand*\studentnumber[1]{\gdef\ZJU@studentnumber{#1}}				% 学号
\newcommand*\supervisor[1]{\gdef\ZJU@supervisor{#1}}					% 指导教师
\newcommand*\cpsupervisor[1]{\gdef\ZJU@cpsupervisor{#1}}				% 合作导师
\newcommand*\major[1]{\gdef\ZJU@major{#1}}								% 专业名称
\newcommand*\research[1]{\gdef\ZJU@research{#1}}						% 研究方向
\newcommand*\institute[1]{\gdef\ZJU@institute{#1}}						% 所在学院
\newcommand*\submitdate[1]{\gdef\ZJU@submitdate{#1}}					% 提交日期

% 中文题名页
\newcommand*\reviewerA[1]{\gdef\ZJU@reviewerA{#1}}						% 论文评阅人1
\newcommand*\reviewerB[1]{\gdef\ZJU@reviewerB{#1}}						% 论文评阅人2
\newcommand*\reviewerC[1]{\gdef\ZJU@reviewerC{#1}}						% 论文评阅人3
\newcommand*\reviewerD[1]{\gdef\ZJU@reviewerD{#1}}						% 论文评阅人4
\newcommand*\reviewerE[1]{\gdef\ZJU@reviewerE{#1}}						% 论文评阅人5
\newcommand*\chairperson[1]{\gdef\ZJU@chairperson{#1}}					% 答辩委员会主席
\newcommand*\commissionerA[1]{\gdef\ZJU@commissionerA{#1}}				% 委员1
\newcommand*\commissionerB[1]{\gdef\ZJU@commissionerB{#1}}				% 委员2
\newcommand*\commissionerC[1]{\gdef\ZJU@commissionerC{#1}}				% 委员3
\newcommand*\commissionerD[1]{\gdef\ZJU@commissionerD{#1}}				% 委员4
\newcommand*\commissionerE[1]{\gdef\ZJU@commissionerE{#1}}				% 委员5
\newcommand*\defencedate[1]{\gdef\ZJU@defencedate{#1}}					% 答辩日期

% 英文题名页
\newcommand*\enreviewerA[1]{\gdef\ZJU@enreviewerA{#1}}					% 论文评阅人1英文名
\newcommand*\enreviewerB[1]{\gdef\ZJU@enreviewerB{#1}}					% 论文评阅人2英文名
\newcommand*\enreviewerC[1]{\gdef\ZJU@enreviewerC{#1}}					% 论文评阅人3英文名
\newcommand*\enreviewerD[1]{\gdef\ZJU@enreviewerD{#1}}					% 论文评阅人4英文名
\newcommand*\enreviewerE[1]{\gdef\ZJU@enreviewerE{#1}}					% 论文评阅人5英文名
\newcommand*\enchairperson[1]{\gdef\ZJU@enchairperson{#1}}				% 答辩委员会主席英文名
\newcommand*\encommissionerA[1]{\gdef\ZJU@encommissionerA{#1}}			% 委员1英文名
\newcommand*\encommissionerB[1]{\gdef\ZJU@encommissionerB{#1}}			% 委员2英文名
\newcommand*\encommissionerC[1]{\gdef\ZJU@encommissionerC{#1}}			% 委员3英文名
\newcommand*\encommissionerD[1]{\gdef\ZJU@encommissionerD{#1}}			% 委员4英文名
\newcommand*\encommissionerE[1]{\gdef\ZJU@encommissionerE{#1}}			% 委员5英文名
\newcommand*\eendefencedate[1]{\gdef\ZJU@eendefencedate{#1}}			% 答辩日期英文版

% 正文部分文字的行距设置
\renewcommand\baselinestretch{1.56}

%---------- 页面设置 ----------
\RequirePackage[
	% left=2.4cm,
	% right=2.2cm,
	% top=2.8cm,
	% bottom=2.2cm,
	xetex,
	showframe,
]{geometry}
% 纸张大小a4paper
\setlength\paperheight{297mm}
\setlength\paperwidth {210mm}	%  \paperwidth = h + \oddsidemargin+\textwidth+\evensidemargin + h
% 页面布局
\setlength\headheight{12\p@}	% 页眉高度
\setlength\headsep{12\p@}		% 页眉与正文间距
\setlength\topskip{16\p@}		% 每页第一行的行间距
\setlength\footskip{30\p@}		% 页脚基线与每一页最后一行文本基线的距离
\setlength\maxdepth{.5\topskip}	% \maxdepth + \topskip = typesize × 1.5
\setlength\textwidth{16.4cm}	% book.cls文档对texthight和textwidth的
\setlength\textheight{24.7cm}	% 定义比较复杂，但是比较合理
\setlength\marginparsep{10\p@}	% 边注与正文区域的间距
%\setlength\marginparpush{7\p@}	% 两个边注之间的距离，感觉设不设置无所谓
% 单双页面边栏设置
\if@twoside
	\setlength\oddsidemargin{2.6cm}
	\addtolength\oddsidemargin {-1in}
	\setlength\evensidemargin{2cm}
	\addtolength\evensidemargin {-1in}
	\setlength\marginparwidth{45\p@}
\else
	\setlength\oddsidemargin{2.4cm}		% 根据要求，默认单面打印左边距为2.4cm。
	\addtolength\oddsidemargin {-1in}	% 发现latex2e默认在页面四周各留出1in的空白，
	\setlength\evensidemargin{2.4cm}	% 所以要减去这1in。
	\addtolength\evensidemargin {-1in}	% oneside下奇偶页侧边空白相同。
	\setlength\marginparwidth{50\p@}
\fi
% 设置topmargin的尺寸
\setlength\topmargin{\paperheight}
\addtolength\topmargin{-2in}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\addtolength\topmargin{-\textheight}
\addtolength\topmargin{-\footskip}
\addtolength\topmargin{-.5\topmargin}

% 重新定义cleardouble，其原始定义在
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifodd
      \c@page
    \else
      \thispagestyle{empty}%
      \hbox{}\newpage
      \if@twocolumn
        \hbox{}\newpage
      \fi
    \fi
  \fi
}

%---------- 页眉页脚 ----------
\RequirePackage{fancyhdr}				% ctexbook中已经有fancyhdr选项，因此此宏包不用再次添加
\if@doctor
	\def\ZJU@D@M@thesis{浙江大学博士学位论文}
\else
	\def\ZJU@D@M@thesis{浙江大学硕士学位论文}
\fi

\fancypagestyle{plain}{%
  \fancyhf{}							% 先清除当前页面的页眉页脚定义，是fancyhdr包中的定义
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.4pt}
  \fancyfoot[C]{\zihao{-5} \thepage}	% 改变plain默认样式的页码字体大小
  % 如果想在每章首页也有页眉，就将以下两段注释取消掉，并且修改上面的\headrulewidth（默认为0.4pt）！！
  % 反之亦然。
  \fancyhead[L]{\songti\zihao{-5}\ZJU@D@M@thesis}
  \fancyhead[R]{\songti\zihao{-5}\leftmark}
}

\pagestyle{fancy}
\fancyhf{}
\if@twoside
	\fancyhead[RE,LO]{\songti\zihao{-5}\ZJU@D@M@thesis}
	\fancyhead[LE,RO]{\songti\zihao{-5}\leftmark}
	\fancyfoot[C]{\zihao{-5} \thepage}
\else
	\fancyhead[L]{\songti\zihao{-5}\ZJU@D@M@thesis}
	\fancyhead[R]{\songti\zihao{-5}\leftmark}
	\fancyfoot[C]{\zihao{-5} \thepage}
\fi

%---------- 本机字体设置 ----------
\RequirePackage{fontspec}
\setmainfont{Times New Roman}	%MS Word中的Times New Roman。
\setsansfont{TeX Gyre Heros}	%相当于MS Word中的Helvetica。
\setmonofont{TeX Gyre Cursor}	%相当于MS Word中的Curier。
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont={SimHei}, ItalicFont={KaiTi}]{FangSong}		%设置中文正文字体为仿宋，加粗为黑体，斜体为楷体
% \setCJKsansfont{}				%中文无衬线字体，不知道怎么设置，待以后解决。
\setCJKmonofont{YouYuan}		%由于汉字都是等宽的，等宽字体通常应用在代码中，故这里选择用幼圆字体，具体有待以后更改。

%---------% 封面及中英标题页 ----------
% 定义封面及标题页设置中常用的下划线命令（默认宽度90pt）
\renewcommand\ULthickness{0.7pt}			% 重新定义下划线的厚度
\newcommand\ZJUunderline[2][90pt]{\uline{\hbox to #1{\hss#2\hss}}\hskip3pt}
% 重新定义\maketitle命令
\renewcommand\maketitle{
% \@mainmatterfalse
	\ZJUmakecover
	\ZJUmakeCNtitlepage
	% 判断是否显示英文题名页，博士显示，硕士不显示。
	\if@doctor
		\ZJUmakeENtitlepage
	\fi
	\makeOSpage
}
% 封面
\newcommand\ZJUmakecover{
	\cleardoublepage
	\thispagestyle{empty}
	分类号：\ZJUunderline[90pt]{\ZJU@classification}
	\hfill
	单位代码：\ZJUunderline[60pt]{\ZJU@serialnumber} \par
	密\quad 级：\ZJUunderline[90pt]{\ZJU@secretlevel}
	\hfill
	学\ZJUspace 号：\ZJUunderline[60pt]{\ZJU@studentnumber} \par
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
	\vspace{8mm}
	\begin{center}
		\begin{tabular}[t]{>{\zihao{3}\bfseries}rl}
			中文论文题目: &
			{\begin{minipage}[t][61pt]{260pt}
				\zihao{-2} \fangsong\bfseries
				\uline{\ZJU@title\hfill}
			\end{minipage}} \\%[20pt]
			英文论文题目: &
			{\begin{minipage}[t][61pt]{260pt}
				\fontsize{16}{23}\bfseries
				% 下面这条命令通过产生一个0宽度内容为下划线左对齐的盒子
				% 来弥补\uline命令强制换行产生的第一行下划线右边空隙。原来\raisebox方法放弃。
				\makebox[0pt][l]{\ZJUunderline[260pt]{\hfill}}
				\uline{\ZJU@englishtitle\hfill}
			\end{minipage}}\\
		\end{tabular}
		\vskip 6mm
		\begin{tabular}{>{\zihao{4}\songti}r>{\zihao{4}\fangsong}l}
			申请人姓名: & \ZJUunderline[200pt]{\ZJU@author} \\[3mm]
			指导教师: & \ZJUunderline[200pt]{\ZJU@supervisor} \\[3mm]
			合作导师: & \ZJUunderline[200pt]{\ZJU@cpsupervisor} \\[3mm]
			专业名称: & \ZJUunderline[200pt]{\ZJU@major} \\[3mm]
			研究方向: & \ZJUunderline[200pt]{\ZJU@research} \\[3mm]
			所在学院: & \ZJUunderline[200pt]{\ZJU@institute}
		\end{tabular}
	\end{center}
	\vfill
	\begin{center}
		{\zihao{-3}\songti\bfseries 论文提交日期\ZJUunderline[150pt]{\ZJU@submitdate}}
	\end{center}
	%清空变量节省空间
	\global\let\ZJU@classification\@empty
	\global\let\ZJU@serialnumber\@empty
	\global\let\ZJU@secretlevel\@empty
	\global\let\ZJU@studentnumber\@empty
	\global\let\ZJU@author\@empty
	\global\let\ZJU@supervisor\@empty
	\global\let\ZJU@cpsupervisor\@empty
	\global\let\ZJU@major\@empty
	\global\let\ZJU@research\@empty
	\global\let\ZJU@institute\@empty
	\global\let\ZJU@submitdate\@empty
	\global\let\classification\relax
	\global\let\serialnumber\relax
	\global\let\secretlevel\relax
	\global\let\studentnumber\relax
	\global\let\author\relax
	\global\let\supervisor\relax
	\global\let\cpsupervisor\relax
	\global\let\major\relax
	\global\let\research\relax
	\global\let\institute\relax
	\global\let\submitdate\relax
}
% 中文题名页
\newcommand\ZJUmakeCNtitlepage{
	\cleardoublepage
	\thispagestyle{empty}
	{
	\linespread{1.3}
	\begin{center}
		\zihao{-2}\fangsong\bfseries\ZJUunderline[400pt]{\ZJU@title}
	\end{center}
	\vspace{12mm}
	\begin{center}
		\includegraphics[width=22.8mm]{./logo/QSY.eps}
	\end{center}
	\vspace{8mm}
	\begin{center}
		{\zihao{3}\songti\bfseries 论文作者签名：\ZJUunderline[120pt]{\hfill}}\\[10mm]
		{\zihao{3}\songti\bfseries 指导教师签名：\ZJUunderline[120pt]{\hfill}}
	\end{center}
	\vspace{8mm}
	\begin{center}
		\begin{tabular}{>{\zihao{4}\songti}r>{\zihao{4}\songti}l}
			论文评阅人1: & \ZJUunderline[260pt]{\ZJU@reviewerA}\\[3mm]
			评阅人2: & \ZJUunderline[260pt]{\ZJU@reviewerB}\\[3mm]
			评阅人3: & \ZJUunderline[260pt]{\ZJU@reviewerC}\\[3mm]
			评阅人4: & \ZJUunderline[260pt]{\ZJU@reviewerD}\\[3mm]
			评阅人5: & \ZJUunderline[260pt]{\ZJU@reviewerE}\\[12mm]
			答辩委员会主席: & \ZJUunderline[260pt]{\ZJU@chairperson}\\[3mm]
			委员1: & \ZJUunderline[260pt]{\ZJU@commissionerA}\\[3mm]
			委员2: & \ZJUunderline[260pt]{\ZJU@commissionerB}\\[3mm]
			委员3: & \ZJUunderline[260pt]{\ZJU@commissionerC}\\[3mm]
			委员4: & \ZJUunderline[260pt]{\ZJU@commissionerD}\\[3mm]
			委员5: & \ZJUunderline[260pt]{\ZJU@commissionerE}
		\end{tabular}
	\end{center}
	\vfill
	\hfill{\zihao{4}\songti 答辩日期: \ZJUunderline[150pt]{\ZJU@defencedate}}
	}
	%清空变量节省空间
	\global\let\ZJU@reviewerA\@empty
	\global\let\ZJU@reviewerB\@empty
	\global\let\ZJU@reviewerC\@empty
	\global\let\ZJU@reviewerD\@empty
	\global\let\ZJU@reviewerE\@empty
	\global\let\ZJU@chairperson\@empty
	\global\let\ZJU@commissionerA\@empty
	\global\let\ZJU@commissionerB\@empty
	\global\let\ZJU@commissionerC\@empty
	\global\let\ZJU@commissionerD\@empty
	\global\let\ZJU@commissionerE\@empty
	\global\let\ZJU@defencedate\@empty
	\global\let\ZJU@title\@empty			% 中文标题变量清空
	\global\let\title\relax
	\global\let\reviewerA\relax
	\global\let\reviewerB\relax
	\global\let\reviewerC\relax
	\global\let\reviewerD\relax
	\global\let\reviewerE\relax
	\global\let\chairperson\relax
	\global\let\commissionerA\relax
	\global\let\commissionerB\relax
	\global\let\commissionerC\relax
	\global\let\commissionerD\relax
	\global\let\commissionerE\relax
	\global\let\defencedate\relax
}

% 英文题名页
\newcommand\ZJUmakeENtitlepage{
	\cleardoublepage
	\thispagestyle{empty}
	{
	\linespread{1.3}
	\begin{center}
		\fontsize{16}{23}\bfseries\ZJUunderline[400pt]{\ZJU@englishtitle}
	\end{center}
	\vspace{12mm}
	\begin{center}
		\includegraphics[width=22.8mm]{./logo/QSY.eps}
	\end{center}
	\vspace{5mm}
	\begin{center}
		\begin{tabular}{>{\zihao{3}\bfseries}rl}
			Author's signature: & \ZJUunderline[120pt]{\hfill}\\[10mm]
			Supervisor's signature: & \ZJUunderline[120pt]{\hfill}
		\end{tabular}
	\end{center}
	\vspace{8mm}
	\begin{center}
		\begin{tabular}{>{\zihao{4}}r>{\zihao{4}}l}
			External Reviewers: & \ZJUunderline[260pt]{\ZJU@enreviewerA}\\[2.5mm]
								& \ZJUunderline[260pt]{\ZJU@enreviewerB}\\[2.5mm]
								& \ZJUunderline[260pt]{\ZJU@enreviewerC}\\[2.5mm]
								& \ZJUunderline[260pt]{\ZJU@enreviewerD}\\[2.5mm]
								& \ZJUunderline[260pt]{\ZJU@enreviewerE}
		\end{tabular}
	\end{center}
	\vspace{8mm}
	% 以下水平间距的命令用于跟上面对齐
	% 第一个水平间距命令采用LaTeX的\hspace命令
	% 若采用之后的TeX原始间距命令则水平间距无法产生，原因未知
	\hspace{6.3ex}		{\zihao{4} Examining Committee Chairperson:}\\[2.5mm]
	% 以下间距命令采用TeX命令，\hb@xt@ 即为 \hbox to 的宏
	% 这里若采用\hspace命令，这水平间距无法产生，原因未知
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@enchairperson}\\[2.5mm]
	\hb@xt@ 6.3ex{}		{\zihao{4} Examining Committee Members:}\\[2.5mm]
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@encommissionerA}\\[2.5mm]
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@encommissionerB}\\[2.5mm]
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@encommissionerC}\\[2.5mm]
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@encommissionerD}\\[2.5mm]
	\hb@xt@ 30.2ex{} 	\ZJUunderline[260pt]{\ZJU@encommissionerE}\\
	\vfill
	\hfill{\zihao{4} Date of oral defence：\ZJUunderline[150pt]{\ZJU@eendefencedate}}
	}
		%清空变量节省空间
	\global\let\ZJU@enreviewerA\@empty
	\global\let\ZJU@enreviewerB\@empty
	\global\let\ZJU@enreviewerC\@empty
	\global\let\ZJU@enreviewerD\@empty
	\global\let\ZJU@enreviewerE\@empty
	\global\let\ZJU@enchairperson\@empty
	\global\let\ZJU@encommissionerA\@empty
	\global\let\ZJU@encommissionerB\@empty
	\global\let\ZJU@encommissionerC\@empty
	\global\let\ZJU@encommissionerD\@empty
	\global\let\ZJU@encommissionerE\@empty
	\global\let\ZJU@eendefencedate\@empty
	\global\let\ZJU@englishtitle\@empty			% 英文标题变量清空
	\global\let\englishtitle\relax
	\global\let\enreviewerA\relax
	\global\let\enreviewerB\relax
	\global\let\enreviewerC\relax
	\global\let\enreviewerD\relax
	\global\let\enreviewerE\relax
	\global\let\enchairperson\relax
	\global\let\encommissionerA\relax
	\global\let\encommissionerB\relax
	\global\let\encommissionerC\relax
	\global\let\encommissionerD\relax
	\global\let\encommissionerE\relax
	\global\let\eendefencedate\relax
}

% 独创声明与版权协议转让页
\newcommand\makeOSpage{%
	\cleardoublepage
	\thispagestyle{empty}
	{
		\newcommand\signature@date{签字日期：\hspace{8ex}年\hspace{4ex}月\hspace{4ex}日}
		\linespread{1.7}			% 相当于word中的1.5倍行距。
		\songti\zihao{-4}
		\vspace*{1ex}
		\begin{center}
			\zihao{-2}浙江大学研究生学位论文独创性声明
		\end{center}
		\vspace{20pt}

		本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得{\kaishu\zihao{4}\bfseries\underline{~浙江大学~}}或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。

		\vspace{62pt}

		学位论文作者签名：\hspace{13ex} \signature@date

		\vspace{70pt}
		\begin{center}
			\zihao{-2} 学位论文版权使用授权书
		\end{center}
		\vspace{20pt}

		本学位论文作者完全了解{\kaishu\zihao{4}\bfseries\underline{~浙江大学~}}有权保留并向国家有关部门或机构送交本论文的复印件和磁盘，允许论文被查阅和借阅。本人授权{\kaishu\zihao{4}\bfseries\underline{~浙江大学~}}可以将学位论文的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。

		（保密的学位论文在解密后适用本授权书）\\[20pt]
		\begin{tabular}{p{0.5\textwidth}p{0.4\textwidth}}
			\CTEXindent 学位论文作者签名：	&  导师签名：\\[20pt]
			\CTEXindent \signature@date 	&  \signature@date
		\end{tabular}

	}
}

%---------- 层次标题格式设置 ----------
\setcounter{secnumdepth}{4}		%设置为四级标题
% %%章标题格式设置----小三仿宋加黑
% \CTEXsetup[
% 	name={,},
% 	number={\arabic{chapter}},
% 	format={\raggedright},
% 	nameformat={\fangsong\zihao{-3}\bfseries},
% 	titleformat={\fangsong\zihao{-3}\bfseries}
% ]{chapter}

% %%一级节标题格式设置----四号仿宋加黑
% \CTEXsetup[
% 	format={\raggedright},
% 	nameformat={\zihao{4}\bfseries},
% 	titleformat={\fangsong\zihao{4}\bfseries}
% ]{section}

% %%二级节标题格式设置----小四号仿宋
% \CTEXsetup[
% 	format={\raggedright},
% 	nameformat={\zihao{-4}},
% 	titleformat={\fangsong\zihao{-4}}
% ]{subsection}

% %%三级节标题格式设置----小四号仿宋
% \CTEXsetup[
% 	format={\raggedright},
% 	nameformat={\zihao{-4}},
% 	titleformat={\fangsong\zihao{-4}}
% ]{subsubsection}

% 以下对标题格式采用laTeX2e底层命令主要是为了防止ctex宏包升级改变导致的命令不兼
% 容性，假如2.0之后宏包对1.02宏包命令不再支持，以后又要修改，不如一鼓作气。
% 现在以下命令可以正常工作，调整参数则慢慢来吧。
%% 章标题格式设置----小三仿宋加黑
\renewcommand\chapter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\phantomsection			% hyperref宏包的命令，超链接用。
	\thispagestyle{plain}%
	\global\@topnum\z@%
	\@afterindenttrue%
	\secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	% 在图目录和表目录中相应章节位置加垂直10pt的空白。
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}
	\@afterheading}		% 不知道这个\@afterheading有什么用，先放着。
\def\@makechapterhead#1{%
	\vspace*{20bp}%
	{\parindent \z@ \raggedright
	\fangsong\zihao{-3} \bfseries
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\@chapapp\space \textrm{\thechapter} \hskip1em%
		\fi
	\fi
	\interlinepenalty\@M
	 #1\par\nobreak
	\vskip 24\p@}}
\def\@schapter#1{%
	\@makeschapterhead{#1}
	\@afterheading}
\def\@makeschapterhead#1{%
	\vspace*{20bp}%
	{\parindent \z@ \raggedright
	\fangsong \zihao{-3} \bfseries
	\interlinepenalty\@M
	#1\par\nobreak
    \vskip 24\p@}}

% \frontmatter,\mainmatter,\backmatter重定义。
\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}}
\renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}

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

%---------- 目录（目次） ----------
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
\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.5em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi%
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}

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

\addtocontents{toc}{\let\string\ZJU@spaceChar\relax}		% 在toc目录文件中插入‘\let\CTEX@spaceChar\relax’字符，用以删除目录中的空格字符，其空格字符由\CTEX@spaceChar定义。

%---------- hyperref(放最后) ----------
\RequirePackage{hyperref}
\AtEndOfClass{
	\hypersetup{
		unicode,
	    pdfstartview=FitH,
	    CJKbookmarks=true,
	    bookmarksnumbered=true,
	    bookmarksopen=true,
	    colorlinks=true,
	    citecolor=black,
	    linkcolor=black,
	    anchorcolor=black,
	    urlcolor=black,
	    breaklinks=true，
		% hidelinks,					% 隐藏超链接的颜色和边框。
		% draft,						% 草稿模式，提高编译速度，需要时注释掉就可以了。
	}
}
\AtBeginDocument{
	\hypersetup{%
		pdftitle={\ZJU@title},%
		pdfauthor={\ZJU@author},%
		pdfkeywords={},%
		pdfcreator={LaTeX with hyperref package, using ZJU LaTeX Thesis Template for Master and Doctor}
	}
}

% ---------- 参考文献样式 ----------
\bibliographystyle{GBT7714-2005NLang-ZJU}

%Superscript reference
% 这个命令是什么时候加进来的？？？
\newcommand{\scite}[1]{\textsuperscript{\cite{#1}}}

% ---------- 中英文摘要及关键词 ----------
% 中文摘要环境
\newenvironment{cabstract}{%
	\chapter{摘要}}{}
\newenvironment{eabstract}{%
	\chapter{Abstract}}{}

% 中英文关键词命令及其格式的自动定义；
% 参照thuthesis，薛瑞尼，P37/66，v4.8.1 (2014/12/09)。
% 这段宏定义搞了我一个下午才看懂，哎…… 这个 \@for 命令挺有用的。
\def\ZJU@parse@keywords#1{
	\expandafter\gdef\csname ZJU@#1\endcsname{} % todo: need or not?
	\expandafter\gdef\csname @#1\endcsname##1{
	\@for\reserved@a:=##1\do{
		\expandafter\ifx\csname ZJU@#1\endcsname\@empty\else
	    	\expandafter\g@addto@macro\csname ZJU@#1\endcsname{\ignorespaces\csname ZJU@#1@separator\endcsname}
	  	\fi
	  	\expandafter\expandafter\expandafter\g@addto@macro%
	    \expandafter\csname ZJU@#1\expandafter\endcsname\expandafter{\reserved@a}}}}

% 根据以上宏定义，以下命令分别产生\@ckeywords{} 和 \@ekeywords{} 两个读取关
% 键词的宏，和加工后保存关键词的 \ZJU@ckeywords 和 \ZJU@ckeywords 的宏定义。
\ZJU@parse@keywords{ckeywords}
\ZJU@parse@keywords{ekeywords}

% 以下分别是中英文关键词的分隔符
\def\ZJU@ckeywords@separator{；}
\def\ZJU@ekeywords@separator{;}

% 用户界面命令，读取和排版关键词
\newcommand*\ckeywords[1]{%
	\@ckeywords{#1}
	\vspace{5ex}
	\noindent\textbf{关键词：}\ZJU@ckeywords}
\newcommand*\ekeywords[1]{%
	\@ekeywords{#1}
	\vspace{5ex}
	\noindent\textbf{Keywords:}\ \ZJU@ekeywords}

% ---------- 缩写、符号清单、术语表 ----------
% 以下尺寸详细说明见P33/112
\newenvironment*{denotation}[1][2.5cm]{
	\chapter{缩写、符号清单、术语表}
	\noindent
	\begin{list}{}{
		\renewcommand\makelabel[1]{##1\hfil}
		\setlength{\itemindent}{0cm} 				% 标签缩进量
		\setlength{\labelsep}{1cm} 					% 标签与列表文本距离
		\setlength{\labelwidth}{#1} 				% 标签盒子宽度，如有需要可以自行修改
		\setlength{\listparindent}{0pt} 			% 同一\item 第二及以后段落缩进量
		\setlength{\rightmargin}{0cm}
		\setlength{\leftmargin}{\labelwidth}		% list环境整体向右推
		\addtolength{\leftmargin}{\labelsep}		% \labelwidth + \labelsep 的距离
		\setlength{\itemsep}{0pt plus2pt minus1pt}	% 标签间距
		\setlength{\parsep}{\itemsep} 				% 段落间距
		\setlength{\topsep}{0pt} 					% 标签与上文的间距
		\setlength{\partopsep}{3pt plus2pt minus2pt}
	}}{\end{list}}
