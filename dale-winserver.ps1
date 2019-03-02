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
$newSize.Width = 25

$psWindow.BufferSize = $newSize

$newSize = $psWindow.WindowSize
$newSize.Height = 35
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
            show_header;
            ad_menu;
            ask_menu;
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
                $Menu       = "Main Menu";
                show_header;
                main_menu;
                ask_menu;
            }


            default {
            Write-Host "The choice could not be determined." -ForegroundColor Red
            }
        }


}

function main_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host "";
    Write-Host '    1.   '$Menu1  -ForegroundColor Gray;

    standard_options;
}

function standard_options(){

    Write-Host '   ';
    Write-Host '    69.  '$Menu69 -ForegroundColor Yellow;
    Write-Host '    99.  '$Menu99 -ForegroundColor DarkGRay;
    Write-Host '    666. '$Menu666 -ForegroundColor Red;
    Write-Host ""
}


#------------------------------------------------------------------------------
#Start Script
#------------------------------------------------------------------------------
show_headerintro;
show_description;
Start-Sleep 2 ;
show_header;
main_menu;
ask_menu
pause
