-- create a new schema: ictrp

-- creata a new table for full export: ictrp_full_export (Only full export)

CREATE TABLE ictrp.ictrp_full_export (
TrialID character varying,
"(No column name)" character varying,
SecondaryIDs character varying,
public_title character varying,
Scientific_title character varying,
url character varying,
Public_Contact_Firstname character varying,
Public_Contact_Lastname character varying,
Public_Contact_Address character varying,
Public_Contact_Email character varying,
Public_Contact_Tel character varying,
Public_Contact_Affiliation character varying,
Scientific_Contact_Firstname character varying,
Scientific_Contact_Lastname character varying,
Scientific_Contact_Address character varying,
Scientific_Contact_Email character varying,
Scientific_Contact_Tel character varying,
Scientific_Contact_Affiliation character varying,
study_type character varying,
study_design character varying,
phase character varying,
Date_registration character varying,
Date_enrollement character varying,
Target_size character varying,
Recruitment_status character varying,
Primary_sponsor character varying,
Secondary_sponsors character varying,
Source_Support character varying,
Countries character varying,
Conditions character varying,
Interventions character varying,
Age_min character varying,
Age_max character varying,
Gender character varying,
Inclusion_Criteria character varying,
Exclusion_Criteria character varying,
Primary_Outcome character varying,
Secondary_Outcomes character varying,
Bridging_flag character varying,
Bridged_type character varying,
Childs character varying,
type_enrolment character varying,
Retrospective_flag character varying,
results_actual_enrollment character varying,
results_url_link character varying,
results_summary character varying,
results_date_posted character varying,
results_date_first_publication character varying,
results_baseline_char character varying,
results_participant_flow character varying,
results_adverse_events character varying,
results_outcome_measures character varying,
results_url_protocol character varying,
results_IPD_plan character varying,
results_IPD_description character varying,
results_date_completed character varying,
results_yes_no character varying,
Ethics_Status character varying,
Ethics_Approval_Date character varying,
Ethics_Contact_Name character varying,
Ethics_Contact_Address character varying,
Ethics_Contact_Phone character varying,
Ethics_Contact_Email character varying
);

-- create another table for weekly data: ictrp_weekly_data (includes only weekly data)

CREATE TABLE ictrp.ictrp_weekly_data (
TrialID character varying,
"(No column name)" character varying,
SecondaryIDs character varying,
public_title character varying,
Scientific_title character varying,
url character varying,
Public_Contact_Firstname character varying,
Public_Contact_Lastname character varying,
Public_Contact_Address character varying,
Public_Contact_Email character varying,
Public_Contact_Tel character varying,
Public_Contact_Affiliation character varying,
Scientific_Contact_Firstname character varying,
Scientific_Contact_Lastname character varying,
Scientific_Contact_Address character varying,
Scientific_Contact_Email character varying,
Scientific_Contact_Tel character varying,
Scientific_Contact_Affiliation character varying,
study_type character varying,
study_design character varying,
phase character varying,
Date_registration character varying,
Date_enrollement character varying,
Target_size character varying,
Recruitment_status character varying,
Primary_sponsor character varying,
Secondary_sponsors character varying,
Source_Support character varying,
Countries character varying,
Conditions character varying,
Interventions character varying,
Age_min character varying,
Age_max character varying,
Gender character varying,
Inclusion_Criteria character varying,
Exclusion_Criteria character varying,
Primary_Outcome character varying,
Secondary_Outcomes character varying,
Bridging_flag character varying,
Bridged_type character varying,
Childs character varying,
type_enrolment character varying,
Retrospective_flag character varying,
results_actual_enrollment character varying,
results_url_link character varying,
results_summary character varying,
results_date_posted character varying,
results_date_first_publication character varying,
results_baseline_char character varying,
results_participant_flow character varying,
results_adverse_events character varying,
results_outcome_measures character varying,
results_url_protocol character varying,
results_IPD_plan character varying,
results_IPD_description character varying,
results_date_completed character varying,
results_yes_no character varying,
Ethics_Status character varying,
Ethics_Approval_Date character varying,
Ethics_Contact_Name character varying,
Ethics_Contact_Address character varying,
Ethics_Contact_Phone character varying,
Ethics_Contact_Email character varying
);

-- create another table for weekly data: ictrp_full_weekly_data (includes weekly data + full export)

CREATE TABLE ictrp.ictrp_full_weekly_data (
TrialID character varying,
"(No column name)" character varying,
SecondaryIDs character varying,
public_title character varying,
Scientific_title character varying,
url character varying,
Public_Contact_Firstname character varying,
Public_Contact_Lastname character varying,
Public_Contact_Address character varying,
Public_Contact_Email character varying,
Public_Contact_Tel character varying,
Public_Contact_Affiliation character varying,
Scientific_Contact_Firstname character varying,
Scientific_Contact_Lastname character varying,
Scientific_Contact_Address character varying,
Scientific_Contact_Email character varying,
Scientific_Contact_Tel character varying,
Scientific_Contact_Affiliation character varying,
study_type character varying,
study_design character varying,
phase character varying,
Date_registration character varying,
Date_enrollement character varying,
Target_size character varying,
Recruitment_status character varying,
Primary_sponsor character varying,
Secondary_sponsors character varying,
Source_Support character varying,
Countries character varying,
Conditions character varying,
Interventions character varying,
Age_min character varying,
Age_max character varying,
Gender character varying,
Inclusion_Criteria character varying,
Exclusion_Criteria character varying,
Primary_Outcome character varying,
Secondary_Outcomes character varying,
Bridging_flag character varying,
Bridged_type character varying,
Childs character varying,
type_enrolment character varying,
Retrospective_flag character varying,
results_actual_enrollment character varying,
results_url_link character varying,
results_summary character varying,
results_date_posted character varying,
results_date_first_publication character varying,
results_baseline_char character varying,
results_participant_flow character varying,
results_adverse_events character varying,
results_outcome_measures character varying,
results_url_protocol character varying,
results_IPD_plan character varying,
results_IPD_description character varying,
results_date_completed character varying,
results_yes_no character varying,
Ethics_Status character varying,
Ethics_Approval_Date character varying,
Ethics_Contact_Name character varying,
Ethics_Contact_Address character varying,
Ethics_Contact_Phone character varying,
Ethics_Contact_Email character varying
);


-- Table gives results as no records
select * from ictrp.ictrp_weekly_data
select * from ictrp.ictrp_full_weekly_data
select * from ictrp.ictrp_full_export

-- Import the data from the downloaded csv files.

-- first importing the all the weekly data

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek1February2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17119 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek1March2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 23210 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek1November2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 45572 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek2August2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18308 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek3May2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18398 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek04October2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 45103 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek06September2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 21756 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek7July2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 16761 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek7June2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 68355 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek8February2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18317 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek8March2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 19507 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek9August2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18323 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek10May2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 19318 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek11January2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 47421 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek11October2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 20472 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek12April2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 24878 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek12July2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 34117 records
 
COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek13September2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17297 records 

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek14June2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18339 records 

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek15February2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 19336 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek15March2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18619 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek16August2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17317 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek17May2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 23989 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek18January2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17862 records
 
COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek18October2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 19107 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek19April2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 48130 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek19July2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18061 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek20September2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18559 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek21June2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 45461 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek22February2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 42772 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek22March2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 44420 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek23August2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18601 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek24May2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 39381 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek25January2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 70312 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek25October2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17620 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek26April2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 19956 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek26July2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 16972 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek27September2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 17941 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek28June2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 18424 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek29March2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 20118 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek30August2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 41173 records 

--- End of inserting data into weekly data (ictrp_weekly_data)

select * from ictrp.ictrp_weekly_data; -- 1126702 records

--- insert the ictrp_weekly_data into ictrp_full_weekly_data

INSERT INTO ictrp.ictrp_full_weekly_data
SELECT TrialID ,
"(No column name)" ,
SecondaryIDs ,
public_title ,
Scientific_title ,
url ,
Public_Contact_Firstname ,
Public_Contact_Lastname ,
Public_Contact_Address ,
Public_Contact_Email ,
Public_Contact_Tel ,
Public_Contact_Affiliation ,
Scientific_Contact_Firstname ,
Scientific_Contact_Lastname ,
Scientific_Contact_Address ,
Scientific_Contact_Email ,
Scientific_Contact_Tel ,
Scientific_Contact_Affiliation ,
study_type ,
study_design ,
phase ,
Date_registration ,
Date_enrollement ,
Target_size ,
Recruitment_status ,
Primary_sponsor ,
Secondary_sponsors ,
Source_Support ,
Countries ,
Conditions ,
Interventions ,
Age_min ,
Age_max ,
Gender ,
Inclusion_Criteria ,
Exclusion_Criteria ,
Primary_Outcome ,
Secondary_Outcomes ,
Bridging_flag ,
Bridged_type ,
Childs ,
type_enrolment ,
Retrospective_flag ,
results_actual_enrollment ,
results_url_link ,
results_summary ,
results_date_posted ,
results_date_first_publication ,
results_baseline_char ,
results_participant_flow ,
results_adverse_events ,
results_outcome_measures ,
results_url_protocol ,
results_IPD_plan ,
results_IPD_description ,
results_date_completed ,
results_yes_no ,
Ethics_Status ,
Ethics_Approval_Date ,
Ethics_Contact_Name ,
Ethics_Contact_Address ,
Ethics_Contact_Phone ,
Ethics_Contact_Email FROM ictrp.ictrp_weekly_data; 

-- only weekly_data has bee imported into full_weekly_data
select * from ictrp.ictrp_full_weekly_data; --1126702 records

-- now import the data of full export

COPY ictrp."ictrp_full_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\ictrp_full_data.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 647818 records

select * from ictrp.ictrp_full_weekly_data; -- 1774520 records

-- import the full export: ictrp_full_export 

COPY ictrp."ictrp_full_export" FROM 'C:\Users\vamsi\Desktop\ICTRP\ictrp_full_data.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 647818 records

--importing the extra csv file date on:ICTRPWeek8November2021 into two tables: ictrp_full_weekly_data, ictrp_weekly_data

COPY ictrp."ictrp_full_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek8November2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 20897 records

COPY ictrp."ictrp_weekly_data" FROM 'C:\Users\vamsi\Desktop\ICTRP\weekly data extracted\ICTRPWeek8November2021.csv'
DELIMITER ',' CSV QUOTE AS '"' HEADER; -- 20897 records

-- checking the total no of rows in all the tables

-- ictrp.ictrp_full_export : count - 647818 records
-- ictrp.ictrp_full_weekly_data : count - 1795417 records
-- ictrp.ictrp_weekly_data : count - 1147599 records

-- now we will work on the ictrp.ictrp_full_weekly_data

-- Details of analysis or queries ran for the analysis

select * from ictrp.ictrp_full_weekly_data limit 50; --lots of duplicates need to remove some records.

select count(distinct (trialid))  from ictrp.ictrp_full_weekly_data; -- 733026 records

select trialid,count(*)  from ictrp.ictrp_full_weekly_data
group by trialid  having count(*) > 1 order by 2 desc; -- 43 is highest 

select count(*) from ictrp.ictrp_full_weekly_data 
where  trialid  in ('NTR1315','NTR2804','NTR986','NTR5983','NTR4826','NTR3117'); -- 258

select count(*) from ictrp.ictrp_full_export
where  trialid  in ('NTR1315','NTR2804','NTR986','NTR5983','NTR4826','NTR3117'); -- 6

select distinct "(No column name)" from ictrp.ictrp_full_weekly_data ; -- 495 records

select  count(*) from (
select  trialid from ictrp.ictrp_full_export except 
select  trialid from ictrp.ictrp_full_weekly_data ) a  ;  -- 0 

-- Get list of column name

SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'ictrp_full_weekly_data' and table_schema = 'ictrp'
and column_name like '%date%' ; -- result_date_posted, results_date_first_publication, results_date, date registration,..

-- Deduplication of Source Data
-- as mentioned above ictrp_full_weekly_data have lot of duplicates, so it need to be clean all the 
-- unnecessary data

-- commands to find the duplicates in the dataset
select trialid, ctid from ictrp.ictrp_full_weekly_data; -- NCT04549597(0.1)

select trialid, max(ctid) as max_ctid from ictrp.ictrp_full_weekly_data 
group by trialid; -- ACTRN12605000001695 (401611,2) 733026 records (these count of unique records)

-- command to delete the duplicates in 1795417 records
delete from ictrp.ictrp_full_weekly_data i
using
(select trialid, max(ctid) as max_ctid from ictrp.ictrp_full_weekly_data group by trialid) t
where i.ctid <> t.max_ctid
and i.trialid = t.trialid; -- 1062391 records are deleted 

select trialid, count(*) from ictrp.ictrp_full_weekly_data
group by trialid; --733026 records are there in a table at present

-- create a mst_source_register master table using below script

CREATE TABLE ictrp.mst_source_register ( 
source_register_cd varchar(50) NOT NULL,
	source_register_name varchar(100) NOT NULL,
	source_register_url_pattern varchar(100) NULL,
	iso_3_country_cd varchar(50) NULL,
	remarks varchar(200) NULL,
	created_dtm date NOT NULL DEFAULT CURRENT_DATE,
	country_name varchar(100) NULL,
	CONSTRAINT mst_source_register_pk PRIMARY KEY (source_register_cd) ); -- table created
	

--- populate the data manually by using insert commands

INSERT INTO ictrp.mst_source_register (source_register_cd,source_register_name,source_register_url_pattern,iso_3_country_cd,remarks,created_dtm,country_name) VALUES
	 ('SLCTR','Sri Lanka Clinical Trials Registry','slctr.lk','LKA',NULL,'2021-08-28','Sri Lanka'),
	 ('CTRI','Clinical Trials Registry - India','ctri.nic.in','IND',NULL,'2021-08-28','India'),
	 ('RPCEC','Cuban Public Registry of Clinical Trials','ins.gob.pe','CUB',NULL,'2021-08-28','Cuba'),
	 ('IRCT','Iranian Registry of Clinical Trials','en.irct.ir','IRN',NULL,'2021-08-28','Iran'),
	 ('TCTR','Thai Clinical Trials Register',NULL,'THA',NULL,'2021-08-28','Thailand'),
	 ('NTR','Netherlands National Trial Register','trialregister.nl','NLD',NULL,'2021-08-28','Netherlands'),
	 ('DRKS','German Clinical Trials Register','drks.de','DEU',NULL,'2021-08-28','Germany'),
	 ('CRIS','Clinical Research Information Service Republic of Korea',NULL,'KOR',NULL,'2021-08-28','South Korea'),
	 ('NCT','The United States','ClinicalTrials.gov','USA',NULL,'2021-08-28','United States'),
	 ('LBCTR','Lebanese Clinical Trials Registry',NULL,'LBN',NULL,'2021-08-28','Lebanon'); -- 10 records 
	 
INSERT INTO ictrp.mst_source_register (source_register_cd,source_register_name,source_register_url_pattern,iso_3_country_cd,remarks,created_dtm,country_name) VALUES
	 ('ISRCTN','The United Kingdoms registry',NULL,'GBR',NULL,'2021-08-28','United Kingdom'),
	 ('JPRN','Japan Primary Registries Network',NULL,'JPN',NULL,'2021-08-28','Japan'),
	 ('REPEC','Peruvian Clinical Trials Registry',NULL,'PER',NULL,'2021-08-28','Peru'),
	 ('ChiCTR','Chinese Clinical Trial Register',NULL,'CHN',NULL,'2021-08-28','China'),
	 ('REBEC','Brazilian Clinical Trials Registry',NULL,'BRA',NULL,'2021-08-28','Brazil'),
	 ('PACTR','Pan African Clinical Trial Registry',NULL,'ZAF','Registered address in South Africa','2021-08-28','South Africa'),
	 ('EUCTR','EU Clinical Trials Register',NULL,'BEL','Registered Office in NLD, for Map representation kept BEL','2021-08-28','Netherlands'),
	 ('ACTRN','Australian New Zealand Clinical Trials Registry',NULL,'AUS',NULL,'2021-08-28','Australia'); -- 8 records
	 
-- see the data in the table

select * from ictrp.mst_source_register; -- 18 records

--- create a new schema here name: ictrp_rpt
-- schema created manually

-- now create a new table in this schema to perform data transformation operations (data should be the 
-- same as ictrp.ictrp_full_weekly_data)

CREATE TABLE ictrp_rpt.ictrp_full_data AS
SELECT * FROM ictrp.ictrp_full_weekly_data; -- query executed with 733026 records 

select trialid, count(*) from ictrp_rpt.ictrp_full_data
group by trialid; -- 733026 records are there in new table 


-- From here we will work on the newly created table just for the no loss of data

-- Data Transformation in Postgres ---

-- remove the "" from key columns , need to include all columns once the data loaded and duplicates r removed. 		

update ictrp_rpt.ictrp_full_data 
set study_type = trim(both '" "' from study_type) ,
 phase = trim(both '" "' from phase) , 
  date_registration = trim(both '" "' from date_registration) , 
   date_enrollement = trim(both '" "' from date_enrollement) , 
	 recruitment_status = trim(both '" "' from recruitment_status) , 
	  primary_sponsor = trim(both '" "' from primary_sponsor) , 
  	  countries = trim(both '" "' from countries) , 
 	  age_min = trim(both '" "' from age_min) , 
 	  age_max = trim(both '" "' from age_max) , 
 	  secondaryids = trim(both '" "' from secondaryids)
 	,exclusion_criteria = trim(both '" "' from exclusion_criteria)
	,primary_outcome  = trim(both '" "' from primary_outcome)
	,inclusion_criteria = trim(both '" "' from inclusion_criteria)
	,gender = trim(both '" "' from gender)
	,conditions = trim(both '" "' from conditions)
	,url = trim(both '" "' from url)
	,public_title = trim(both '" "' from public_title)
	,scientific_title = trim(both '" "' from scientific_title)
	,study_design = trim(both '" "' from study_design)
	,target_size = trim(both '" "' from target_size); -- 733026 records updated
	
select * from ictrp_rpt.ictrp_full_data limit 50;

-- # conditions cleanup.
-- we can see ; in columns like NCT04855305, NCT04823975, NCT03801148, NCT01666535, DRKS00022521
-- we can see <br> in columns like NCT02841722, NCT02366689, NCT03059108, NCT03153956

update ictrp_rpt.ictrp_full_data set conditions  = trim(leading ';' from conditions) ; -- 733026 records
update ictrp_rpt.ictrp_full_data set conditions  = trim(both '<br>' from conditions) ; -- 733026 records

-- add new column here "conditions_std"

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD conditions_std character varying;

update ictrp_rpt.ictrp_full_data set conditions_std  = 'B972- Coronavirus' 
where  conditions  ilike 'Health Condition 1: B972- Coronavirus as the cause of diseases classified elsewhere%'; -- 990 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Advanced Solid Tumors' 
where  conditions  ilike 'Advanced Solid Tumo%'; -- 958 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'O- Medical and Surgical' 
where  conditions  ilike 'Health Condition 1: O- Medical and Surgical%'; -- 1045 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Atrial Fibrillation' 
where  conditions  ilike 'Atrial Fibrillation%'; -- 2444 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Breast Cancer' 
where  conditions  ilike 'Breast cance%'; -- 7439 upated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Cervical Cancer' 
where  conditions  ilike 'Cervical cance%'; -- 1012 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Colorectal Cancer' 
where  conditions  ilike 'colorectal cance%'; -- 3132 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Covid-19' 
where  conditions  ilike '%Covid%19%' or conditions='COVID'; -- 7104 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Diabetes Mellitus' 
where  conditions  ilike 'Diabetes Mellitus%'; -- 5475 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Gastric Cancer' 
where  conditions  ilike 'Gastric cance%'; -- 1700 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Hepatocellular Carcinoma' 
where  conditions  ilike 'Hepatocellular Carcinoma%'; -- 1898 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Knee Osteoarthritis' 
where  conditions  ilike 'Knee Osteoarthritis%'; -- 1525 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Lung Cancer' 
where  conditions  ilike 'Lung Cance%'; -- 2747 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Prostate Cancer' 
where  conditions  ilike 'Prostate Cance%'; --3945 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Parkinson Disease' 
where  conditions  ilike 'Parkinson%'; -- 3610 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Rheumatoid Arthritis' 
where  conditions  ilike 'Rheumatoid Arthritis%'; -- 4032 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Stroke' 
where  conditions  ilike 'Stroke%'; -- 4355 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Healthy Volunteers' 
where  conditions  = 'Healthy'; -- 5794 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Not Applicable' 
where  conditions  ilike 'N/A%' or  conditions  ilike 'None%' or conditions  ilike 'Not Applicable%'  or conditions  ilike  'NULL%' or length(conditions) = 0; -- 10985 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Non-Small Cell Lung Cancer' 
where  conditions  ilike 'Non-small Cell Lung Cance%'; -- 2684 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Pancreatic Cancer' 
where  conditions  ilike 'Pancreatic Cance%'; -- 1463 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Cancer' 
where  conditions  ilike 'Cance'; -- 1250 updated

update ictrp_rpt.ictrp_full_data set conditions_std  = 'Healthy Volunteers' 
where  conditions  ilike 'Healthy adult%' or conditions  ilike  'Healthy Volunteer%'; -- 5239 updated
--- CONDITIONS END -----

-- populate source registry names

--  add new column name "source_register_cd_drvd"

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD source_register_cd_drvd character varying;

update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = source_register_cd 
	from   ictrp.mst_source_register m
	where  d.trialid  like '%'||m.source_register_cd||'%' and source_register_cd_drvd is null; --717373 updated

	update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = 'NTR' 
     where source_register_cd_drvd is null and trialid like 'NL%'; -- 2327 updated
    
   	update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = 'REBEC' 
     where source_register_cd_drvd is null and trialid like 'RBR%'; -- 5137 updated

   	update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = 'REPEC' 
     where source_register_cd_drvd is null and trialid like 'PER%'; -- 1958 updated   
    
  	update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = 'ChiCTR' 
     where source_register_cd_drvd is null and trialid like 'chictr%'; -- 02 updated    
        
  	update ictrp_rpt.ictrp_full_data d
	   set source_register_cd_drvd = 'CRIS' 
     where source_register_cd_drvd is null and trialid like 'KCT%'; -- 6229 updated
	 
-- source_register_cd_drvd end here.

--# update source_register_iso_cd start 

-- add new column "source_register_iso_cd"

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD source_register_iso_cd character varying;

update ictrp18112021.ictrp_rpt.ictrp_full_data d
	   set source_register_iso_cd = iso_3_country_cd 
	from   ictrp.mst_source_register m
	where  m.source_register_cd = d.source_register_cd_drvd ; -- 733026 records updated

--# update source_register_iso_cd end. 

-- update the date formats as standard date time column data type 
-- # Date format standardization Start     

-- add two more columns here "date_registration_std", "date_enrollement_std"

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD date_registration_std character varying;

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD date_enrollement_std character varying;

-- srilanka
update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'SLCTR%' ;  -- 392 updated

-- india 
update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD-MM-YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD-MM-YYYY') 
where trialid like 'CTRI%' ; -- 37430 updated


-- Cuban Public Registry of Clinical Trials  ; -- need to exclude non-numeric data 
update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std = ( case when date_enrollement is not null then to_date(date_enrollement,'DD/MM/YYYY')  else null end )
where  trialid like 'RPCEC%'  and date_enrollement  ~ '^[0-9].*' ;  -- 394 updated

-- IRCT
update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'IRCT%' ; -- 28253 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'TCTR%' ; -- 6077 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'NTR%' ; -- 7482 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'DRKS%' ; -- 12871 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'CRIS%' ; -- 0 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
 --  , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
-- format is not correct for date_enrollement .. 
where trialid like 'NCT%' ; -- 385338 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'LBCTR%' ; -- 116 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'ISRCTN%' ; -- 20927 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') -- "29/09/2017"
 --  , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
-- format is not correct for date_enrollement .. 
where trialid like 'JPRN%' ; -- 50464 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'REPEC%'; --- 0 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'ChiCTR%' or trialid like 'chictr%'; -- 40451 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'REBEC%'; -- 0 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'PACTR%'; -- 3120 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'EUCTR%'; -- 102939 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'ACTRN%'; -- 21120 updated

update ictrp_rpt.ictrp_full_data 
set  date_registration_std = to_date(date_registration,'YYYY-MM-DD'), -- 6229 updated
  -- date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'KCT%'; -- some format issues 

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'NL%'; -- 2327 updated

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'PE%'; -- 1958 updated  

update ictrp_rpt.ictrp_full_data 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'RB%'; -- 5137 updated

-- update '' dates trasnlated to 0001 year back to NULL . 
update ictrp_rpt.ictrp_full_data set date_registration_std = null 
where to_char(date_registration_std,'YYYY') ='0001'; -- some format issue
-- -- --- updated end . 
-- # Date format standardization End


-- # Start : convert the Target size to Integer , Exclude nulls and 0 length strings

-- Add new column "target_size_std"

ALTER TABLE ictrp_rpt.ictrp_full_data
ADD target_size_std character varying;

update ictrp_rpt.ictrp_full_data
set target_size_std = cast (target_size AS BIGINT) 
where source_register_cd_drvd  in ('NCT','EUCTR','JPRN',
'CTRI','IRCT','ACTRN','ISRCTN','DRKS','NTR','CRIS','TCTR','REBEC','PACTR','REPEC','LBCTR') 
and length (target_size) > 0 and target_size  is not null and target_size  <> 'null'; -- 672539 updated

-- # End  

-- to change the data type of columns date_registration_std and date_enrollement_std

ALTER TABLE ictrp_rpt.ictrp_full_data ALTER COLUMN date_registration_std TYPE DATE 
using to_date(date_registration_std, 'YYYY-MM-DD');

ALTER TABLE ictrp_rpt.ictrp_full_data ALTER COLUMN date_enrollement_std TYPE DATE 
using to_date(date_enrollement_std, 'YYYY-MM-DD');

--- Finished ---