chcp 65001
@echo off
go run main.go -p 0 -tll 40 -tl 500 -httping -cfcolo LAX -dd
git add .
git commit -m "自动提交生成的代码"
git push
exit