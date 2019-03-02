# Description
# -----------
function show_description(){
    #feeding the narcistic beast
    Write-Host "# Description" -ForegroundColor white
    Write-Host "# -----------" -ForegroundColor white
    Write-Host "# Windows Server Management" -ForegroundColor yellow
    Write-Host ""
    Write-Host "# Author : David Lejeune" -ForegroundColor magenta
    Write-Host "# Created : 02-03-2019" -ForegroundColor magenta
    Write-Host ""

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
$Menu666 = "Quit"
$Menu99 = "Show description"

# AD
$Menu1 = "Active Directory"
$Menu10 = "AD Sync"
$Menu10a = $Menu10


#------------------------------------------------------------------------------
#Functions
#------------------------------------------------------------------------------
function show_headerintro(){

    Clear-Host
    Write-Host '      ____              __        ' -ForegroundColor Yellow
    Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
    Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
    Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
    Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
    Write-Host '' -ForegroundColor Yellow
    Write-Host ''
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue
    Write-Host '    |W|i|n|S|e|r|v|e|r| |C|L|I|' -ForegroundColor Blue
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue
    Write-Host ''
    Write-Host '  >> Author : David Lejeune' -ForegroundColor Red
    Write-Host "  >> Created : 02-03-2019" -ForegroundColor Red
    Write-Host ''
    Write-Host ' #####################################'  -ForegroundColor DarkGreen
    Write-Host "        $($Menu)             " -ForegroundColor DarkGreen
    Write-Host ' #####################################' -ForegroundColor DarkGreen
    Write-Host ''
}
function show_header(){
    Clear-Host
    Write-Host '      ____              __        ' -ForegroundColor Yellow
    Write-Host '     / __ \   ____ _   / /      ___ ' -ForegroundColor Yellow
    Write-Host '    / / / /  / __ `/  / /      / _ \' -ForegroundColor Yellow
    Write-Host '   / /_/ /  / /_/ /  / /___   /  __/' -ForegroundColor Yellow
    Write-Host '  /_____/   \__,_/  /_____/   \___/ ' -ForegroundColor Yellow
    Write-Host '' -ForegroundColor Yellow
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue
    Write-Host '    |W|i|n|S|e|r|v|e|r| |C|L|I|' -ForegroundColor Blue
    Write-Host '    +-+-+-+-+-+ +-+-+-+-+-+-+-+' -ForegroundColor Blue
    Write-Host ''
    Write-Host ' #####################################'  -ForegroundColor DarkGreen
    Write-Host "        $($Menu)             " -ForegroundColor DarkGreen
    Write-Host ' #####################################' -ForegroundColor DarkGreen
    Write-Host ''
}

function adsync(){
    write_info "Importing ADSync module";
    Import-Module ADSync
    if (Get-Module -ListAvailable -Name "ADSync") {
        $Menu10 = "AD Sync"
        write_info "Showing scheduled ADSync";
        Get-ADSyncScheduler
        write_info "Starting ADSync";
        adsync_choice;
    } 
    else {
        $Menu10 = "AD Sync [Module not present]"
        write_warning "Module ADSync does not exist"
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

function full_adsync(){
    write_info "Starting Full ADSync";
    initial_adsync;
    Start-Sleep 60 ; 
    delta_async;
}

function initial_adsync(){
    write_info "Inital ADSync";
    Start-ADSyncSyncCycle -PolicyType Initial ;
}

function delta_adsync(){
    write_info "Delta ADSync";
    Start-ADSyncSyncCycle -PolicyType Delta;
}

# Menus
function ask_menu(){
        
    #Select action
    $Menu = Read-Host -Prompt 'Select an option ';
    switch ($Menu)
        {

        # AD MENU -----------------------------------------------------------------------------------
        1
        {
            Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
            $Menu       = $Menu1;
            show_ad_menu;
        }
            10
            {
                Write-Host "`nYou have selected $(($Menu10).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu10;
                show_header;
                adsync;
                ask_menu;
            }

            # -----------------------------------------------------------------------------------
            # STANDARD OPTIONS
            666
            {
                Write_Host "`nYou have selected $(($Menu666).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu666;
                exit;
                exit;

            }

            99
            {
                Write-Host "`nYou have selected $(($Menu99).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu99;
                show_header;
                show_description;
                ask_menu;
            }

            69
            {
                Write-Host "`nYou have selected $(($Menu69).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       =  $Menu0;
                show_main_menu;
            }


            default {
                write_warning "The choice could not be determined.";
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
    Write-Host '    666. '$Menu666 -ForegroundColor Red;
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

#------------------------------------------------------------------------------
#Start Script
#------------------------------------------------------------------------------
show_headerintro;
show_description;
Start-Sleep 1 ;
show_main_menu;
pause
