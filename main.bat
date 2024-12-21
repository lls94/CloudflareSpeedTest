chcp 65001
@echo off
go run main.go -p 0 -tll 40 -tl 300 -httping -cfcolo HKG,NRT,ICN,DXB,SIN,NYC,LAX,SFO,KIX,BOM,DEL,JKT,KUL,TPE -dd
git add .
git commit -m "自动提交生成的代码"
git push
exit