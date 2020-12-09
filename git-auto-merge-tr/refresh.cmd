@echo off
rem set clean=clean

rem set "targetBranch=ECORE-1058"
rem set "sourceBranch=origin/feature/workflow-migration"

set "targetBranch=feature/workflow-migration"
set "sourceBranch=origin/development"

set "modules=base cms corecms efile coreefile workflow"
set "gitModules=e_lib/base.git e_lib/cms.git e_project/corecms.git e_lib/efile.git e_project/coreefile.git e_lib/workflow.git"

if defined clean (
	echo ==Making up============================================================
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
)

for %%m in (%modules%) do (
	echo =====Working with %%m =========================================================
	pushd %%m
    echo --Fetching---------------------------------------------------------------------------
	git fetch
	echo --Removing local branch %targetBranch%-----------------------------------------------
	git checkout development
	git branch -d %targetBranch%
	echo --Switching to %targetBranch%--------------------------------------------------------
	git checkout %targetBranch%
	echo --Merging from %sourceBranch%--------------------------------------------------------
	git merge -v -m "Merging %sourceBranch% into %targetBranch%" %sourceBranch%
	rem --ff-only
	popd
)
echo ==Done. Preparing TO PUSH STAGE=================================================================
for %%m in (%modules%) do (
	echo =====Status of %%m =========================================================
	pushd %%m
    git status
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