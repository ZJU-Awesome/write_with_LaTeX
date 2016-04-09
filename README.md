## 浙江大学软件学院硕士研究生学位论文LaTeX模板
模板上游：[ZJU-Awesome](https://github.com/ZJU-Awesome/write_with_LaTeX)<br>
模板改造者：  [Kwen](mailto:stralipch@gmail.com)

## 1、简介

为了方便学位论文的排版，让作者专心于内容，
根据[《浙江大学软件学院论文格式要求》](http://www.cst.zju.edu.cn/uploadfile/2012/1015/20121015030109379.doc)
,[《浙江大学软件学院论文模板》](http://www.cst.zju.edu.cn/uploadfile/2012/1015/20121015030251470.doc)
以及[《浙江大学研究生学位论文编写规则》](http://grs.zju.edu.cn/UserFiles/File/xkjsc/xwglb/wenjian/%E6%B5%99%E6%B1%9F%E5%A4%A7%E5%AD%A6%E7%A0%94%E7%A9%B6%E7%94%9F%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E7%BC%96%E5%86%99%E8%A7%84%E5%88%99.doc)，并结合实际，改造设计了相应的LaTeX模版。

**本模板建议软件学院同学使用**。

## 2、编译方法

- [字体包下载-百度盘](http://pan.baidu.com/s/1hrXDO5A)
- [字体包下载-Google Drive](https://drive.google.com/open?id=0ByPSg5LzlAjAcThjQ3pEUGstcGc)

__OS X__ （[MacTeX 2015](https://tug.org/mactex/) on OS X Yosemite and EL Capitan）

拷贝 .latexmkrc 到家目录

    $ cp latexmkrc_mac ~/.latexmkrc

使用latexmk 命令进行编译。
如果您遇到编译错误，请检查是否正确安装以上字体包。

	$ latexmk main


__windows__ （仅在[TexLive2015](http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/texlive2015.iso) on windows10 测试）:

首先在环境变量里设置```$HOME```，一般是```C:\Users\username```

添加或修改 .latexmkrc，请做好备份。

    $ copy latexmkrc_win %HOME%\.latexmkrc

使用latexmk 命令进行编译。
如果您遇到编译错误，请检查是否正确安装以上字体包。

	$ latexmk main

__Linux__ (TeXLive2015):

首先添加或修改 .latexmkrc，请做好备份。

    $ cp latexmkrc_linux ~/.latexmkrc

然后使用latexmk 命令进行编译。
如果您遇到编译错误，请检查是否正确安装以上字体包。

	$ latexmk main

windows和Linxu 皆使用 TeXLive 2015 安装
[TeXLive 2015 中文文档](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf)

### 开启实时编译(OS X)

论文编译时间通常在20秒以上，
为减少论文修改时的查错成本，
所以强烈建议设置**实时编译**。
方案如下：

由于 OS X 默认的 Preview 不支持自动刷新，
所以不得不安装 [skim](https://sourceforge.net/projects/skim-app/) pdf 阅读器，
若不信任此应用，请参照之后方法自行解决。
安装完成后，在 Sync 设置处打开 Check for file Changes。

现在修改论文源码前，可以在 main.tex 的路径下输入命令

    $ latexmk -pdf -pvc -xelatex main

为简化需要在终端输入的命令，可以在日常设定的 rc 文件中自行加入一个 alias

如果仅仅编译一次论文，则在论文根目录下输入命令

    $ latexmk main

若出现连续几次编译错误并且确信论文源码并无语法错误，则可以尝试清空临时文件的命令再编译

    $ latexmk -c && latexmk main

有洁癖的极端处女座，可以输入以下内容保证每次实时编译都清理临时文件：

    $ echo "$clean_ext = 'synctex.gz synctex.gz(busy) acn acr alg aux bbl bcf blg brf dvi fdb_latexmk glg glo gls idx ilg ind ist lof log lot lox out paux pdfsync run.xml toc';">>~/.latexmkrc


## 3、相关资源文件说明
```tex
├── clean.bat % windows的清理批处理
├── contents  % 被引用的内容 不可嵌套引用
│   ├── abstract_chinese.tex
│   ├── abstract_english.tex
│   ├── intro.tex
│   ├── whyla.tex
│   ├── elem.tex
│   ├── sum.tex
│   └── thanks.tex
├── main.tex % 论文主源码（通过 include 以上文件来组成论文内容）
├── figures  % 引用图片目录
│   ├── ...
│   ├── ...
│   └── ...
├── gbt7714-2005.bst   % 参考文献样式（胡海星）
├── logo
│   ├── QSY.pdf
│   └── ZJDX.pdf
├── references % 论文引文数据库 自行维护
│   └── test.bib
├── zjuthesis.cls       % 论文全书样式 小心查看和修改 避免手残
└── ...
```

通过 `latexmk main` 将论文编译出来后，请检视内容尝试理解本论文模板。

## 4、注意事项

建议使用TeXLive 2015发行版，并采用XeLaTeX进行编译。
论文模板属于学习交流性质，
暂无任何官方机构为本模板合法性背书。
另请**妥善维护**自己的论文资料，
对论文排版过程中造成的不可预见的意外本人概不负责。

目前已知的一个难解问题在于生僻字的排印问题：
如果在论文段落以外的区域排版生僻字，将高于当前行基线一个微小的单位。
本人提供一个不得已为之的解法：为此生僻字预留一个em框（可能涉及更动论文模板，请参照修改），
在论文输出后利用OS X 的 Preview 提供的编辑功能补上该生僻字的文本框。

## 5、许可权和贡献

**MIT** 
欢迎 issue 和 PR
