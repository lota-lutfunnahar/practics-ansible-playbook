#!/bin/bash
S="************************************"
D="-------------------------------------"
MOUNT=$(mount|egrep -iw "ext4|ext3|xfs|gfs|gfs2|btrfs"|sort -u -t' ' -k1,2)
FS_USAGE=$(df -PTh|egrep -iw "ext4|ext3|xfs|gfs|gfs2|btrfs"|sort -k6n|awk '!seen[$1]++')
IUSAGE=$(df -PThi|egrep -iw "ext4|ext3|xfs|gfs|gfs2|btrfs"|sort -k6n|awk '!seen[$1]++')
#--------Checking the availability of sysstat package..........#
if [ ! -x /usr/bin/mpstat ]
then
printf "\nError : Either \"mpstat\" command not available OR \"sysstat\" package is not properly
installed. Please make sure this package is installed and working properly!, then run this script.\
n\n"
exit 1
fi
echo -e "$S Health Status Report $S"
echo -e "\nOperating System Details"
echo -e "$D"
printf "Hostname :" $(hostname -f > /dev/null 2>&1) && printf " $(hostname -f)" || printf " $
(hostname -s)"
[ -x /usr/bin/lsb_release ] && echo -e "\nOperating System :" $(lsb_release -d|awk -F: '{print
$2}'|sed -e 's/^[ \t]*//') || echo -e "\nOperating System :" $(cat /etc/system-release)
echo -e "Kernel Version :" $(uname -r)
printf "OS Architecture :" $(arch | grep x86_64 2>&1 > /dev/null) && printf " 64 Bit OS\n" ||
printf " 32 Bit OS\n"
#--------Print system uptime-------#
UPTIME=$(uptime)
echo $UPTIME|grep day 2>&1 > /dev/null
if [ $? != 0 ]
then
echo $UPTIME|grep -w min 2>&1 > /dev/null && echo -e "System Uptime : "$(echo $UPTIME|awk '{print
$2" by "$3}'|sed -e 's/,.*//g')" minutes" || echo -e "System Uptime : "$(echo $UPTIME|awk '{print
$2" by "$3" "$4}'|sed -e 's/,.*//g')" hours"
else
echo -e "System Uptime :" $(echo $UPTIME|awk '{print $2" by "$3" "$4" "$5" hours"}'|sed -e 's/,//g')
fi
echo -e "Current System Date & Time : "$(date +%c)
#--------Check for any zombie processes--------#
echo -e "\n\nChecking For Zombie Processes"
echo -e "$D"
ps -eo stat|grep -w Z 1>&2 > /dev/null
if [ $? == 0 ]
then
echo -e "Number of zombie process on the system are :" $(ps -eo stat|grep -w Z|wc -l)
echo -e "\n Details of each zombie processes found
"
echo -e " $D"
ZPROC=$(ps -eo stat,pid|grep -w Z|awk '{print $2}')
for i in $(echo "$ZPROC")
do
ps -o pid,ppid,user,stat,args -p $i
done
else
echo -e "No zombie processes found on the system."
fi
#--------Check for RAM Utilization--------#
MEM_DETAILS=$(cat /proc/meminfo)
echo -e "\n\nChecking Memory Usage Details"
echo -e "$D"
echo -e "Total RAM : "$(echo "$MEM_DETAILS"|grep MemTotal|awk '{print $2/1024/1024}') "GB"
echo -e "Used RAM : "$(free -m|grep -w Mem:|awk '{print $3/1024}') "GB"
echo -e "Free RAM : "$(echo "$MEM_DETAILS"|grep -w MemFree |awk '{print $2/1024/1024}') "GB"

#--------Check for Processor Utilization (current data)--------#
#echo -e "\n\nChecking For Processor Utilization"
echo -e "$D"
#echo -e "Manufacturer: "$(dmidecode -s processor-manufacturer|uniq)
#echo -e "Processor Model: "$(dmidecode -s processor-version|uniq)
#if [ -e /usr/bin/lscpu ]
#then
#{
#echo -e "No. Of Processor(s) :" $(lscpu|grep -w "Socket(s):"|awk -F: '{print $2}')
#echo -e "No. of Core(s) per processor :" $(lscpu|grep -w "Core(s) per socket:"|awk -F: '{print #$2}')
#}
#else
#{
#echo -e "No. Of Processor(s) Found :" $(grep -c processor /proc/cpuinfo)
#echo -e "No. of Core(s) per processor :" $(grep "cpu cores" /proc/cpuinfo|uniq|wc -l)
#}
#fi
echo -e "\nCurrent Processor Utilization Summary :\n"
mpstat|tail -2

