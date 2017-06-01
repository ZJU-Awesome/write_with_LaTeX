## 浙江大学研究生硕士(博士)学位论文LaTeX模板（带开题报告）
作者:
[Monster](http://github.com/skychan)、
[Hamburger](https://github.com/githamburger)

## 1、简介

为了方便学位论文的排版，让作者专心于内容，根据[《浙江大学研究生学位论文编写规则》](http://grs.zju.edu.cn/attachments/2016-06/p1alr2i33k1n2c2l41gch14f71lmv4.pdf)，并结合实际要求，设计相应的LaTeX模版。

目前主要以机械学院的要求为主，由于不同学院有各自不同的要求，所以之后会通过参数选择的方式，进行学院间的要求切换，大致就是这样吧。

目前添加了开题报告的模板，欢迎使用。

## 2、编译方法

__windows__:

首先在环境变量里设置```$HOME```，一般是```C:\Users\XXX```。


添加或修改 .latexmkrc，请做好备份。

    $ cp latexmkrc_win [your_home_dir]\.latexmkrc

使用latexmk 命令进行编译。

	$ cd zju_thesis

论文正文：

	$ latexmk thesis

开题报告：

	$ latexmk proposal

如果不想设置环境变量，可以这样：

	$ mkdir C:\latexmk
	$ cp latexmkrc_win C:\latexmk\LatexMK

__Linux__:

首先添加或修改 .latexmkrc，请做好备份。

    $ cp latexmkrc_linux ~/.latexmkrc

然后使用latexmk 命令进行编译。

	$ cd zju_thesis
论文正文：

	$ latexmk thesis

开题报告：

	$ latexmk proposal
__Mac__:

首先添加或修改 .latexmkrc，请做好备份。

    $ cp latexmkrc_mac ~/.latexmkrc

然后使用latexmk 命令进行编译。

	$ cd zju_thesis
论文正文：

	$ latexmk thesis

开题报告：

	$ latexmk proposal

__清理临时文件__:

一般使用

	$ latexmk -c
即可。如果要清理```synctex```以及```pdf```

	$ latexmk -C

## 3、完成情况
- [x] 主题框架
- [x] 页面设置
- [x] 章节标题设置
- [x] 公式、图表样式
- [x] 定理环境
- [x] 抄录环境
- [ ] 书脊设计
- [x] 参考文献样式设计
- [x] 封面设置
- [x] 题目页面
- [ ] 勘误页面
- [x] 单双页设置
- [x] 缩写、符号清单、术语表页面

## 4、欢迎参与

目前该项目基本雏形已成，至少算是能用了吧，一些细节需要完善，欢迎大家fork~

## 5、注意事项

**请升级到最新版的Texlive，经反映有生成的文档复制出现乱码的错误，新版引擎修复了这个错误**

**中文编译到 eu1lmr.fd 出现很久的停顿，请尝试下面的解决办法：**

1. 清理```texlive\2016\texmf-var\fonts\cache``` 中所有文件
2. 执行```fc-cache -fsv```(管理员权限cmd)
3. 参考[XeLaTeX runs slow on Windows machine](http://tex.stackexchange.com/questions/325278/xelatex-runs-slow-on-windows-machine/329243)


**中文加粗的问题**
如果有部分同学和我一样，出现了该加粗的字体没有加粗，并伴随相关警告，有一个临时的解决办法，但是我仍旧没有搞清楚原因，希望知道的同学告诉我。

方法：将fontset 文件夹下的对应配置文件替换```texmf-dist/tex/latex/ctex/fontset``` 中的配置文件，当然注意备份原文件。然后就好了。

- win7 及以后：windowsnew
- win7 以前： windowsold
- mac :  mac
- linux : fandol

中文加粗，是个很奇怪的要求，包括MS Word 实际上用的也是伪加粗，除非有对应的粗字体文件。所以目前的解决办法就是通过配置文件让他们伪加粗。

当然，也可能和我texlive 的环境有关。

由于时间和能力有限，故该模板可能与学院要求的格式不尽相同。
建议使用TeXLive，并采用XeLaTeX进行编译。

作者不对使用该模板所造成的任何后果负责，但欢迎提供修改意见，以帮助我们完善该模。
