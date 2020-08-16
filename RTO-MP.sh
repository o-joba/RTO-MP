#!/bin/bash


#Color_VAR
Ques="\e[1m\e[34m[?]\e[0m"

#Check root permsions
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo -e "\e[93m\e[1m[-]\e[0m You need to be root to run this script"
    exit
fi

#Checking Internet_Connection
if ping -q -c 2 -W 1 google.com &>/dev/null; then
#	echo -e "B\e[1m\e[94mHi \e[1m\e[39m$USER\e[92m \e[1m====>>> Your network is UP"
	true
else
	echo -e "\e[93m\e[1m[-]\e[0m Hey \e[1m$USER\e[0m Your Network is Down"
	exit
fi



#Add Kali repositres
apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6 &>/dev/null
if [[ $? -eq 0 ]]; then
    echo -e "\e[32m[+]\e[0m KALI repos intallation Done"
else
    echo -e "\e[93m\e[1m[-]\e[0m KALI repos installation Failed!"
fi

apt-get update -m &>/dev/null
if [[ $? -eq 0 ]]; then
    echo -e "\e[32m[+]\e[0m System updated successfully with new KALI repos"
else
    echo -e "\e[93m\e[1m[-]\e[0m Fail to update the system for Unknown_Reason.."
    echo -e "\e[93m\e[1m[-]\e[0m Becuase we installed new Repos .."
    echo -e "\e[93m\e[1m[-]\e[0m You need first to update the system then rerun the script"
    exit
fi



#Install basic programs
#-----
#Nmap
if ! command -v nmap &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Nmap could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Nmap ...."
        echo y | apt-get install -y nmap &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Nmap installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m Nmap intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Nmap found"

fi



#Ncat
#----
if ! command -v ncat &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Ncat could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Ncat ...."
        echo y | apt-get install -y ncat &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Ncat installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m Ncat intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Ncat found"

fi



#Tcpdump
#-------
if ! command -v tcpdump &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Tcpdump could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Tcpdump ...."
        echo y | apt-get install -y tcpdump &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Tcpdump installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m Tcpdump intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Tcpdump found"

fi

#PHP
#---
if ! command -v php &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m PHP could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing PHP ...."
        echo y | apt-get install -y php &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m PHP installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m PHP intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m PHP found"

fi


#UFW
#---
if ! command -v ufw &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m UFW could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing UFW ...."
        apt-get install -y ufw &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m UFW installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m UFW intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m UFW found"

fi




#python, python3
#---------------
if ! command -v python3 python &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Python could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Python ...."
        apt-get install -y python python3 &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Python installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m FAIL to install Python!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Python and Python3 found"

fi




#ToolsRequireForC2
#-----------------
#Armitage
#--------
if ! command -v armitage &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Armitage could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Armitage ...."
        apt-get install -y armitage &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Armitage installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m Armitage intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Armitage found"
fi



#Apache2
#-------
if ! command -v apache2 &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Apache2 could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Apache2 ...."
        apt-get install -y apache2 &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Apache2 installed successfully"
        else
            echo -e "\e[93m\e[1m[-]\e[0m Apache2 intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Apache2 found"
fi


#Create_HTTP_Uploader_IN_APACHE_DIR
#----------------------------------
echo -e "\e[32m[+]\e[0m Preparing HTTP-Uploader"
mkdir /var/www/uploads
chown www-data: /var/www/uploads
sleep 2
echo -e "\e[32m[+]\e[0m Uploads Directory Created at:  /var/www/uploads"
echo "<?php " > /var/www/html/up.php
echo "$uploaddir = '/var/www/uploads/';" >> /var/www/html/up.php
echo "$uploadfile = $uploaddir . $_FILE['file']['name'];" >> /var/www/html/up.php
echo "move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)" >> /var/www/html/up.php
sleep 2
echo -e "\e[32m[+]\e[0m HTTP-Uploader is ready to work.."
echo -e "\e[32m[+]\e[0m You can upload files to this URL: \e[1m\e[4mhttp://VPSIP/up.php\e[0m"
 

#Pure-FTPD
#---------
if ! command -v pure-ftpd &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Pure-FTPD could not be found"
        echo -e "\e[32m[+]\e[0m Now, Installing Pure-FTPD ...."
        apt-get install -y pure-ftpd &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0m Pure-FTPD installed successfully"
	    #Create Ftp_Configuration
	    groupadd ftpgroup
	    useradd -g ftpgroup -d /dev/null -s /etc ftpuser
	    read -r -p "$(echo -e $Ques" Enter your new ftp user: " )" ftpnewuser
	    ftpusername=$ftpnewuser
	    pure-pw useradd $ftpusername -u ftpuser -d /ftphome
	    pure-pw mkdb
	    cd /etc/pure-ftpd/auth/
	    ln -s ../conf/PureDB 60pdb
	    mkdir -p /ftphome
	    chown -R ftpuser:ftpgroup /ftphome/
	    systemctl restart pure-ftpdb
	    sleep 2
	    service restart pure-ftpdb
	    cd -

        else
            echo -e "\e[93m\e[1m[-]\e[0m Pure-FTPD intsallation failed!"
        fi
else
        echo -e "\e[1m\e[34m[+]\e[0m Pure-FTPD found"
fi


echo -e "================================================"
echo -e "\e[32m[+]\e[0m Pure-FTPD Status"
echo -e "\e[32m[+]\e[0m Installed Sucessfully"
echo -e "\e[32m[+]\e[0m Restarted Successfully"
echo -e "\e[32m[+]\e[0m Your new FTP-user is: $ftpusername "
echo -e "================================================"

echo "     "

echo -e "=================================================="
echo -e "\e[32m[+]\e[0m Configure SSH and Firewall Security"
echo -e "=================================================="


#Conf_Setup
#---------
#SSH Config 
#--check if sshd file exists
sshd=/etc/sshd_config
if [ -f "$sshd" ]; then
	read -r -p "$(echo -e $Ques" Enter your new SSH port number: " )" Sport
	newssh=$Sport
	echo "Port $newssh" >> /etc/sshd_config
	echo -e "\e[32m[+]\e[0m Your new SSH port is $newssh"
	echo -e "\e[1mWait for 5 sec and read"
	echo -e "\e[1m============================================================"
	echo -e "\e[93m\e[1m[!]\e[0mNotice, You must answer with one of these word [ yes/no ]"
	echo -e "\e[1m============================================================\e[0m"
	sleep 1
	read -r -p "$(echo -e $Ques" Allow root login [yes/no]: " )" rootlog
	echo "PermitRootLogin $rootlog" >> /etc/sshd_config
	read -r -p "$(echo -e $Ques" Allow Pubkey Authentication [yes/no]: " )" pubkey
	echo "PubkeyAuthentication $pubkey" >> /etc/sshd_config
        

#FireWall_Security(Ports)
echo -e "\e[32m[+]\e[0m Start Configure the Firewall"

ufw default deny incoming &> /dev/null
echo -e "\e[32m[+]\e[0m All incoming connection has been denied"

ufw default allow outgoing &> /dev/null
echo -e "\e[32m[+]\e[0m All outgoing connection has been allowd"
read -r -p "$(echo -e $Ques" Enter SSH port to be allowed: " )" sshport

ufw allow $sshport &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo -e "\e[32m[+]\e[0mPort Allowed"
	    echo -e "============="
        else
            echo -e "\e[93m\e[1m[-]\e[0mFailed to Allow the port!"
	    echo -e "==========================="
        fi

echo "================================================"	    
read -r -p "$(echo -e $Ques" Do you want install Armitage TeamServer [y/n]: " )" insarmi
	if [[ $insarmi == y ]]; then
	sleep 1
	    read -r -p "$(echo -e $Ques"  Enter Armitage Portal port to be Allowd: " )" armitage
	    ufw allow $armitage &> /dev/null
        	if [[ $? -eq 0 ]]; then
            		echo -e "\e[32m[+]\e[0mPort Allowed"
			echo -e "============="
        	else
            		echo -e "\e[93m\e[1m[-]\e[0mFailed to Allow the port!"
			echo -e "==========================="
        	
echo "================================================"
read -r -p "$(echo -e $Ques" Do you want Allow specific port to your listener [y/n]: " )" allowlist
      if [[ $allowlist == y ]]; then
                sleep 1
		echo -e "\e[32m[+]\e[0m Armitage Default Port: $(grep -i "java -D" /usr/share/armitage/teamserver | awk -F ' ' '{print $13 ''}')"
		echo -e "\e[32m[+]\e[0m If you won't change the Port enter the Default: $(grep -i "java -D" /usr/share/armitage/teamserver | awk -F ' ' '{print $13 ''}')"		 
            read -r -p "$(echo -e $Ques"  Enter listener port: " )" listener
            ufw allow $listener &> /dev/null
            if [[ $? -eq 0 ]]; then
                echo -e "\e[32m[+]\e[0m Port Allowed"
                echo -e "============="
            else
                echo -e "\e[93m\e[1m[-]\e[0m Failed to Allow the port!"
                echo -e "==========================="
            fi

echo "================================================"

read -r -p "$(echo -e $Ques" Do you want allow Just your VPN IP/Connection [y/n]: " )" allowvpn
      if [[ $allowvpn == y ]]; then
                sleep 1
            read -r -p "$(echo -e $Ques"  Enter your VPN IP: " )" vpnip
            ufw allow all $vpnip &> /dev/null
            if [[ $? -eq 0 ]]; then
                echo -e "\e[32m[+]\e[0m Port Allowed"
                echo -e "============="
            else
                echo -e "\e[93m\e[1m[-]\e[0m Failed to Allow the port!"
                echo -e "==========================="
            fi

ufw enable 
echo -e "\e[32m[+]\e[0m Runing the Firewall"
ufw status | grep -qw active &> /dev/null
	if [ $? = 0 ]; then
    	    echo -e "\e[32m[+]\e[0m Firewall is working now :)"
	else
    	    echo -e "\e[93m\e[1m[-]\e[0m $USER, We couldn't run the Firewall for Unknown_Reason!"
	fi

echo "================================================"


#restart All Config
systemctl restart sshd &> /dev/null
echo -e "\e[32m[+]\e[0m Restarting SSH service"

echo -e " "
echo -e "========================"
echo -e "\e[32m[+]\e[0m Installation Report"
echo -e "========================"
echo -e " "

echo -e "========================================================"
echo -e "=                   Installed Tools                    ="
echo -e "========================================================"

if ! command -v nmap &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Nmap Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Nmap    Installed Successfully"
fi

if ! command -v tcpdump &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Tcpdump Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Tcpdump Installed Successfully"
fi

if ! command -v php &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m PHP Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m PHP     	Installed Successfully"
fi

if ! command -v ufw &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m UFW Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m UFW     	Installed Successfully"
fi

if ! command -v python &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Python Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Python  Installed Successfully"
fi

if ! command -v python3 &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Python3 Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Python3 Installed Successfully"
fi

if ! command -v apache2 &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Apache2 Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Apache2 Installed Successfully"
fi

if ! command -v pure-ftpd &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Pure-FTPD Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Pure-FTPD Installed Successfully"
fi

if ! command -v armitage &> /dev/null
then
        echo -e "\e[1m\e[93m[-]\e[0m Armitage Installation Failed for Unknown_Reason!"
else
        echo -e "\e[1m\e[34m[+]\e[0m Armitage Installed Successfully"
fi


echo -e "========================================================"
echo -e "=                   Firewall Status                    ="
echo -e "========================================================"

ufw status | grep -qw active &> /dev/null
        if [ $? = 0 ]; then
            echo -e "\e[32m[+]\e[0m Firewall is running ..."
        else
            echo -e "\e[93m\e[1m[-]\e[0m $USER, Firewall is not running for Unknown_Reason!"
        fi
ufw status 2>/dev/null


#grep -i port /etc/ssh/sshd_config |awk -F ' ' '{print $2 ''}' |head -n 1


echo -e "========================================================"
echo -e "=                   Services Status                    ="
echo -e "========================================================"
service apache2 status | grep -qw active &> /dev/null
        if [ $? = 0 ]; then
            echo -e "\e[32m[+]\e[0m Apache2  is running ..."
        else
            echo -e "\e[93m\e[1m[-]\e[0m $USER, Firewall is not running for Unknown_Reason!"
        fi

service pure-ftpd status | grep -qw active &> /dev/null
        if [ $? = 0 ]; then
            echo -e "\e[32m[+]\e[0m Pure-FTPD  is running ..."
        else
            echo -e "\e[93m\e[1m[-]\e[0m $USER, Pure-FTPD is not running for Unknown_Reason!"
        fi

service  ssh status | grep -qw active &> /dev/null
        if [ $? = 0 ]; then
            echo -e "\e[32m[+]\e[0m SSH  is running ..."
        else
            echo -e "\e[93m\e[1m[-]\e[0m $USER, SSH is not running for Unknown_Reason!"
        fi

echo -e "========================================================"
echo -e "=                   Services Port                      ="
echo -e "========================================================"

echo -e "\e[32m[+]\e[0m SSH Port $(grep -i port /etc/ssh/sshd_config |awk -F ' ' '{print $2 ''}' |head -n 1)"


$(grep -i "java -D" /usr/share/armitage/teamserver | awk -F ' ' '{print $13 ''}')

if ! command -v armitage &> /dev/null
then
        echo " "
else
        echo -e "========================================================"
	echo -e "=                   Armitage Information               ="
	echo -e "========================================================"
	echo -e "\e[32m[+]\e[0m IP: $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' |head -n1)"
	echo -e "\e[32m[+]\e[0m Port: $(grep -i "java -D" /usr/share/armitage/teamserver | awk -F ' ' '{print $13 ''}')"
	echo -e "\e[32m[+]\e[0m User: $(grep -i "127.0.0.1 " /usr/share/armitage/teamserver | awk -F ' ' '{print $3 ''}')"
	echo "------"
	echo -e "\e[32m[+]\e[0m To run Armitage TeamServer use following Command"
	echo -e "\e[32m[+][1]\e[0m cd /usr/share/armitage/ "
	echo -e "\e[32m[+][2]\e[0m ./teamserver <Local_IPaddress> <Pasword>"
	echo -e "\e[32m[+][3]\e[0m Now, any one can connect to the team server from any device has a armitage"
	echo "------"
	echo -e "\e[32m[?!]\e[0m You can Armitage Port by edit its value in teamserver file to do that follow these commands" 
	echo -e "\e[32m[+][1]\e[0m nano /usr/share/armitage/teamserver "
	echo -e "\e[32m[+][2]\e[0m Now change last number in Line '85' to the new port number"

fi

echo -e "========================================================"
echo -e "=                   Connecting Details                 ="
echo -e "========================================================"
echo -e "\e[32m[1]\e[0m First open your vpn"
echo -e "\e[32m[2]\e[0m ssh NEWUSERNAME@$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' |head -n1) -p $(grep -i port /etc/ssh/sshd_config |awk -F ' ' '{print $2 ''}' |head -n 1)"
echo -e "\e[32m[3]\e[0m Connect to the armitage from any place with above credentials"



#Tips
echo -e "\e[1m\e[93m[-]\e[0m Try to install all Failed packages Manually"
echo -e "==============================================================="
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "                           Happy RTO                           "
echo -e "                            RTO-MP                             "
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "==============================================================="

