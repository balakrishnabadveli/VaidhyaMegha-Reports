
# Generation of RDF file 
## Connect to Server

## Chanhe Directory to where aact dump is located
 ~cd aact_dump/~

## Delete the previous zip file and other unzipped files(or elese use unzip with overwrite while unzipping the dump zip file)
	~rm -rf 20220314_clinical_trials.zip~
 	~rm -rf postgres_data.dmp.zip data_dictionary.xlsx nlm_results_definitions.html schema_diagram.png admin_schema_diagram.png nlm_protocol_definitions.html~ 
 
 
## Download the recent dump from https://aact.ctti-clinicaltrials.org/snapshots
 	~wget https://aact.ctti-clinicaltrials.org/static/static_db_copies/daily/20220324_clinical_trials.zip~

## unzip dumpfile
	~unzip 20220324_clinical_trials.zip~
	~unzip -o 20220412_clinical_trials.zip~


## Restore the dump to postgres server:
	~pg_restore --host "host address" --port "port number" --username "user_name" --role "postgres" --dbname "database name"  --schema="schmea name" --no-owner --no-privileges --verbose "postgres_data.dmp"~
	
## Change directory where vaidhyamegha-knowledge-graphs package is located and build the package.
	cd 
	cd /knowledgegraphs/vaidhyamegha-knowledge-graphs/
	java -jar -Xms4096M -Xmx8192M target/vaidhyamegha-knowledge-graphs-v0.9-jar-with-dependencies.jar

## Excute sparql scripts to read graph data 
	java -jar -Xms4096M -Xmx8144M target/vaidhyamegha-knowledge-graphs-v0.9-jar-with-dependencies.jar -m cli -q src/main/sparql/NCT_Query.rq

## Copy the output result to a separate .txt files each SparQL query and move to new folder

## Generate node.csv and edge.csv file by executing txt_to_csv.py file
    python3 txt_to_csv.py -f "path to where output .txt files are present"
    python3 txt_to_csv.py -f "26_04_22"

## Import node.csv and edge.csv files to gephi tool generate visualisation 
