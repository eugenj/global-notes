@echo off
set "modules=cms base criminal corecms niem"
for %%m in (%modules%) do (
	echo --------------------------------------------------------------
	echo Compiling %%m
	pushd %%m
	mvn clean install
	popd
)
echo ==============================================================