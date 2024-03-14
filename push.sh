# 自动生成更新日期内容
nowDate=$(date +%F)
echo -e "# THE END \n\n更新日期："$nowDate  >  end.md
# 编译md为reveal幻灯片内容
pandoc --mathjax -t revealjs -s --css imd.css --highlight-style haddock --include-in-header=favicon.html --include-after-body=dev.html  --slide-level=5 title.md front-end.md end.md -o index.html
# 推送到远程仓库
git add .
git commit -m $1
git push
