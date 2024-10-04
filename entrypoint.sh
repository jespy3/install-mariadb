#!/bin/bash

# Start up MariaDB and give time to start up
mysqld_safe &
sleep 10

if [ ! -d "/var/lib/mysql/my_database" ]; then
  echo "No database has been initialised, performing initilisation steps now..."

  mysql -u root <<EOF
  DELETE FROM mysql.user WHERE User = '';   # Removing anonymous users
  DROP DATABASE IF EXISTS test;   # Removing any 'test'-named DBs
  DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';   # Remove root users with remote access
  FLUSH PRIVILEGES;
EOF

  mysql -u root <<EOF
  CREATE DATABASE my_database;
  CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
EOF

  echo "Successfully created a database and user."
fi

# To keep the container running
tail -f /dev/null

