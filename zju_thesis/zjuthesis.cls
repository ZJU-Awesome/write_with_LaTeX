\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}[2014/09/12 zjuthesis document class. Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

\LoadClass[cs4size,a4paper,fancyhdr,fntef,oneside,openany,cap]{ctexbook}

\RequirePackage[
	left=2.4cm,
	right=2.2cm,
	top=2.8cm,
	bottom=2.2cm,
	% headsep=0.25cm,
	% headheight=1.5cm,
	% footskip=0.79cm
]{geometry}

%%%%%%%%%% 本机字体设置 %%%%%%%%%%
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Termes}	%相当于MS Word中的Times New Roman。
\setsansfont{TeX Gyre Heros}	%相当于MS Word中的Helvetica。
\setmonofont{TeX Gyre Cursor}	%相当于MS Word中的Curier。


%%%%%%%%%% 层次标题格式设置 %%%%%%%%%%
%%章标题格式设置----小三仿宋加黑
\CTEXsetup[
	name={,},
	number={\arabic{chapter}},
	format={\raggedright},
	nameformat={\fangsong\zihao{-3}\bfseries},
	titleformat={\fangsong\zihao{-3}\bfseries}
]{chapter}

%%一级节标题格式设置----四号仿宋加黑
\CTEXsetup[
	format={\raggedright},
	nameformat={\fangsong\zihao{4}\bfseries},
	titleformat={\fangsong\zihao{4}\bfseries}
]{section}

%%二级节标题格式设置----小四号仿宋加黑
\CTEXsetup[
	format={\raggedright},
	nameformat={\fangsong\zihao{-4}\bfseries},
	titleformat={\fangsong\zihao{-4}\bfseries}
]{subsection}
