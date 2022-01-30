# knowledge_graphs

Command to take backup of only schema :

pg_dump --file file_mane --host "host_address" --port "port_number" --username "user_name" --verbose --role "postgres" --format=c --blobs --schema "schema_name" "database_name"

Command to restore backup of only schema :
 pg_restore --host "host_address" --port "port_number" --username "user_name" --role "postgres" --dbname "data_base_name" --no-owner --no-privileges --verbose "backup_file_location"
