# Introduction
A git aware bash prompt I use. If inside a git repo, it will display git branch 
and git username. It is very helpful if you have multiple github accounts.

# Download and install

* Download the `bash-prompt-v1.0.1.tar.gz` file from @RELEASES@ page
* Inspect the content, install script etc. before installing
* List the content
```bash
➤ tar -tvf bash-prompt-v1.0.1.tar.gz
drwxr-xr-x  0 muquit wheel       0 Feb 19 15:23 bash-prompt-v1.0.1/
-rw-r--r--  0 muquit wheel    2013 Feb 19 15:23 bash-prompt-v1.0.1/bash_prompt.sh
-rwxr-xr-x  0 muquit wheel     676 Feb 19 15:23 bash-prompt-v1.0.1/install.sh
-rw-r--r--  0 muquit wheel     804 Feb 19 15:23 bash-prompt-v1.0.1/README.md
-rw-r--r--  0 muquit wheel       7 Feb 19 15:23 bash-prompt-v1.0.1/VERSION
```

* To install, extract the archive and run the install script. Have a look at
the `install.sh` before running it.
```bash
➤ tar -xvf bash-prompt-v1.0.1.tar.gz
➤ cd bash-prompt-v1.0.1
➤ ./install.sh
```
If `~/.bash_prompt.sh` already exists, you will be asked whether to overwrite it.

# Screenshot
Here is a sample prompt.

@SCREENSHOT@

* The first prompt is not in a git repo, hence there is no git branch or username
* The second prompt is showing **main** is the branch and **muquit** is the username

# Customization
The decoration symbol appears to the left of the `➤` arrow in the prompt in the prompt. The defaults is `★ `.
To use a different character, create `~/.bash_prompt_decor.txt` with your preferred Unicode symbol:
```bash
➤ echo "λ" > ~/.bash_prompt_decor.txt
```

I use unicode symbols  in prompt to easily identify which system I'm 
on. Of course your terminal must support Unicode.

Set it to an empty string to disable it:
```bash
➤ echo "" > ~/.bash_prompt_decor.txt
```
## Unicode symbols
@SYMBOLS@ has listing of various unicode symbols.
# Author
This is not my original work. Most of the prompt script was collected from 
the Internet many years ago, with small updates here and there. The one 
addition of my own is the `parse_git_user()` function, written while working 
on @MULTIPLE@.
