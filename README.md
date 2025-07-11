# Linux Monitoring v1.0

Linux basic bash scripting and system research.

1. [Chapter I](#chapter-i) \
    1.1. [Bash](#bash) \
    1.2. [Shell](#shell)
2. [Chapter II](#chapter-ii) \
    2.1. [First effort](#part-1-first-effort)  
    2.2. [System research](#part-2-system-research)  
    2.3. [Visual output design for the system research script](#part-3-visual-output-design-for-the-system-research-script)   
    2.4. [Configuring visual output design for the system research script.](#part-4-configuring-visual-output-design-for-the-system-research-script)  
    2.5. [File system research](#part-5-file-system-research)    


## Chapter I

### Bash

>Bash is the shell, or command language interpreter, for the GNU operating system.
>
>The name is an acronym for "Bourne-Again SHell", a pun on Stephen Bourne, the author of the direct ancestor of the current Unix shell, sh, which appeared in the Seventh Edition Bell Labs Research version of Unix.
>
>Bash is largely compatible with sh and incorporates useful features from the Korn shell ksh and the C shell csh. It is intended to be a compliant implementation of the IEEE POSIX Shell and Tools portion of the IEEE POSIX specification (IEEE Standard 1003.1). It provides functional improvements over sh for both interactive and programming use.
>
>While the GNU operating system provides other shells, including a version of csh, Bash is the default shell. Like other GNU software, Bash is quite portable. It currently runs on almost every version of Unix and a few other operating systems - independently supported ports exist for MS-DOS, OS/2 and Windows platforms.

### Shell

>At its base, a shell is simply a macro processor that executes commands.
>
>A Unix shell is both a command interpreter and a programming language. As a command interpreter, the shell provides the user interface to the rich set of GNU utilities. Files containing commands can be created, and become commands themselves. These new commands have the same status as system commands, allowing users or groups to establish custom environments to automate their common tasks.
>
>Shells may be used interactively or non-interactively. In interactive mode, they accept input typed from the keyboard. When executing non-interactively, shells execute commands read from a file.
>
>A shell allows GNU commands to be executed both synchronously and asynchronously.
>
>While command execution is essential, most of the power (and complexity) of shells comes from the programming languages they contain. Like any high-level language, the shell provides variables, flow control constructs, quoting, and functions.
>
>Shells provide features specifically designed for interactive use, rather than to extend the programming language. These interactive features include job control, command line editing, command history and aliases.

In Mike's drawer, there was a folder labelled "Materials" under the article clippings. When you looked in it, you found several sheets describing the features of bash scripts.

## Chapter II

- The written bash scripts must be in the src folder;
- For each task you must create a folder with the following name: **0x**, where x is the task number;
- All scripts must be decomposed and split into several files;
- The main script file for each task must be named **main.sh**;
- All scripts should have checks for incorrect input (not all parameters specified, wrong format parameters, etc.);
- All scripts must be run on a virtual machine *Ubuntu Server 20.04 LTS*.

## Part 1. First effort

**== Task ==**

Write a bash script. The script is run with one parameter. It is a text parameter.  
The script outputs the value of the parameter.  
If the parameter is a number, the script must output an invalid input message.

## Part 2. System research

**== Task ==**

Write a bash script. The script should output the following information:

**HOSTNAME** = _network name_  
**TIMEZONE** = _time zone as: **America/New_York UTC -5** (time zone must be taken from the system and be correct for the current location)_  
**USER** = _current user who ran the script_  
**OS** = _type and version of operating system_  
**DATE** = _current time as: **12 May 2020 12:24:36**_  
**UPTIME** = _system uptime_  
**UPTIME_SEC** = _system uptime in seconds_  
**IP** = _ip address of the machine on any of the network interfaces  
**MASK** = _network mask of any of the network interfaces as: **xxx.xxx.xxx.xxx**_.  
**GATEWAY** = _default gateway ip_  
**RAM_TOTAL** = _main memory size in GB with an accuracy of three decimal places as: **3.125 GB**_  
**RAM_USED** = _used memory size in GB with an accuracy of three decimal places_  
**RAM_FREE** = _free memory size in GB, with an accuracy of three decimal places_  
**SPACE_ROOT** = _root partition size in MB, with an accuracy of two decimal places, as **254.25 MB**_  
**SPACE_ROOT_USED** = _size of used space of the root partition in MB, with an accuracy of two decimal places_  
**SPACE_ROOT_FREE** = _size of free space of the root partition in MB, with an accuracy of two decimal places_

After outputting the values, suggest writing the data to a file (ask the user to answer **Y/N**).  
Responses **Y** and **y** are considered positive, all others - negative.

If the user agrees, create a file in the current directory containing the information that had been outputted.
The file name must looks like: **DD_MM_YY_HH_MM_SS.status** (The time in the file name must indicate when the data was saved).

## Part 3. Visual output design for the system research script

**== Task ==**

Write a bash script. Use the script from [**Part 2**](#part-2-system-research) and remove the part where the data is saved to a file.  The script is run with 4 parameters. The parameters are numeric. From 1 to 6, for example:  
`script03.sh 1 3 4 5`

Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)

**Parameter 1** is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 2** is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 3** is the background of the values (after the '=' sign)  
**Parameter 4** is the font colour of the values (after the '=' sign)

The font and background colours of one column must not match.  
If matching values are entered, there must be a message describing the problem and offering to call the script again.
After the message output, the program should exit correctly.

## Part 4. Configuring visual output design for the system research script

**== Task ==**

Write a bash script. Use the script from [**Part 3**](#part-3-visual-output-design-for-the-system-research-script). The colour designations are similar. The script runs without parameters. The parameters are set in the configuration file before the script is running.

This is how the configuration file must look like:
```
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1
```

If one or more parameters are not set in the configuration file, the colour must be substituted from the default colour scheme. (Choice is at the developer's discretion).


After the system information output from [**Part 3**](#part-3-visual-output-design-for-the-system-research-script), you should output the colour scheme by indenting one empty line as follows:
```
Column 1 background = 2 (red)
Column 1 font color = 4 (blue)
Column 2 background = 5 (purple)
Column 2 font color = 1 (white)
```

When running the script with the default colour scheme, the output should look like this:
```
Column 1 background = default (black)
Column 1 font color = default (white)
Column 2 background = default (red)
Column 2 font color = default (blue)
```

## Part 5. File system research

**== Task ==**

Write a bash script. The script is run with a single parameter.  
The parameter is an absolute or relative path to a directory. The parameter must end with '/', for example:  
`script05.sh /var/log/`

The script must output the following information about the directory specified in the parameter:
- Total number of folders, including subfolders
- Top 5 folders with largest size in descending order (path and size)
- Total number of files
- Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links
- Top 10 files with largest size in descending order (path, size and type)
- Top 10 executable files with largest size in descending order (path, size and hash)
- Execution time of the script

The script should output the following information:

```
Total number of folders (including all nested ones) = 6  
TOP 5 folders of maximum size arranged in descending order (path and size):  
1 - /var/log/one/, 100 GB  
2 - /var/log/two/, 100 MB  
etc up to 5
Total number of files = 30
Number of:  
Configuration files (with the .conf extension) = 1 
Text files = 10  
Executable files = 5
Log files (with the extension .log) = 2  
Archive files = 3  
Symbolic links = 4  
TOP 10 files of maximum size arranged in descending order (path, size and type):  
1 - /var/log/one/one.exe, 10 GB, exe  
2 - /var/log/two/two.log, 10 MB, log  
etc up to 10  
TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):  
1 - /var/log/one/one.exe, 10 GB, 3abb17b66815bc7946cefe727737d295  
2 - /var/log/two/two.exe, 9 MB, 53c8fdfcbb60cf8e1a1ee90601cc8fe2  
etc up to 10  
Script execution time (in seconds) = 1.5
```