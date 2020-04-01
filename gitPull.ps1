param([string]$repoLocalpath)

$repoLocalpath = Read-Host -Prompt 'Input your GIT Repo' 

if($repoLocalpath -eq "")
{
    Write-Host "You gotta provide path" -Path -Level Error  -ForegroundColor Red
    #return
}
else {
    Write-Host "You entered '$repoLocalpath' " -ForegroundColor DarkGreen 
}

#You can directly hardcode your repo root path in case you want to avoid inputing path everytime 
#$repoLocalpath = "C:\Code";

Write-Host "Starting with root: $repoLocalpath" 

$dir = Get-ChildItem $repoLocalpath | Where-Object {$_.PSISContainer} | select-object FullName

foreach ($d in $dir) 
{
    Write-Host "git pull --all -> $($d.FullName)"  -ForegroundColor Green
    Set-Location $d.FullName;
    git pull -v --all
   # Write-Host 

    #build web and portal
    #find if there are any difference for project then build it 
}

Set-Location $PSScriptRoot;

Write-Host "Done"  

#https://www.freecodecamp.org/forum/t/git-pull-how-to-override-local-files-with-git-pull/13216