#---------------------------------------------------------------------
# Function: InstallJailkit
#    Install Jailkit
#---------------------------------------------------------------------


InstallJailkit() {
  echo -n "Installing Jailkit... "
  apt-get install jailkit

  echo -e "[${green}DONE${NC}]\n"
}

