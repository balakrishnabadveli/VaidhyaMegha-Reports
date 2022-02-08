#!/bin/bash
# Load database connection info
set -o allexport
source .env
set +o allexport
set -ex
# Read query into a variable
sql="$(<"transform.sql")"

# If psql is not available, then exit
if ! command -v psql > /dev/null; then
  echo "This script requires psql to be installed and on your PATH ..."
  exit 1
fi

# Connect to the database, run the query, then disconnect
psql -t -A -c "${sql}"


# https://zwbetz.com/connect-to-a-postgresql-database-and-run-a-query-from-a-bash-script/#notes