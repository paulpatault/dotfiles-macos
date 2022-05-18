######### PROTECTION #########

# https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

# Press and hold the power button on your Mac until “Loading startup options” appears.
# Click Options, then click Continue, then utilities, then terminal, then run :
csrutil disable --with kext --with dtrace --with basesystem
# and reboot

# Open a terminal and run the below command
sudo nvram boot-args=-arm64e_preview_abi
# then reboot

# You can verify that System Integrity Protection is turned off by running `csrutil status`
# which returns System Integrity Protection status: disabled. if it is turned off (it may show unknown for newer versions of macOS when disabling SIP partially).

######### INSTALLATION #########

# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
brew install koekeishiya/formulae/yabai

# install the scripting addition
sudo yabai --install-sa

# if macOS Big Sur or Monterey, load the scripting addition manually; follow instructions below to automate on startup
sudo yabai --load-sa

# start yabai
brew services start yabai

# create a new file for writing - visudo uses the vim editor by default.
# go read about this if you have no idea what is going on.
sudo visudo -f /private/etc/sudoers.d/yabai

# input the line below into the file you are editing.
# replace <user> with your username (output of: whoami). 
# change the path to the yabai binary if necessary  (output of: which yabai)
paulpatault ALL = (root) NOPASSWD: /opt/homebrew/bin/yabai --load-sa

######### UPDATES #########

# stop, and upgrade yabai
brew services stop yabai
brew upgrade yabai

# uninstall the scripting addition
sudo yabai --uninstall-sa

# installing the scripting addition will restart Dock.app
sudo yabai --install-sa

# finally, start yabai
brew services start yabai
