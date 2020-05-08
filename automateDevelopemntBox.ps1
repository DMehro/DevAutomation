Write-Warning  "Please make sure to install following software by provider website directly as these require userinput/not available on choco library" -ForegroundColor DarkRed
Write-Warning  "Microsoft Visual Studio, MS SQL Server , PostSharp, Gibraltar,Resharper" -ForegroundColor
 
Write-Host "This script will install following packages - chocolatey , GIT , IISFeatures, Notepad++, NodeJS, Postman,
RedisDesktop manager, Postman, Zeplin & Service bus explorer " -ForegroundColor Green
  
 
#function to update system path after installation
 
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
 
$ifChocoInstalled = powershell choco -v
 
 
#Choco installation
if(-not($ifChocoInstalled)){
    Write-host "Chocolatey is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
 
    Update-Environment-Path
 
    }
 
 else{
    Write-host "Chocolatey $ifChocoInstalled is already installed" -ForegroundColor Green
}
 
 
#GIT Installation
 
$ifGITInstalled = powershell git --version
 
if(-not($ifGITInstalled)){
    Write-host "GIT is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    choco install git --yes
  #  choco install gitextensions
     
    Update-Environment-Path
 
    }
 
 else{
    Write-host "$ifGITInstalled is already installed" -ForegroundColor Green
}
 
if(-not($ifGITInstalled)){
    Write-host "GIT is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    choco install git --yes
  #  choco install gitextensions
     
    Update-Environment-Path
 
    }
 
 else{
    Write-host "$ifGITInstalled is already installed" -ForegroundColor Green
}
 
 
#IIS
 
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CGI
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WMICompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacyScripts
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DigestAuthentication
 
choco install webdeploy -y
choco install urlrewrite -y
 
#Jetbrains dotpeek
 
#choco install dotpeek
 
#Notepad++ installation
 
choco install notepadplusplus.install
Update-Environment-Path
 
# Node
choco install nodejs.install --yes
Update-Environment-Path
 
#npm install --global --production npm-windows-upgrade
#npm-windows-upgrade --npm-version latest
 
#postman
choco install postman
 
#redis desktop manager
choco install redis-desktop-manager
 
#Zeplin
choco install zeplin
 
#ServiceBusExplorer
choco install servicebusexplorer
 
Update-Environment-Path
 
 
Write-Host "Script execution finished , please check output for any error and restart your machine!!!!" -ForegroundColor blue  -BackgroundColor Yellow