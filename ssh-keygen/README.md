# generate-github-keys.bat

## What it does
This file is used to create a Secure Shell (SSH) connection between Virtual Studio Code (VS Code) and GitHub.

## Install
You can copy the contents of the [generate-github-keys.bat](ssh-keygen/generate-github-keys.bat) and paste them into a new Text (.txt) document.  Chamge the file extension from .txt to .bat, then double-click the file to run it.  
You can also right-click the link above, select "Save File As", and select a file location.
It doesn's matter where you save the file.
  
## How to Use
- Double-click the file to run it.
- You will be prompted to enter the following:
  - GitHub User Name
  - SSH File Name
    - Create a meaningful name for you to know which key is which
    - For example, if I use vscode-github-johns-vanilla-php then I know that key allows VS Code to interact with https://github.com/johns-vanilla-php
    - **DO NOT INCLUDE A FILE EXTENSION**
  - GitHub email address - the email address associated with your GitHub account
- The SSH Key will be generated and you will see something like this:

![Example Directory Listing](ssh-keygen/resources/bat-example1.png)
