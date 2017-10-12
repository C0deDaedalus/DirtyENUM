
#!/usr/bin/env bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin

if [ -t 1 ];
then
  NORMAL="\033[0;39m"
  CYAN="\033[36m"
  BLUE="\033[34m"
  YELLOW="\033[33m"
fi

function info() {
  printf "\n\n"
  printf "$CYAN =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
  printf "\n"
  printf "$YELLOW"
  printf "$CYAN|                            $YELLOW $@                                  $CYAN |"
  printf "\n"
  printf "$CYAN =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
  printf "$NORMAL"
  printf "\n\n"
}

info "Fetching Kernel Information"
uname -ar

info "Fetching Linux Version"
cat /etc/issue;
echo
cat /etc/*-release

info "Printing File System Information"
df -h
echo
mount | column -t
echo
cat /etc/fstab

info "Enumerating Users"
echo id = $(id)
echo on
echo Hostname = $(hostname)

info "Current User Sessions"
w   # Show who is logged on & what are they doing

info "Dumping Users from passwd"
cat /etc/passwd

info "Dumping Groups from group"
cat /etc/group

# if [ $(id -u) == 0 ]
# then
#     info "Dumping Shadow File"
#     cat /etc/shadow
# else
#     :

info "Fetching SUID Files"
find / -perm -g=s -o -perm -4000 ! -type l -exec ls -ld {} \; 2>/dev/null | column -t

info "Finding Root-owned, Writable and Executable Files"
find / -type f -executable -user root -writable -exec ls -ld {} \; 2>/dev/null | column -t

info "Finding Root-owned, Writable Files"
find / -type f -user root -writable -exec ls -ld {} \; 2>/dev/null | column -t

info "World Writable Directories"
find / -perm -222 -type d -exec ls -ld {} \; 2>/dev/null | column -t

info "World Writable Files"
find / -type f -perm 0777 -exec ls -lah {} \; 2>/dev/null | column -t

info "Commands User Can Run with sudo"
test [ echo '' | sudo -S -l ] 2>/dev/null || echo "${USER} has no passwordless sudo commands configured"

info "Fetching Network Information"
cat /etc/network/interfaces || cat /etc/sysconfig/network
echo
cat /etc/resolv.conf
echo
ifconfig -a || ip addr
echo
route || ip route
route -n

info "Getting Active Listening Services"
netstat -tulpn

info "Fetching Automations from CronTab"
ls -lah /etc/cron*
echo
cat /etc/crontab
echo
crontab -l

info "Extracting Processes Running as root"
# Full Format listing all processes running under User "root" & Don't Show processes having thread names
ps -ef | grep root | grep -ve "\]$" 

info "Enumerating Installed Packages"
dpkg --list | cat > pacakages.txt
cat "Look for File packages.txt & Print to Console."
