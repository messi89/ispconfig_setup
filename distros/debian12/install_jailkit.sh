#---------------------------------------------------------------------
# Function: InstallJailkit
#    Install Jailkit
#---------------------------------------------------------------------


InstallJailkit() {
  echo -n "Installing Jailkit... "
  apt_install jailkit
  echo -e "[${green}DONE${NC}]\n"
}

