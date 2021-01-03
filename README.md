# MacOS Open from SSH
Quick Action to open a folder from a remote volume in the terminal via SSH

# Use Case
Let's say you're looking at a network folder and want to SSH into your server and run some commands.

## The Old Way
You'd have to open a terminal, `ssh` into your server and and `cd` to your directory on the server.

## With this tool
Just right click on the folder and press "Open from SSH". The tool automatically gets the path, logs into your server and `cd`'s into the directory.

# Installation
Download the latest release from the [releases](https://github.com/menahishayan/MacOS-Open-from-SSH/releases) page. Double click and macOS should prompt you to install it. Thats it.

**Note:** Your mac and server should be [configured for passwordless SSH](https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/) for this to work.

# Changelog
## v1.0
 - Initial commit
