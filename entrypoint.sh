#!/bin/bash

# Start up MariaDB and give time to start up
mysqld_safe &
sleep 10

if [ ! -d "/var/lib/mysql/my_database" ]; then
  echo "No database has been initialised, performing initilisation steps now..."

  mysql -u root <<EOF
  DELETE FROM mysql.user WHERE User = '';   # Removing anonymous users
EOF
  echo "Have removed potential anonymous users"
fi

# To keep the container running
tail -f /dev/null

