@echo off
rem set "branch=feature/integrationservices"
set "branch=development"
set "modules=base cms corecms efile rulesengine"

echo ==============================================================

for /d %%m in (%modules%) do (
	pushd %%m
	echo --------------------------------------------------------------
	if exist ".git" (
		echo Switching %%m
		git checkout %branch%
	)
	popd
)
echo ==============================================================
for /d %%m in ("*") do (
	pushd %%m
	echo --------------------------------------------------------------
	if exist ".git" (
		echo Updating %%m
		git pull
	)
	popd
)
notepad++ corecms\corecms-web\src\main\resources\override.properties
pause