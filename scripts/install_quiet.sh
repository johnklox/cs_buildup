#!/bin/bash
#
IPADDR=$(/sbin/ip addr show eth0 | /bin/grep inet | /usr/bin/head -n1 | /usr/bin/awk '{print $2}' | /usr/bin/cut -d'/' -f1)
echo ""
echo "This is the automatic Cloudstack installation script"
echo "it will install and configure all necessary steps for you"
echo ""
echo "checking scripts:"
echo ""
if [ -e prepare.sh ];then
    echo -en "prepare script: "
    echo -e '\E[32m'"[ OK ]"
    tput sgr0
  else
    echo -n "prepare script: "
    echo -e '\E[31m'"not in place!"
fi
if [ -e cs_inst_quiet.sh ];then
    echo -en "Cloudstack install script: "
    echo -e '\E[32m'"[ OK ]"
    tput sgr0
  else
    echo -en "Cloudstack install script: "
    echo -en '\E[31m'"not in place!"
    tput sgr0
    echo " - you have to install Cloudstack on your own!"
fi
if [ -e check.sh ];then
    echo -en "check script: "
    echo -e '\E[32m'"[ OK ]"
    tput sgr0
  else
    echo -n "check script: "
    echo -en '\E[31m'"not in place!\n"
    tput sgr0
fi
if [ -e ssvm.sh ];then
    echo -en "ssvm script: "
    echo -e '\E[32m'"[ OK ]"
    tput sgr0
  else
    echo -n "ssvm script: "
    echo -en '\E[31m'"not in place!"
    tput sgr0
    echo ""
fi
while true
do
  echo "-------------------------------------"
  echo " Version Menu "
  echo "-------------------------------------"
  echo "[1] 4.4"
  echo "[2] 4.5"
  echo "[3] 4.6"
  echo "[4] 4.7"
  echo "[5] 4.8"
  echo "[6] 4.9"
  echo "======================="
  read -p "Enter your menu choice [1-6]: " VERSION
#  read -p "which version of Cloudstack do you want to install? [4.4/4.5/4.6/4.7/4.8/4.9]: " VERSION
    case $VERSION in 
      [1] ) sed -i 's/CSVERSION/4.4/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.4.1-7/g' cs_inst_quiet.sh 
               sed -i 's/PATHVERSION/4.4/g' cs_inst_quiet.sh 
               break;;
      [2] ) sed -i 's/CSVERSION/4.5/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.5/g' cs_inst_quiet.sh
               sed -i 's/PATHVERSION/4.5/g' cs_inst_quiet.sh 
               break;;
      [3] ) sed -i 's/CSVERSION/4.6/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.6.0/g' cs_inst_quiet.sh 
               sed -i 's/PATHVERSION/4.6/g' cs_inst_quiet.sh 
               break;;
      [4] ) sed -i 's/CSVERSION/4.7/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.6.0/g' cs_inst_quiet.sh 
               sed -i 's/PATHVERSION/4.6/g' cs_inst_quiet.sh 
               break;;
      [5] ) sed -i 's/CSVERSION/4.8/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.6.0/g' cs_inst_quiet.sh 
               sed -i 's/PATHVERSION/4.6/g' cs_inst_quiet.sh 
               break;;
      [6] ) sed -i 's/CSVERSION/4.9/g' prepare.sh 
               sed -i 's/TMPLVERSION/4.6.0/g' cs_inst_quiet.sh 
               sed -i 's/PATHVERSION/4.6/g' cs_inst_quiet.sh 
               break;;
      * )      echo ""
               echo "Please type a version (4.4, 4.5, 4.6, 4.7, 4.8 or 4.9)";;
      esac
done

echo ""
echo "preparing host..."      
source prepare.sh

echo ""
echo "installing Cloudstack..."
source cs_inst_quiet.sh

echo ""
echo "installing Cloudmonkey..."
source cloudmonkey.sh

