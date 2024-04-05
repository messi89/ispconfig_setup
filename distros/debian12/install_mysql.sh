#---------------------------------------------------------------------
# Function: InstallSQLServer
#    Install and configure SQL Server
#---------------------------------------------------------------------
InstallSQLServer() {
    echo -n "Installing Database server (MariaDB)... "
    apt_install mariadb-client mariadb-server
    sed -i 's/bind-address		= 127.0.0.1/#bind-address		= 127.0.0.1\nsql-mode="NO_ENGINE_SUBSTITUTION"/' /etc/mysql/mariadb.conf.d/50-server.cnf

	echo -e "[${green}DONE${NC}]\n"
	echo -n "Restarting MariaDB... "
	systemctl restart mysql
    echo -e "[${green}DONE${NC}]\n"
}
