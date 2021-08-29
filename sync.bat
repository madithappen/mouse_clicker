cd /D "%~dp0"

git add .
git commit -m "Reocurring commit %date% %time%"
git push
PAUSE