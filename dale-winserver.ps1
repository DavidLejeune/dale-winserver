# Description
# -----------
function show_description(){
    show_header;
    #feeding the narcistic beast
    Write-Host "# Description" -ForegroundColor white
    Write-Host "# -----------" -ForegroundColor white
    Write-Host "# Windows Server Management" -ForegroundColor yellow
    Write-Host ""
    Write-Host "# Author : David Lejeune" -ForegroundColor magenta
    Write-Host "# Created : 02-03-2019" -ForegroundColor magenta
    Write-Host ""
    standard_options;

}
#------------------------------------------------------------------------------
#Inits
#------------------------------------------------------------------------------
# Set Style
$pshost = Get-Host
$psWindow = $pshost.UI.RawUI
$newSize =$psWindow.BufferSize

$newSize.Height = 4000
$newSize.Width = 120

$psWindow.BufferSize = $newSize

$newSize = $psWindow.WindowSize
$newSize.Height = 40
$newSize.Width = 120

$psWindow.WindowSize= $newSize

$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'black')
$Host.UI.RawUI.ForegroundColor = 'White'
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.ErrorBackgroundColor = $bckgrnd
$Host.PrivateData.WarningForegroundColor = 'Magenta'
$Host.PrivateData.WarningBackgroundColor = $bckgrnd
$Host.PrivateData.DebugForegroundColor = 'Yellow'
$Host.PrivateData.DebugBackgroundColor = $bckgrnd
$Host.PrivateData.VerboseForegroundColor = 'Green'
$Host.PrivateData.VerboseBackgroundColor = $bckgrnd
$Host.PrivateData.ProgressForegroundColor = 'Cyan'
$Host.PrivateData.ProgressBackgroundColor = $bckgrnd

#------------------------------------------------------------------------------
#Script Variables
#------------------------------------------------------------------------------
$CurrentPath = (Get-Item -Path ".\").FullName;
$ParentPath = $CurrentPath.Replace("\dale-server", "");

# Standard menu
$Menu="WINDOWS SERVER MANAGEMENT"
$Menu0 = "Main Menu"
$Menu69="Return to main menu"
$MenuQ = "Quit"
$Menu99 = "Show description"

# AD
$Menu1 = "Active Directory"
$Menu10 = "AD Sync"
$Menu10a = $Menu10


#------------------------------------------------------------------------------
#Functions
#------------------------------------------------------------------------------

function show_header_old(){
    Clear-Host
    Write-Host '      ____              __        ' -ForegroundColor Yellow
    Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
    Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
    Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
    Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
    Write-Host '';
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue
    Write-Host '    |W|i|n|S|e|r|v|e|r| |C|L|I|' -ForegroundColor Blue
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue 
    Write-Host ''
    Write-Host ' #####################################'  -ForegroundColor DarkGreen
    Write-Host "        $($Menu)             " -ForegroundColor DarkGreen
    Write-Host ' #####################################' -ForegroundColor DarkGreen
    Write-Host ''
}
function show_headerintro(){

    Clear-Host
    $dt = Get-Date
    $user_name=$env:UserName
    $user_domain=$env:UserDomain
    $computer_name=$env:ComputerName
    $cool_info= "[DOMAIN:$user_domain]   [COMPUTER NAME:$computer_name]   [USER:$user_name]";
    write_reverse_banner_red $cool_info;
    write_reverse_banner_blue "$dt";
    Write-Host '      ____              __        ' -ForegroundColor Yellow
    Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
    Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
    Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
    Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
    Write-Host '';
    write_banner_blue "WinServer CLI";
    write_banner_white '>> Author : David Lejeune' 
    write_banner_white ">> Created : 02-03-2019"
    write_banner_red $Menu;
    Write-Host ''

}

function show_header(){

    Clear-Host
    $dt = Get-Date
    $user_name=$env:UserName
    $user_domain=$env:UserDomain
    $computer_name=$env:ComputerName
    $cool_info= "[DOMAIN:$user_domain]   [COMPUTER NAME:$computer_name]   [USER:$user_name]";
    write_reverse_banner_red $cool_info;
    write_reverse_banner_blue "$dt";
    Write-Host '      ____              __        ' -ForegroundColor Yellow
    Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
    Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
    Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
    Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
    Write-Host '';
    write_banner_blue "WinServer CLI";
    write_banner_red $Menu;
    Write-Host ''
}

function write_banner_white($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor white -ForegroundColor Black;
}

function write_reverse_banner_white($entry){
    $filler="";
    For ($i=3; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor white -ForegroundColor Black;
}

function write_banner_blue($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor Blue -ForegroundColor White;
}

function write_reverse_banner_blue($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor blue -ForegroundColor White;
}

function write_banner_red($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor red -ForegroundColor White;
}

function write_reverse_banner_red($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor red -ForegroundColor White;
}

function write_banner_darkgreen($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor DarkGreen -ForegroundColor White;
}

function write_reverse_banner_darkgreen($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor DarkGreen -ForegroundColor White;
}



function adsync(){
    write_banner_action "Importing ADSync module";
    Start-Sleep 1;
    Import-Module ADSync
    if (Get-Module -ListAvailable -Name "ADSync") {
        $Menu10 = "AD Sync"
        write_info "Showing scheduled ADSync";
        Start-Sleep 1;
        Get-ADSyncScheduler
        write_action "Starting ADSync";
        Start-Sleep 1;
        adsync_choice;
    } 
    else {
        $Menu10 = "AD Sync [Module not present]"
        write_banner_red "Module ADSync does not exist"
        #Start-Sleep 3;
        pause;
        show_ad_menu;
    }

    
}

function adsync_choice(){
    #Select action
    write_regular "Choose the type of ADSync you want to execute.";
    write_regular "[ENTER] : Full ADSync";
    write_regular "[i/I]   : Initial ADSync";
    write_regular "[d/D]   : Delta ADSync";
    write_regular "[q/Q]   : quit ADsync";
    $Choice = Read-Host -Prompt 'Would you like to sync now ? Select an option ';
    write_regular "";
    switch ($Choice)
        {

            "i"
            {
                intial_adsync;
            }
            "I"
            {
                intial_adsync;
            }
            
            "d"
            {
                delta_adsync;
            }
            "D"
            {
                delta_adsync;
            }
            
            "q"
            {
                exit;
            }
            "Q"
            {
                exit;
            }

            default {
                full_adsync;
            }
        }


}

function write_banner_info($msg){
    write_banner_blue $msg;
}

function write_banner_warning($msg){
    write_banner_red $msg;
}

function write_banner_action($msg){
    write_banner_darkgreen $msg;
}

function write_banner_regular($msg){
    write_banner_white $msg;

}


function full_adsync(){
    write_banner_info "Starting Full ADSync";
    initial_adsync;
    Start-Sleep 60 ; 
    delta_async;
}

function initial_adsync(){
    write_banner_info "Inital ADSync";
    Start-ADSyncSyncCycle -PolicyType Initial ;
}

function delta_adsync(){
    write_info "Delta ADSync";
    Start-ADSyncSyncCycle -PolicyType Delta;
}

# Menus
function ask_menu(){
        
    $Menu = Read-Host -Prompt 'Select an option ';
    switch ($Menu)
        {

        # AD MENU -----------------------------------------------------------------------------------
        "1"
        {
            #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
            $Menu       = $Menu1;
            show_ad_menu;
        }
            "10"
            {
                #Write-Host "`nYou have selected $(($Menu10).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu10;
                show_header;
                adsync;
            }

            # -----------------------------------------------------------------------------------
            # STANDARD OPTIONS
            "q"
            {
                write_banner_info "You have selected $MenuQ" ;
                $Menu       = $MenuQ;
                exit;
                exit;

            }

            "99"
            {
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu99;
                show_description;
            }

            "69"
            {
                #Write-Host "`nYou have selected $(($Menu69).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       =  $Menu0;
                show_main_menu;
            }


            default {
                write_banner_red "The choice could not be determined.";
                #Write-Host "The choice could not be determined." -ForegroundColor Red
            }
        }


}

function show_ad_menu(){
    show_header;
    ad_menu;
}

function show_main_menu(){
    show_header;
    main_menu;
}

function main_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host "";
    Write-Host '    1.   '$Menu1  -ForegroundColor Gray;
    Write-Host '    2.   '$Menu2  -ForegroundColor Gray;
    Write-Host '    3.   '$Menu3  -ForegroundColor Gray;
    Write-Host '    4.   '$Menu4  -ForegroundColor Gray;
    Write-Host '    5.   '$Menu5  -ForegroundColor Gray;
    Write-Host '    6.   '$Menu6  -ForegroundColor Gray;
    Write-Host '    7.   '$Menu7  -ForegroundColor Gray;
    Write-Host '    8.   '$Menu8  -ForegroundColor Gray;
    Write-Host '    9.   '$Menu9  -ForegroundColor Gray;

    standard_options;
}

function standard_options(){

    Write-Host '   ';
    Write-Host '    69.  '$Menu69 -ForegroundColor Yellow;
    Write-Host '    99.  '$Menu99 -ForegroundColor DarkGRay;
    Write-Host '    [q]  '$MenuQ -ForegroundColor Red;
    Write-Host ""
    ask_menu;
}

function ad_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    If ($Menu10 -eq $Menu10a) 
    {
        Write-Host '    10.   '$Menu10  -ForegroundColor Gray;
    }
    Else 
    {
        Write-Host '    10.   '$Menu10  -ForegroundColor Red;
    }

    Write-Host '    11.   '$Menu11  -ForegroundColor Gray;
    Write-Host '    12.   '$Menu12  -ForegroundColor Gray;
    Write-Host '    13.   '$Menu13  -ForegroundColor Gray;
    Write-Host '    14.   '$Menu14  -ForegroundColor Gray;
    Write-Host '    15.   '$Menu15  -ForegroundColor Gray;
    Write-Host '    16.   '$Menu16  -ForegroundColor Gray;
    Write-Host '    17.   '$Menu17  -ForegroundColor Gray;
    Write-Host '    18.   '$Menu18  -ForegroundColor Gray;
    Write-Host '    19.   '$Menu19  -ForegroundColor Gray;

    standard_options;
}

function write_warning($msg)
{
    Write-Host "$($msg)" -BackgroundColor Red -ForegroundColor White;
}
 
function write_info($msg)
{
    Write-Host "$($msg)" -ForegroundColor Blue;
}

function write_regular($msg)
{
    Write-Host "$($msg)" -ForegroundColor White;
}

function write_action($msg)
{
    Write-Host "$($msg)" -ForegroundColor DarkGreen;
}

function ask_continue(){
    $Host.UI.RawUI.ForegroundColor = 'white'
    $Continue = Read-Host -Prompt 'Press enter to return to menu or q to quit ';
    switch ($Continue)
    {
        q
            {
            $Host.UI.RawUI.ForegroundColor = 'DarkGreen'
            Write-Host "Thank you , please come again ...."
            Write-Host ""
            $Host.UI.RawUI.ForegroundColor = 'Magenta'
            exit
            }

        default
            {
                $Menu=$Menu0
                show_header;
                show_main_menu;
            }
    }
}

function check_ok(){
    $Host.UI.RawUI.ForegroundColor = 'white'
    $OkNotOk = Read-Host -Prompt "Press '[ENTER]' if this is OK , else type 'q' ? ";
    # echo $OkNotOk
    switch ($OkNotOk)
      {
          ""
            {
              Write-Host "" -ForegroundColor Yellow;
              # Write-Host "Good! Continuing with the script ..." -ForegroundColor Yellow;
            }
          q
            {
              show_warning "Something went wrong , check the error ."
              $Menu="MAIN MENU"
              show_main_menu;
            }
          default
            {
                show_warning "You seem to have made an invalid choice." 
              exit
            }
      }
    
}

function ProcessingAnimation($scriptBlock) {
    $cursorTop = [Console]::CursorTop
    
    try {
        [Console]::CursorVisible = $false
        
        $counter = 0
        $frames = '  LOADING |', '  LOADING /', '  LOADING -', '  LOADING \' 
        $jobName = Start-Job -ScriptBlock $scriptBlock
    
        while($jobName.JobStateInfo.State -eq "Running") {
            $frame = $frames[$counter % $frames.Length]
            
            
            Write-Host "$frame" -NoNewLine
            [Console]::SetCursorPosition(0, $cursorTop)
            
            $counter += 1
            Start-Sleep -Milliseconds 125
        }
        
        # Only needed if you use a multiline frames
        Write-Host ($frames[0] -replace '[^\s+]', ' ')
    }
    finally {
        [Console]::SetCursorPosition(0, $cursorTop)
        [Console]::CursorVisible = $true
    }
}

#------------------------------------------------------------------------------
#Start Script
#------------------------------------------------------------------------------
show_headerintro;
ProcessingAnimation { Start-Sleep 1 }

show_main_menu;
pause
