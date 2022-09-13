# generate-github-keys.bat

## Notes:
This script was designed with the following assumptions:
- You have a GitHub Account
- You are running Windows 10+
- You have Visual Studio Code installed
- You have FireFox installed
- Your computer is up to date

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
  ![Username](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/bc3293cf8cc2c1ec25259e07280bb8146748f525/ssh-keygen/resources/example-1.png)
  - SSH File Name
    - Create a meaningful name for you to know which key is which
    - For example, if I use vscode-github-johns-vanilla-php then I know that key allows VS Code to interact with https://github.com/johns-vanilla-php
    - **DO NOT INCLUDE A FILE EXTENSION**
    ![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-2.png)
  - GitHub email address - the email address associated with your GitHub account
  ![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-3.png)
- The SSH Key will be generated and you will see something like this:
![Copy and Paste the Fingerprint](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-4.png)
- You need to copy the "key fingerprint" (highlighted in this example) and paste it at the prompt.  Just highlight the fingerprint, press ctrl+c, then press ctrl+v.
- The screen will clear, and you will be notified that 2 web pages will open in Firefox (this will be fixed later to allow other browsers).
- One of the browser tabs will allow you to add a new SSH Key to GitHub.
  - Enter a title for your new Key.  This can be anything and is only used on GitHub, but it should be called something that will easily identify this key if you need to delete it later for whatever reason.
  - Key Type should be "Authentication Key"
  - Paste the key by pressing ctrl+v
  - The cursor will likely be on a new line, so hit backspace one time.  You should see something like this:
  ![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-6.png)
  - Click the Add SSH Key button and you should see something like this:
  ![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-7.png)
  - You many now close that browser tab.
- The other browser tab that opened will allow you to generate a Personal Access Token (PAT), and should look something like this:
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-9.png)
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-10.png)
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-11.png)
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-12.png)
- Once you click Generate Token, you should see something like this:
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/4f0fa87933c74cb8c326c04e89f768bd1c3f708f/ssh-keygen/resources/example-14.png)
- Copy the key (underlined in red above) by highlighting it and pressing ctrl+c or by clicking on the icon to the right of it
- Leave this browser window open for now, just in case it isn't copied for some reason.
- Return to this script and you should now see a prompt asking you to paste this token.  Press ctrl+v to paste it.
![](https://github.com/johns-vanilla-php/bat-various-batch-files/blob/18c24e3a47ac9d2981325626ef40d28a59834f30/ssh-keygen/resources/example-16.png)

## Finishing Up
Follow the remaining prompts to complete this script.  This script will automatically edit the following files in your .ssh directory, which is found at C:\Users\your-user-name\.ssh
- config (no file extension)
- filename (no extension)
  - This will be whatever filename you entered in the beginning of the script
  - This is your PRIVATE key - **do NOT share this**
- filename.pub
  - This will be whatever filename you entered in the beginning of the script
  - This is your PUBLIC key
- README.txt
  - This file saves all of the data that was created by this script so that you have a backup of everything related to all of the Keys that you;ve generated with this script.
  - **do NOT share this**
- known_hosts (no file extension)
