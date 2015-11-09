@echo off
set "modules=cms base criminal corecms niem tag"
set "gitModules=e_product/cms.git e_core/base.git e_plugin/criminal.git e_coreproject/corecms.git e_plugin/niem.git e_core/tag.git"

rem set "modules=cms base tag criminal abuseneglect corecms coreefile"
rem set "gitModules=e_core/base.git e_core/tag.git e_plugin/criminal.git e_plugin/abuseneglect.git e_coreproject/corecms.git e_coreproject/coreefile.git e_product/cms.git"

echo ==============================================================
for %%m in (%modules%) do (
	echo --------------------------------------------------------------
	echo Removing %%m
	rmdir /S /Q %%m
)
echo ==============================================================
for %%m in (%gitModules%) do (
    echo --------------------------------------------------------------
    echo Cloning %%m
	git clone https://UC191752@trcmsstash.int.thomsonreuters.com/scm/%%m
)
echo ==============================================================
for %%m in (%modules%) do (
	pushd %%m
	git checkout feature/plea-disposition
	echo --------------------------------------------------------------
	echo Merging %%m
	git merge -v -m "Merging development into feature branch" origin/development
	rem --ff-only
	popd
)
pause
for %%m in (%modules%) do (
	pushd %%m
	echo --------------------------------------------------------------
	echo Pushing %%m
	git push
	popd
)
echo ==============================================================
pause