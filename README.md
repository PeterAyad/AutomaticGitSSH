# AutomaticGitSSH
A script that automatically prepares your terminal for using github ssh.
## How to use:
1. Install git bash or wsl if you're using windows
2. Open the terminal
3. if you're on linux run 
  ```bash
  sed -i -e 's/\r$//' gitAuth.sh
  ```
4. run the script (if on windows, drag and drop the script to git bash)
5. Enter the required data and copy the generated key
6. Add the key to github.com > settings > SSH and GPG keys > New SSH Key
7. Enjoy!
