#!/bin/bash

# Start up MariaDB and give time to start up
mysqld_safe &
sleep 10

# To keep the container running
tail -f /dev/null

