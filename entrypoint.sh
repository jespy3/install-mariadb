#!/bin/bash

# Start up MariaDB and give time to start up
mysqld_safe &
sleep 10

if [ ! -d "/var/lib/mysql/my_database" ]; then
  echo "No database has been initialised, performing initilisation steps now..."
  echo "Placeholder command"
fi

# To keep the container running
tail -f /dev/null

