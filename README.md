# Introduction
Registers new VIM commands to browse the file-system with tab-completion and a regular-expression filter.

# Usage example
```
BrowseCommand EditWinExe C:\Windows .*\.exe
```

Once executed you could type `EditWinExe otepa` hit `<TAB>` which would complete to `notepad.exe`.
Hitting `<TAB>` again would suggest other executable alternatives.
The default behavior of hitting `<ENTER>` is to edit the selected file.

# Overriding behavior
What will happen once the user hits `<ENTER>` can be overridden by supplying an optional fourth argument to `BrowseCommand`, e.g.:
```
BrowseCommand BackupExe C:\Windows .*\.exe :!cmd.exe /C copy C:\Windows\<args> C:\Temp\
```
In the example above `BackupExe` will call a windows command line to copy the selected file to the `C:\Temp` directory.

# Installation
## Linux/MacOS
```
git clone https://github.com/hweickert/vim-browse-command.git ~/.vim/pack/external/opt/vim-browse-command
```

In your `~/.vimrc` add the following

```
packadd vim-browse-command
```

## Windows
```
git clone https://github.com/hweickert/vim-browse-command.git %USERPROFILE%/vimfiles/pack/external/opt/vim-browse-command
```

In your `$USERPROFILE/_vimrc` add the following

```
packadd vim-browse-command
```
