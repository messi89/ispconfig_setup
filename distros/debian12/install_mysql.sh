#---------------------------------------------------------------------
# Function: InstallSQLServer
#    Install and configure SQL Server
#---------------------------------------------------------------------
InstallSQLServer() {
    echo -n "Installing Database server (MariaDB)... "
    echo "maria-db-10.1 mysql-server/root_password password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
    echo "maria-db-10.1 mysql-server/root_password_again password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
    apt_install mariadb-client mariadb-server
    sed -i 's/bind-address		= 127.0.0.1/#bind-address		= 127.0.0.1\nsql-mode="NO_ENGINE_SUBSTITUTION"/' /etc/mysql/mariadb.conf.d/50-server.cnf
	sed -i 's/password =/password = '$CFG_MYSQL_ROOT_PWD'/' /etc/mysql/debian.cnf
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$CFG_MYSQL_ROOT_PWD';"
	# Make our changes take effect
	mysql -e "FLUSH PRIVILEGES"
	echo -e "[${green}DONE${NC}]\n"
	echo -n "Restarting MariaDB... "
	systemctl restart mysql
    echo -e "[${green}DONE${NC}]\n"
}
