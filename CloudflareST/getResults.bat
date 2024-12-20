REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo HKG -o /results/HKG.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo KHH -o /results/KHH.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo NRT -o /results/NRT.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo LAX -o /results/LAX.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo SEA -o /results/SEA.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo SJC -o /results/SJC.csv
REM ./CloudflareST.exe -tll 40 -tl 300 -p 8 -httping -cfcolo SIN -o /results/SIN.csv

@echo off
chcp 65001
setlocal

set params=-tll 40 -tl 500 -p 0 -httping
set outputDir=results

REM 创建结果目录
if not exist %outputDir% mkdir %outputDir%

REM 测速并保存结果
for %%i in (HKG KHH NRT LAX SEA SJC SIN) do (
    echo 正在测试 %%i 数据中心...
    CloudflareST.exe %params% -cfcolo %%i -o %outputDir%\%%i.csv
    if errorlevel 1 (
        echo "测速失败：%%i 数据中心，跳过..."
        continue
    )
)

REM 提交代码到 GitHub
cd /d %~dp0
git add %outputDir%
git commit -m "自动更新测试结果"
git push origin master

endlocal
