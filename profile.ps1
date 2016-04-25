set-alias subl "$Home\Documents\dotFiles\Sublime Text 3\subl.exe"
Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
Pop-Location

function td($arg, $arg1) { ./td $arg  $arg1}
function Find-Service ($arg, $arg1) { python C:\Users\jisccm2\Desktop\Coding\Python\serviceList.py $arg $arg1}
function Find-Solution ($arg, $arg1) { python C:\Users\jisccm2\Desktop\Coding\Python\Find-Solution.py $arg $arg1 }

function desktop { cd "$env:userprofile/desktop" }
function downloads { cd "$env:userprofile/Downloads" }
function coding { cd "$env:userprofile/desktop/coding" }

function touch ($name) { echo $null >> $name }

function grep {
    $results = $input | out-string -stream | select-string $args
    $regexPattern = $args
    $regexPattern = "(?i)$regexPattern"
    $regex = New-Object System.Text.RegularExpressions.Regex $regexPattern
    Write-HostAndHighlightPattern($results)
    
}

function Write-HostAndHighlightPattern([string]$inputText)
{

    $index = 0
    while($index -lt $inputText.Length)
    {
        $match = $regex.Match($inputText, $index)
        if($match.Success -and $match.Length -gt 0)
        {
            Write-Host $inputText.SubString($index, $match.Index - $index) -nonewline
            Write-Host $match.Value.ToString() -ForegroundColor Red -nonewline
            $index = $match.Index + $match.Length
        }
        else
        {
            Write-Host $inputText.SubString($index) -nonewline
            $index = $inputText.Length
        }
    }
}

function Get-Time { return $(get-date | foreach { $_.ToLongTimeString() } ) }
function prompt
{
    # Write the time 
    write-host "[" -noNewLine
    write-host $(Get-Time) -foreground yellow -noNewLine
    write-host "] " -noNewLine
    # Write the path
    write-host $($(Get-Location).Path.replace($home,"~").replace("\","/")) -foreground green -noNewLine
    write-host $(if ($nestedpromptlevel -ge 1) { '>>' }) -noNewLine
    return "> "
}

function ll
{
    param ($dir = ".", $all = $false) 

    $origFg = $host.ui.rawui.foregroundColor 
    if ( $all ) { $toList = ls -force $dir }
    else { $toList = ls $dir }

    foreach ($Item in $toList)  
    { 
        Switch ($Item.Extension)  
        { 
            ".Exe" {$host.ui.rawui.foregroundColor = "Yellow"} 
            #text
            ".txt" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".pdf" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".csv" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".xml" {$host.ui.rawui.foregroundColor = "Blue"} 
            # Code
            ".cmd" {$host.ui.rawui.foregroundColor = "Red"} 
            ".py" {$host.ui.rawui.foregroundColor = "Red"} 
            ".ps1" {$host.ui.rawui.foregroundColor = "Red"} 
            ".rb" {$host.ui.rawui.foregroundColor = "Red"} 
            ".cs" {$host.ui.rawui.foregroundColor = "Red"} 
            ".sql" {$host.ui.rawui.foregroundColor = "Red"} 
            ".html" {$host.ui.rawui.foregroundColor = "Red"} 
            ".msh" {$host.ui.rawui.foregroundColor = "Red"} 
            ".vbs" {$host.ui.rawui.foregroundColor = "Red"} 
            Default {$host.ui.rawui.foregroundColor = $origFg} 
        } 
        if ($item.Mode.StartsWith("d")) {$host.ui.rawui.foregroundColor = "Green"}
        $item
    }  
    $host.ui.rawui.foregroundColor = $origFg 
}

function llr
{
    param ($dir = ".", $all = $false) 

    $origFg = $host.ui.rawui.foregroundColor 
    if ( $all ) { $toList = ls -R -force $dir }
    else { $toList = ls -R $dir }

    foreach ($Item in $toList)  
    { 
        Switch ($Item.Extension)  
        { 
            ".Exe" {$host.ui.rawui.foregroundColor = "Yellow"} 
            #text
            ".txt" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".pdf" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".csv" {$host.ui.rawui.foregroundColor = "Blue"} 
            ".xml" {$host.ui.rawui.foregroundColor = "Blue"} 
            # Code
            ".cmd" {$host.ui.rawui.foregroundColor = "Red"} 
            ".py" {$host.ui.rawui.foregroundColor = "Red"} 
            ".ps1" {$host.ui.rawui.foregroundColor = "Red"} 
            ".rb" {$host.ui.rawui.foregroundColor = "Red"} 
            ".cs" {$host.ui.rawui.foregroundColor = "Red"} 
            ".sql" {$host.ui.rawui.foregroundColor = "Red"} 
            ".html" {$host.ui.rawui.foregroundColor = "Red"} 
            ".msh" {$host.ui.rawui.foregroundColor = "Red"} 
            ".vbs" {$host.ui.rawui.foregroundColor = "Red"} 
            Default {$host.ui.rawui.foregroundColor = $origFg} 
        } 
        if ($item.Mode.StartsWith("d")) {$host.ui.rawui.foregroundColor = "Green"}
        Write-Output $item.FullName
    }  
    $host.ui.rawui.foregroundColor = $origFg 
}


function lla
{
    param ( $dir=".")
    ll $dir $true
}



function la { ls -force }

function Search-ADComputer {
    param(
        [String]$SearchString
        )

    $Match = Get-ADComputer -Filter "samaccountname -like '*$($SearchString)*' -or name -like '*$($SearchString)*'"

    if($Match -eq $null) {
        # Nothing was found
        Write-Host "No matching accounts were found."
        } else {
            $Match
        }

    }
function Reload-Profile {
    @(
        $Profile.AllUsersAllHosts,
        $Profile.AllUsersCurrentHost,
        $Profile.CurrentUserAllHosts,
        $Profile.CurrentUserCurrentHost
    ) | % {
        if(Test-Path $_){
            Write-Verbose "Running $_"
            . $_
        }
    }    
}
