dotfiles
========
My own dotfiles. I use Windows 10 LTSC Version 1809 + 
Linux DESKTOP-8SLRH7L 4.4.0-17763-Microsoft #1432-Microsoft Mon Aug 18 18:18:00 PST 2020 x86_64 GNU/Linux

### What's in here
* vim
* zsh

### Changelog (as of last push)
* After 4 years I've updated this repo. I have switched to Windows + WSL permanently in 2020
* keeping things simple this time
* https://github.com/yuk7/ArchWSL/

### Setting up WSL inside ConEmu / Cmder
* https://conemu.github.io/en/BashOnWindows.html#connector
Task parameters: `/icon "%USERPROFILE%\AppData\Local\lxss\bash.ico"`
Task commands:
```
# buggy windows commands (notepad.exe, ssh.exe, git.exe):
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & wslbridge.exe -C ~

# so far so good..?
wsl.exe ~ -cur_console:p5m:/mnt:d:"/root"
```

### Problems and solutions
#### Slow zsh inside git proj?
```
git config --add oh-my-zsh.hide-dirty 1
```

#### wsl.conf automount fstab changes
https://gist.github.com/sgtoj/f82990bcd9e89db49b84e2d2e70b281d
Mount dirs directly in root as opposed to /mnt...:

```
diego@diego-thinkpad:~$ cat /etc/wsl.conf
# Enable extra metadata options by default
[automount]
enabled = true
root = /
options = "metadata,umask=22,fmask=11"
mountFsTab = false

# Enable DNS – even though these are turned on by default, we’ll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true

diego@diego-thinkpad:~$ mount -l | grep drvfs
C: on /c type drvfs (rw,noatime,uid=1000,gid=1000,umask=22,fmask=11,metadata)
diego@diego-thinkpad:~$


# Had the same problem. It gone when changed root property in automount section to /mnt/ (from just /).
```
