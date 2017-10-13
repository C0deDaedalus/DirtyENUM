# DirtyENUM
## Basic Information Gathering Tool for Linux Platform

**Information Gathering** plays an important role in Pentesting. Information Gathering includes System footprinting for basic Configurations of system, Network Configurations, Users Groups & Permissions, Active Directory, and much more. A look at all this information makes much sense to the Pentesting. Also First phase to Penetration Testing is Information Gathering.

NO matter what skills as a pentester one possesses, If you can’t get enough information from the Machine, It’s Over. It’s like hitting an Arrow in the dark. So, To extract as much information we need to run a dozen of commands. 

## DirtyENUM : How It Works

**DirtyENUM** is a script that **automates the task of Primary Information Gathering on Linux Platform** that can be analyzed later on to find any vulnerabilitties in the system. It provides a wide range of information needed by Pentester to work more efficiently.

## DirtyENUM : What information it extracts

1. Extracts **Kernel Information** & **Linux Version** that can be **useful to find out exploits** related to that version.
2. Extracts **File System Information** that tells the partitions on drive, Mount points, Size, Used & Available portions.
3. Tells about the **Current Logged in User** , It's id, tty session, Login Time, IDLE time, etc.
4. Dumps **/etc/passwd** & **/etc/group** for the Users & Groups Information.
5. Finds out **Root-Owned Files having Write & Execute permissions**
6. Finds out **World Writable Files & Directories**
7. Finds out **Commands current User can run with sudo**
8. Extracts **Network Configurations, Interface & Active listeners**
9. Extracts **Daemon Process running from crontab**
10. Extracts **Root Processes**
11. Enumerates **Installed Packages** & their versions that may be helpful to find out vulnerability in the system.

### Disclaimer

The tool is written as a Summer Training Project for educational purpose only. Don't Use this sweet piece of code for Shitty things. Though Script doesn't contains any commands that can harm the System, Use tool at your own Risk.

### Thank You
Feel Free to point out bugs & Hugs. Suggesstions are Welcomed. `Happy Coding`
