#
# build zjutmain.pdf
#

# XXX: bibtex 会报错 如 http://bbs.sjtu.edu.cn/bbstcon,board,TeX_LaTeX,reid,1299228706.html 原因不明但不影响结果输出，这里ignore掉
.IGNORE : all 

all:
	xelatex main
	bibtex main
	xelatex main
	xelatex main
	evince main.pdf

clean:
	git clean -fx

png:
	mkdir -p preview; cp main.pdf preview/; cd preview; rm *.png; pdftoppm -png main.pdf main_preview; rm -rf main.pdf; cd ..
