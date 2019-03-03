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
$newSize.Height = 50
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
    
    $Menu666="Full Install";
    
    # AD
    $Menu1 = "Active Directory"
        $Menu10 = "AD Sync"
        $Menu10a = $Menu10
    
    
    # Windows Server
    $Menu2="Windows Server"
    
        $Menu20="Server Roles"
            $Menu200="List installed Server Roles"
            $Menu201="Search Server Roles"
            $Menu202="Add Server Role"
            $Menu203="Remove Server Role"
    
        $Menu21="Server Variables"
            $Menu210="Computer Name"
                $computer=$env:computername
                $Menu210=$Menu210 + '  > ' + $computer;
            $Menu211="Workgroup Name"
                $workgroupname=(Get-WmiObject -Class Win32_ComputerSystem).Workgroup
                $Menu211=$Menu211 + ' > ' + $workgroupname;
            $Menu212="System Info"
    
    $Menu3="Network"
        $Menu30="Network interfaces"
            $Menu300="Show active Interfaces";
            $Menu301="Show all Interfaces";

    $Menu4="Windows Updates"
        $Menu40="List installed Windows Updates"


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
    $os = Get-WmiObject -Class Win32_OperatingSystem | ForEach-Object -MemberName Caption;
    $cool_info= "[DOMAIN:$user_domain]   [COMPUTER NAME:$computer_name]   [USER:$user_name]";
    write_reverse_banner_darkblue "$dt";
    #write_reverse_banner_red "WinServer CLI";
    write_reverse_banner_red "$os";
    write_banner_darkblue "...%%%%%....%%%%...%%......%%%%%%.........%%...%%..%%%%%%..%%..%%...%%%%...%%%%%%..%%%%%...%%..%%..%%%%%%..%%%%%..."
    write_banner_darkblue "...%%..%%..%%..%%..%%......%%.............%%...%%....%%....%%%.%%..%%......%%......%%..%%..%%..%%..%%......%%..%%.."
    write_banner_darkblue "...%%..%%..%%%%%%..%%......%%%%...........%%.%.%%....%%....%%.%%%...%%%%...%%%%....%%%%%...%%..%%..%%%%....%%%%%..."
    write_banner_darkblue "...%%..%%..%%..%%..%%......%%.............%%%%%%%....%%....%%..%%......%%..%%......%%..%%...%%%%...%%......%%..%%.."
    write_banner_darkblue "...%%%%%...%%..%%..%%%%%%..%%%%%%..........%%.%%...%%%%%%..%%..%%...%%%%...%%%%%%..%%..%%....%%....%%%%%%..%%..%%.."
    write_reverse_banner_red $cool_info;
    write_banner_darkblue $Menu;
    write-host '';
    write_banner_white '>> Author : David Lejeune' 
    write_banner_white ">> Created : 02-03-2019"
    Write-Host ''

}

function show_header(){

    Clear-Host
    $dt = Get-Date
    $user_name=$env:UserName
    $user_domain=$env:UserDomain
    $computer_name=$env:ComputerName
    $os = Get-WmiObject -Class Win32_OperatingSystem | ForEach-Object -MemberName Caption;
    $cool_info= "[DOMAIN:$user_domain]   [COMPUTER NAME:$computer_name]   [USER:$user_name]";
    write_reverse_banner_darkblue "$dt";
    #write_reverse_banner_red "WinServer CLI";
    write_reverse_banner_red "$os";
    write_banner_darkblue "...%%%%%....%%%%...%%......%%%%%%.........%%...%%..%%%%%%..%%..%%...%%%%...%%%%%%..%%%%%...%%..%%..%%%%%%..%%%%%..."
    write_banner_darkblue "...%%..%%..%%..%%..%%......%%.............%%...%%....%%....%%%.%%..%%......%%......%%..%%..%%..%%..%%......%%..%%.."
    write_banner_darkblue "...%%..%%..%%%%%%..%%......%%%%...........%%.%.%%....%%....%%.%%%...%%%%...%%%%....%%%%%...%%..%%..%%%%....%%%%%..."
    write_banner_darkblue "...%%..%%..%%..%%..%%......%%.............%%%%%%%....%%....%%..%%......%%..%%......%%..%%...%%%%...%%......%%..%%.."
    write_banner_darkblue "...%%%%%...%%..%%..%%%%%%..%%%%%%..........%%.%%...%%%%%%..%%..%%...%%%%...%%%%%%..%%..%%....%%....%%%%%%..%%..%%.."
    #Write-Host '.......................................................................................................................' -ForegroundColor Yellow
    #Write-Host " ____              __                  __      __              ____                                           " -ForegroundColor Yellow                     
    #Write-Host "/\  _`\           /\ \                /\ \  __/\ \  __        /\  _`\                                         " -ForegroundColor Yellow                   
    #Write-Host "\ \ \/\ \     __  \ \ \         __    \ \ \/\ \ \ \/\_\    ___\ \,\L\_\     __   _ __   __  __     __   _ __  " -ForegroundColor Yellow
    #Write-Host " \ \ \ \ \  /'__`\ \ \ \  __  /'__`\   \ \ \ \ \ \ \/\ \ /' _ `\/_\__ \   /'__`\/\`'__\/\ \/\ \  /'__`\/\`'__\" -ForegroundColor Yellow
    #Write-Host "  \ \ \_\ \/\ \L\.\_\ \ \L\ \/\  __/    \ \ \_/ \_\ \ \ \/\ \/\ \/\ \L\ \/\  __/\ \ \/ \ \ \_/ |/\  __/\ \ \/ " -ForegroundColor Yellow
    #Write-Host "   \ \____/\ \__/.\_\\ \____/\ \____\    \ `\___x___/\ \_\ \_\ \_\ `\____\ \____\\ \_\  \ \___/ \ \____\\ \_\ " -ForegroundColor Yellow
    #Write-Host "    \/___/  \/__/\/_/ \/___/  \/____/     '\/__//__/  \/_/\/_/\/_/\/_____/\/____/ \/_/   \/__/   \/____/ \/_/ "-ForegroundColor Yellow
    #Write-Host "    ___        __        __    __ _       __                          " -ForegroundColor Yellow  
    #Write-Host "   /   \__ _  / /  ___  / / /\ \ (_)_ __ / _\ ___ _ ____   _____ _ __ " -ForegroundColor Yellow  
    #Write-Host "  / /\ / _` |/ /  / _ \ \ \/  \/ / | '_ \\ \ / _ \ '__\ \ / / _ \ '__|" -ForegroundColor Yellow  
    #Write-Host " / /_// (_| / /__|  __/  \  /\  /| | | | |\ \  __/ |   \ V /  __/ |   " -ForegroundColor Yellow  
    #Write-Host "/___,' \__,_\____/\___|   \/  \/ |_|_| |_\__/\___|_|    \_/ \___|_|  " -ForegroundColor Yellow  
    
    #write_banner_darkblue "    dMMMMb  .aMMMb  dMP     dMMMMMP        dMP dMP dMP dMP dMMMMb  .dMMMb  dMMMMMP dMMMMb  dMP dMP dMMMMMP dMMMMb "  
    #write_banner_darkblue "   dMP VMP dMP""dMP dMP     dMP            dMP dMP dMP amr dMP dMP dMP"" VP dMP     dMP.dMP dMP dMP dMP     dMP.dMP " 
    #write_banner_darkblue "  dMP dMP dMMMMMP dMP     dMMMP          dMP dMP dMP dMP dMP dMP  VMMMb  dMMMP   dMMMMK"" dMP dMP dMMMP   dMMMMK""  " 
    #write_banner_darkblue " dMP.aMP dMP dMP dMP     dMP            dMP.dMP.dMP dMP dMP dMP dP .dMP dMP     dMP""AMF  YMvAP"" dMP     dMP""AMF   "   
    #write_banner_darkblue " dMMMMP"" dMP dMP dMMMMMP dMMMMMP         VMMMPVMMP"" dMP dMP dMP  VMMMP"" dMMMMMP dMP dMP    VP""  dMMMMMP dMP dMP " 


    #write_banner_darkblue " ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ ____ ____ ____ " 
    #write_banner_darkblue "||D |||a |||L |||e |||       |||W |||i |||n |||S |||e |||r |||v |||e |||r ||" 
    #write_banner_darkblue "||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||__|||__|||__||" 
    #write_banner_darkblue "|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|" 
    #write_banner_darkblue ""


    #write_banner_darkblue "   ___       __         _      ___      ____                    " 
    #write_banner_darkblue "  / _ \___ _/ /  ___   | | /| / (_)__  / __/__ _____  _____ ____" 
    #write_banner_darkblue " / // / _ `/ /__/ -_)  | |/ |/ / / _ \_\ \/ -_) __/ |/ / -_) __/" 
    #write_banner_darkblue "/____/\_,_/____/\__/   |__/|__/_/_//_/___/\__/_/  |___/\__/_/   " 

    
    #write_banner_darkblue "      ____              __                ________  __         _______                                  "
    #write_banner_darkblue "     / __ \   ____ _   / /      ___      |  |  |  ||__|.-----.|     __|.-----..----..--.--..-----..----."
    #write_banner_darkblue "    / / / /  / __ `/  / /      / _ \     |  |  |  ||  ||     ||__     ||  -__||   _||  |  ||  -__||   _|"
    #write_banner_darkblue "   / /_/ /  / /_/ /  / /___   /  __/     |________||__||__|__||_______||_____||__|   \___/ |_____||__|  "
    #write_banner_darkblue "  /_____/   \__,_/  /_____/   \___/                                                                     "


    write_reverse_banner_red $cool_info;
    write_banner_darkblue $Menu;
    Write-Host ''
}

function write_banner_darkblue($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor darkblue -ForegroundColor white;
}

function write_reverse_banner_darkblue($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor Darkblue -ForegroundColor white;
}
function write_banner_darkgray($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor darkgray -ForegroundColor white;
}

function write_reverse_banner_darkgray($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor DarkGray -ForegroundColor white;
}
function write_banner_yellow($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host ' ' $entry '' $filler  -BackgroundColor yellow -ForegroundColor Black;
}

function write_reverse_banner_yellow($entry){
    $filler="";
    For ($i=2; $i -le 116 - $entry.length; $i++) {
        $filler=' ' + $filler;
        }
    Write-Host '' $filler '' $entry '' -BackgroundColor yellow -ForegroundColor Black;
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
    For ($i=2; $i -le 116 - $entry.length; $i++) {
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


function import_pswindowsupdate_module(){
    write_banner_action "Installing PSWindowsUpdate module";
    Start-Sleep 1;
    ProcessingAnimation { Install-Module PSWindowsUpdate };
    if (Get-Module -ListAvailable -Name "PSWindowsUpdate") {
        $Menu40 = "PSWindowsUpdate"
        write_banner_white "PSWindowsUpdate installed ";
        Start-Sleep 1;
         } 
    else {
        $Menu40 = $Menu40 + " [Module not present]";
        write_banner_red "Module PSWindowsUpdate could not be installed"
        #Start-Sleep 3;
        pause;
        show_updates_menu;
    }
}

function get_uptime(){
    $os = Get-WmiObject win32_operatingsystem; $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime)); 
    Write-Host "Uptime: " $Uptime.Days " days, " $Uptime.Hours " hours, " + $Uptime.Minutes + " minutes"
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
    $Host.UI.RawUI.ForegroundColor = 'Yellow'
    Start-ADSyncSyncCycle -PolicyType Initial ;
}

function delta_adsync(){
    write_info "Delta ADSync";
    $Host.UI.RawUI.ForegroundColor = 'Yellow'
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





        # AD MENU -----------------------------------------------------------------------------------
        "2"
        {
            #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
            $Menu       = $Menu2;
            show_winserver_menu;
        }
            "20"
            {
                #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu20;
                show_serverroles_menu;
            }
                "200"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu200;
                    show_header;
                    list_installed_server_roles;
                    pause
                    show_serverroles_menu;
                }
                "201"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu201;
                    show_header;
                    search_server_roles;
                    pause
                    show_serverroles_menu;
                }
                "202"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu202;
                    show_header;
                    write_banner_info "Please search for a role first"
                    search_server_roles;
                    add_server_roles;
                }
                "203"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu203;
                    show_header;
                    list_installed_server_roles;
                    remove_server_role;
                }

            "21"
            {
                #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu21;
                show_servervariables_menu;
            }
                "210"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu210;
                    show_header;
                    computer_name;
                    show_servervariables_menu;
                }
                "211"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu211;
                    show_header;
                    get_workgroup;
                    show_servervariables_menu;
                }
                "212"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu212;
                    show_header;
                    systeminfo;
                    pause;
                    show_servervariables_menu;
                }

            "3"
            {
                #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu3;
                show_network_menu;
            }
                "30"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu30;
                    show_networkinterfaces_menu;
                }
                    "300"
                    {
                        #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                        $Menu       = $Menu300;
                        show_header;
                        list_connected_interfaces;
                        pause;
                        $Menu       = $Menu30;
                        show_networkinterfaces_menu;

                    }
                    "301"
                    {
                        #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                        $Menu       = $Menu301;
                        show_header;
                        list_all_interfaces;
                        pause;
                        $Menu       = $Menu30;
                        show_networkinterfaces_menu;

                    }


            "4"
            {
                #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu4;
                show_header;
                import_pswindowsupdate_module;
                show_updates_menu;
            }
                "40"
                {
                    #Write-Host "`nYou have selected $(($Menu1).ToUpper())`n" -ForegroundColor DarkGreen;
                    $Menu       = $Menu40;
                    
                        }


            # -----------------------------------------------------------------------------------
            # STANDARD OPTIONS
            "q"
            {
                write_banner_info "You have selected $MenuQ" ;
                $Menu       = $MenuQ;
                Start-Sleep 1;
                exit;
                exit;

            }

            "99"
            {
                #Write-Host "`nYou have selected $(($Menu99).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       = $Menu99;
                show_description;
            }

            "666"
            {
                #Write-Host "`nYou have selected $(($Menu69).ToUpper())`n" -ForegroundColor DarkGreen;
                $Menu       =  $Menu66;
                full_install;
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

function full_install(){
    
    show_header;
    computer_name;
    
    get_workgroup;

    $Menu="Full Install Completed"
    show_header;
    show_main_menu;

}

function show_ad_menu(){
    show_header;
    ad_menu;
}

function show_winserver_menu(){
    show_header;
    winserver_menu;
}
function show_serverroles_menu(){
    show_header;
    serverroles_menu;
}

function show_servervariables_menu(){
    show_header;
    servervariables_menu;
}
function show_main_menu(){
    show_header;
    main_menu;
}

function show_network_menu(){
    show_header;
    network_menu;

}
function show_networkinterfaces_menu(){
    show_header;
    networkinterfaces_menu;

}

function show_updates_menu(){
    show_header;
    updates_menu;

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
    Write-Host ' '  -ForegroundColor Gray;
    Write-Host '    666.   '$Menu666  -ForegroundColor Magenta;

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
function winserver_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    20.   '$Menu20  -ForegroundColor Gray;
    Write-Host '    21.   '$Menu21  -ForegroundColor Gray;
    Write-Host '    22.   '$Menu22  -ForegroundColor Gray;
    Write-Host '    23.   '$Menu23  -ForegroundColor Gray;
    Write-Host '    24.   '$Menu24  -ForegroundColor Gray;
    Write-Host '    25.   '$Menu25  -ForegroundColor Gray;
    Write-Host '    26.   '$Menu26  -ForegroundColor Gray;
    Write-Host '    27.   '$Menu27  -ForegroundColor Gray;
    Write-Host '    28.   '$Menu28  -ForegroundColor Gray;
    Write-Host '    29.   '$Menu29  -ForegroundColor Gray;

    standard_options;
}

function servervariables_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    210.   '$Menu210  -ForegroundColor Gray;
    Write-Host '    211.   '$Menu211  -ForegroundColor Gray;
    Write-Host '    212.   '$Menu212  -ForegroundColor Gray;
    Write-Host '    '#213.   '$Menu213  -ForegroundColor Gray;
    Write-Host '    '#214.   '$Menu214  -ForegroundColor Gray;
    Write-Host '    '#215.   '$Menu215  -ForegroundColor Gray;
    Write-Host '    '#216.   '$Menu216  -ForegroundColor Gray;
    Write-Host '    '#217.   '$Menu217  -ForegroundColor Gray;
    Write-Host '    '#218.   '$Menu218  -ForegroundColor Gray;
    Write-Host '    '#219.   '$Menu219  -ForegroundColor Gray;

    standard_options;
}



function network_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    30.   '$Menu30  -ForegroundColor Gray;
    Write-Host '    31.   '$Menu31  -ForegroundColor Gray;
    Write-Host '    32.   '$Menu32  -ForegroundColor Gray;
    Write-Host '    33.   '$Menu33  -ForegroundColor Gray;
    Write-Host '    34.   '$Menu34  -ForegroundColor Gray;
    Write-Host '    35.   '$Menu35  -ForegroundColor Gray;
    Write-Host '    36.   '$Menu36  -ForegroundColor Gray;
    Write-Host '    37.   '$Menu37  -ForegroundColor Gray;
    Write-Host '    38.   '$Menu38  -ForegroundColor Gray;
    Write-Host '    39.   '$Menu39  -ForegroundColor Gray;

    standard_options;
}

function networkinterfaces_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    300.   '$Menu300  -ForegroundColor Gray;
    Write-Host '    301.   '$Menu301  -ForegroundColor Gray;
    Write-Host '    '#212.   '$Menu212  -ForegroundColor Gray;
    Write-Host '    '#213.   '$Menu213  -ForegroundColor Gray;
    Write-Host '    '#214.   '$Menu214  -ForegroundColor Gray;
    Write-Host '    '#215.   '$Menu215  -ForegroundColor Gray;
    Write-Host '    '#216.   '$Menu216  -ForegroundColor Gray;
    Write-Host '    '#217.   '$Menu217  -ForegroundColor Gray;
    Write-Host '    '#218.   '$Menu218  -ForegroundColor Gray;
    Write-Host '    '#219.   '$Menu219  -ForegroundColor Gray;

    standard_options;
}


function updates_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    40.   '$Menu40  -ForegroundColor Gray;
    Write-Host '    41.   '$Menu41  -ForegroundColor Gray;
    Write-Host '    42.   '$Menu42  -ForegroundColor Gray;
    Write-Host '    43.   '$Menu43  -ForegroundColor Gray;
    Write-Host '    44.   '$Menu44  -ForegroundColor Gray;
    Write-Host '    45.   '$Menu45  -ForegroundColor Gray;
    Write-Host '    46.   '$Menu46  -ForegroundColor Gray;
    Write-Host '    47.   '$Menu47  -ForegroundColor Gray;
    Write-Host '    48.   '$Menu48  -ForegroundColor Gray;
    Write-Host '    49.   '$Menu49  -ForegroundColor Gray;

    standard_options;
}



function list_connected_interfaces(){
    $Host.UI.RawUI.ForegroundColor = 'Yellow'
    write_banner_action "Showing connected interfaces";
    $ConnectedInterfaces=(Get-WmiObject win32_networkadapter -filter "netconnectionstatus = 2" | select NetconnectionId, Name, InterfaceIndex, netconnectionstatus);
    $ConnectedInterfaces | Format-List InterfaceIndex , NetconnectionId , Name
    $Host.UI.RawUI.ForegroundColor = 'White'
}

function list_all_interfaces(){
    $Host.UI.RawUI.ForegroundColor = 'Yellow'
    write_banner_action "Showing all interfaces";
    $ConnectedInterfaces=(Get-WmiObject win32_networkadapter  | select NetconnectionId, Name, InterfaceIndex, NetconnectionStatus);
    $ConnectedInterfaces | Format-Table InterfaceIndex , NetconnectionId , NetconnectionStatus, Name;
    $Host.UI.RawUI.ForegroundColor = 'White'
}



function show_serverroles_menu(){
    show_header;
    serverroles_menu;
}
function serverroles_menu(){
    
    Write-Host " Menu :" -ForegroundColor Magenta;
    Write-Host " " ;

    Write-Host '    200.   '$Menu200  -ForegroundColor Gray;
    Write-Host '    201.   '$Menu201  -ForegroundColor Gray;
    Write-Host '    202.   '$Menu202  -ForegroundColor Gray;
    Write-Host '    203.   '$Menu203  -ForegroundColor Gray;
    Write-Host '    '#24.   '$Menu24  -ForegroundColor Gray;
    Write-Host '    '#25.   '$Menu25  -ForegroundColor Gray;
    Write-Host '    '#26.   '$Menu26  -ForegroundColor Gray;
    Write-Host '    '#27.   '$Menu27  -ForegroundColor Gray;
    Write-Host '    '#28.   '$Menu28  -ForegroundColor Gray;
    Write-Host '    '#29.   '$Menu29  -ForegroundColor Gray;

    standard_options;
}


function list_installed_server_roles(){
    Get-WindowsFeature | where {$_.installed -eq $true} 
}
function search_server_roles(){
    write_banner_action "Getting server roles"
    write_action "Type the name of the server role you want to search."
    write_action "If left empty it will return all server roles."
    write_action "Type [q] to quit."
    $Host.UI.RawUI.ForegroundColor = 'white'
    $Continue = Read-Host -Prompt 'Search for Server Role(s) ';
    switch ($Continue)
    {
        ""
            {
                $SearchValue = "*" ;
                list_server_roles $SearchValue;
            }

        q
            {
                write_action "You chose to quit."
                Write-Host ""
                $Menu=$Menu20
                show_header;
                show_serverroles_menu;
                exit
            }

        default
            {
                $SearchValue = '*'+$Continue+'*' ;
                list_server_roles $SearchValue;
            }
    }
}

function computer_name(){
    $str="Computer Name is " + $computer;
    write_banner_info $str;
    $Host.UI.RawUI.ForegroundColor = 'white'
    $Continue = Read-Host -Prompt 'Would you like to change the Computer Name ? [y/N] ';
    switch ($Continue)
    {
        y
            {
                $Host.UI.RawUI.ForegroundColor = 'white'
                $NewName = Read-Host -Prompt 'Enter the new Computer Name ';
                switch ($NewName) {
                    ""
                        {
                            write_banner_warning "You didn't enter a valid name"
                            pause
                            show_header;
                            servervariables_menu;
                        }
                    default 
                        {
                            write_banner_warning "This will rename the computer and restart the server."
                            Rename-Computer -ComputerName $computer -NewName $NewName -Restart;
                            ProcessingAnimation { Start-Sleep 5 };
                            pause;
                            show_header;
                            servervariables_menu;
                                        
                            exit
                        }
                }

            }

        default
            {
                $Menu=$Menu21
                #show_header;
                #servervariables_menu;
            }
    }
}

function is_part_of_domain(){
    # PartOfDomain (boolean Property)
    return (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain
}

function get_workgroup(){
    #$status=is_part_of_domain;
    #if ($status -eq $False) 
    #{
        #write_banner_warning "This computer is not part of a domain"
        #pause
        #show_header
        #servervariables_menu

    #}
    #Else 
    #{
        # Workgroup (string Property)
        $workgroup_name = (Get-WmiObject -Class Win32_ComputerSystem).Workgroup;
        $str="The Workgroup Name is " + $workgroup_name;
        write_banner_info $str;
        change_workgroup_name;
    #}
    
}

function change_workgroup_name(){
    $Host.UI.RawUI.ForegroundColor = 'white'
    $Continue = Read-Host -Prompt 'Would you like to change the Workgroup Name ? [y/N] ';
    switch ($Continue)
    {
        y
            {
                $Host.UI.RawUI.ForegroundColor = 'white'
                $NewName = Read-Host -Prompt 'Enter the new Workgroup Name ';
                switch ($NewName) {
                    ""
                        {
                            write_banner_warning "You didn't enter a valid name"
                            pause
                            show_header;
                            servervariables_menu;
                        }
                    default {
                        write_banner_warning "This will rename the Workgroup and restart the server."
                        Add-Computer -WorkGroupName $NewName -Restart;
                        ProcessingAnimation { Start-Sleep 5 };
                        pause;
                        show_header;
                        servervariables_menu;
                        exit
                    }
                }

            }

        default
            {
                $Menu=$Menu21;
            }
    }
}

function list_server_roles($search){
    Get-WindowsFeature $search;
}

function add_server_roles(){
    write_banner_action "Adding server role"
    write_action "Type the name of the server role you want to add."
    write_action "If left empty it will not add a server role."
    $Host.UI.RawUI.ForegroundColor = 'White'
    $Continue = Read-Host -Prompt 'Add Server Role ';
    switch ($Continue)
    {
        ""
            {
                write_banner_warning "You didn't select a Server Role";
                pause
                show_serverroles_menu;
            }

        default
            {
                $ServerRole = $Continue ;
                write_banner_warning "This will install the Server Role and restart the Server if neccessary.";
                Start-Sleep 2;
                            
                Install-WindowsFeature -Name $ServerRole -restart;
                $Host.UI.RawUI.ForegroundColor = 'White'
                show_serverroles_menu;
            }
    }
}


function remove_server_role(){
    write_banner_action "Removing server role"
    write_action "Type the name of the server role you want to remove."
    write_action "If left empty it will not remove a server role."
    $Host.UI.RawUI.ForegroundColor = 'White'
    $Continue = Read-Host -Prompt 'Add Server Role ';
    switch ($Continue)
    {
        ""
            {
                write_banner_warning "You didn't select a Server Role";
                pause
                show_serverroles_menu;
            }

        default
            {
                $ServerRole = $Continue ;
                write_banner_warning "This will remove the Server Role and restart the Server if neccessary.";
                             
                UnInstall-WindowsFeature -Name $ServerRole -restart;
                $Host.UI.RawUI.ForegroundColor = 'White'
                show_serverroles_menu;
            }
    }
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
        $frames = '  PROCESSING |', '  PROCESSING /', '  PROCESSING -', '  PROCESSING \' 
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
ProcessingAnimation { Start-Sleep 0 }

show_main_menu;
pause
