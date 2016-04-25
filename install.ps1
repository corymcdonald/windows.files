"Configuring environment please wait..."
$dotFilesDirectory = "$Home\Documents\dotFiles"

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
$executionPolicy = (Get-ExecutionPolicy)
if($executionPolicy -eq "RemoteSigned")
{

    "Configuring profile.ps1"
    mkdir "$Home\My Documents\WindowsPowerShell" -ErrorAction SilentlyContinue
    copy profile.ps1 "$Home\My Documents\WindowsPowerShell" 

    "Checking installation directory"
    if(!(Test-Path $dotFilesDirectory))
    {
        "Installation directory doesn't exist. Cloning git repo to $dotFilesDirectory"
        Move-Item * $dotFilesDirectory
        # git clone https://github.com/CoryMcDonald/dotFiles.git "$dotFilesDirectory"
        # explorer $dotFilesDirectory
    }

    "Done!"
}else
{
    ./profile.ps1
}
