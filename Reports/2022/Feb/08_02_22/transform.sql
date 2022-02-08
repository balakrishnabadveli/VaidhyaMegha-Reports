SELECT COUNT(*) FROM ictrp.ictrp_full_weekly_data;

-- \COPY ictrp."ictrp_weekly_data" FROM 'ICTRPWeek31January2022.csv' DELIMITER ',' CSV QUOTE AS '"' HEADER; 
-- \COPY ictrp."ictrp_full_weekly_data" FROM 'ICTRPWeek31January2022.csv' DELIMITER ',' CSV QUOTE AS '"' HEADER; 


-- SELECT COUNT(*) FROM ictrp.ictrp_full_weekly_data;


-- ####################### Trasfomation Script Starts Here ##################

-- Deduplication of Source Data
-- as mentioned above ictrp_full_weekly_data have lot of duplicates, so it need to be clean all the 
-- unnecessary data

-- command to delete the duplicates
delete from ictrp.ictrp_full_weekly_data i
using
(select trialid, max(ctid) as max_ctid from ictrp.ictrp_full_weekly_data group by trialid) t
where i.ctid <> t.max_ctid
and i.trialid = t.trialid; 

-- Drop the table in ictrp schema, so as to create table with new data.
DROP TABLE ictrp.ictrp_rpt;

-- Create Table in ictrp
CREATE TABLE ictrp.ictrp_rpt AS
SELECT * FROM ictrp.ictrp_full_weekly_data;

-- Data Transformation in Postgres ---

-- remove the "" from key columns , need to include all columns once the data loaded and duplicates r removed. 	

-- Data cleaning by removing un wanted symbols like ""  , : , <br>

---Updating Columns by removing  " " in records
update ictrp.ictrp_rpt 
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
	,target_size = trim(both '" "' from target_size);	
	
update ictrp.ictrp_rpt set conditions  = trim(leading ';' from conditions) ; 
update ictrp.ictrp_rpt set conditions  = trim(both '<br>' from conditions) ;



--Adding New Columns and updating data to new columns


-- add new column here "conditions_std"
ALTER TABLE ictrp.ictrp_rpt
ADD conditions_std character varying;

update ictrp.ictrp_rpt set conditions_std  = 'Covid-19' 
where conditions  ilike '%Covid%19%' 
or conditions='COVID'
or conditions ilike 'SARS-CoV%'
or conditions ilike 'SARS-CoV-2'
or conditions ilike '%B972- Coronavirus as the cause of diseases classified elsewhere%';


update ictrp.ictrp_rpt set conditions_std  = 'O- Medical and Surgical' 
where  conditions ilike 'Health Condition 1: O- Medical and Surgical%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Atrial Fibrillation' 
where  conditions  ilike 'Atrial Fibrillation%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Diabetes Mellitus' 
where  conditions  ilike 'Diabetes Mellitus%'
or conditions ilike 'Diabetes%'
or conditions ilike 'Type 2 Diabetes%'
or conditions ilike 'Type 1 Diabetes%'
or conditions ilike 'Health Condition 1: E119- Type 2 diabetes mellitus without complications%';


update ictrp.ictrp_rpt set conditions_std  = 'Knee Osteoarthritis' 
where  conditions  ilike 'Knee Osteoarthritis%'
or conditions ilike 'Knee Osteoarthritis%'
or conditions ilike 'Osteoarthritis%' 
or conditions ilike 'Knee%'
or conditions ilike 'Total Knee%'
or conditions ilike 'Osteoarthritis, Knee%'
or conditions ilike 'Health Condition 1: M179- Osteoarthritis of knee, unspecified%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Rheumatoid Arthritis' 
where  conditions  ilike 'Rheumatoid Arthritis%'; -- 4042 updated

update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the musculo-skeletal system and connective tissue' 
where  conditions  ilike 'Diseases of the musculo-skeletal system and connective tissue %'
or  conditions ilike 'Diseases of the musculoskeletal system and connective tissue%'
or conditions ilike 'Musculoskeletal Diseases;Musculoskeletal Diseases%' ;


update ictrp.ictrp_rpt set conditions_std  = 'Healthy Volunteers' 
where  conditions  ilike  'Healthy'
or conditions ilike 'Healthy adult%' 
or conditions ilike  'Healthy Voluntee%'
or conditions ilike 'Healthy woman%' 
or conditions ilike  'Healthy person%' 
or conditions ilike 'Healthy individuals%' 
or conditions ilike 'Normal healthy volunteers%';

update ictrp.ictrp_rpt set conditions_std  = 'Not Applicable' 
where  conditions  ilike 'N/A%' or  conditions  ilike 'None%' or conditions  ilike 'Not Applicable%'  or conditions  
ilike  'NULL%' or length(conditions) = 0; 



update ictrp.ictrp_rpt set conditions_std  = 'Cancer' 
where  conditions  ilike 'Cance'; 

update ictrp.ictrp_rpt set conditions_std  = 'Breast Cancer' 
where conditions ilike 'Breast cance%'
or conditions ilike 'Breast Neoplasm Female%'
or conditions ilike 'Malignant Neoplasm of Breast%'
or conditions ilike 'Advanced Breast Cance%'
or conditions ilike 'Triple-negative Breast Cance%'
or conditions ilike 'Health Condition 1: C509- Malignant neoplasm of breast of unspecified site%';	

update ictrp.ictrp_rpt set conditions_std  = 'Cervical Cancer' 
where  conditions  ilike 'Cervical cance%'
or conditions ilike 'Advanced Cervical Cance'; 



update ictrp.ictrp_rpt set conditions_std  = 'Prostate Cancer' 
where  conditions  ilike 'Prostate Cance%'
or conditions ilike 'Recurrent Prostate Cance'; 

update ictrp.ictrp_rpt set conditions_std  = 'Pancreatic Cancer' 
where  conditions  ilike 'Pancreatic Cance%'
or conditions  ilike 'Advanced Pancreatic Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Gastric Cancer' 
where  conditions  ilike 'Gastric cance%'
or conditions ilike 'unresectable advanced gastric cance%'
or conditions ilike 'Early Gastric Cancer%'; 

/*
 * Colorectal Cancer merged with Rectal cancer
 * 
 * update ictrp.ictrp_rpt set conditions_std  = 'Colorectal Cancer' 
where  conditions  ilike 'colorectal cance%'
or conditions  ilike 'Metastatic Colorectal Cancer%%';
 */

update ictrp.ictrp_rpt set conditions_std  = 'Rectal Cancer' 
where  conditions  ilike 'Rectal Cance%'
or conditions ilike 'Recurrent Rectal Cance%'
or conditions ilike 'Locally Advanced Rectal Cance%'
or conditions  ilike 'colorectal cance%'
or conditions  ilike 'Metastatic Colorectal Cancer%%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Bladder Cancer' 
where  conditions  ilike 'Bladder Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Carcinoma' 
where  conditions  ilike 'carcinoma%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Hepatocellular Carcinoma' 
where  conditions  ilike 'Hepatocellular Carcinoma%';

update ictrp.ictrp_rpt set conditions_std  = 'Solid Tumors' 
where  conditions  ilike 'Advanced Solid Tumo%'
or conditions ilike 'Solid Tumo%' 
or conditions ilike 'Solid Tumor%'; 

-----------------------------------------------------------------

update ictrp.ictrp_rpt set conditions_std  = 'Neoplasms' 
where  conditions  ilike 'Neoplasms%';
 

update ictrp.ictrp_rpt set conditions_std  = 'Analgesia & Anesthesia' 
where  conditions  ilike 'Analgesia%'
or conditions ilike 'Anesthesia%' 
or conditions ilike 'Anaesthesia'; 


update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the digestive system' 
where  conditions  ilike 'Diseases of the digestive system%';

update ictrp.ictrp_rpt set conditions_std  = 'Gastroenteritis' 
where conditions  ilike 'Gastroenteritis%'
or conditions ilike 'Appendicitis%'
or conditions ilike 'Colitis%'
or conditions ilike 'Dysentery%'
or conditions ilike 'Enteritis%'
or conditions ilike 'Enterocolitis%'
or conditions ilike 'Esophagitis %'
or conditions ilike 'Gastritis%'
or conditions ilike 'Mucositis%'
or conditions ilike 'Proctitis%'
or conditions ilike 'Inflammatory Bowel%';


update ictrp.ictrp_rpt set conditions_std  = 'Diet' 
where  conditions  ilike 'Diet%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Obesity' 
where  conditions  ilike 'Obesity%'; 


update ictrp.ictrp_rpt set conditions_std  = 'Liver Transplant' 
where  conditions  ilike 'Liver Transplant%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Infertility' 
where  conditions  ilike 'Infertility%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Lung Cancer' 
where  conditions  ilike 'Lung Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Non-Small Cell Lung Cancer' 
where  conditions  ilike 'Non-small Cell Lung Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Chronic Obstructive Pulmonary Disease' 
where conditions ilike 'Chronic Obstructive Pulmonary Disease%'
or  conditions ilike 'COPD%'
or  conditions  ilike 'Asthma%'
or conditions ilike 'Bronchial asthma'
or conditions  ilike 'Allergic asthma%'
or conditions ilike 'onchial asthma'
or conditions ilike 'Cough Variant Asthma'
or conditions ilike 'Paediatric asthma';

update ictrp.ictrp_rpt set conditions_std  = 'Tuberculosis' 
where  conditions  ilike 'Tuberculosis%'; 



update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the circulatory system' 
where  conditions  ilike 'Diseases of the circulatory system%';

update ictrp.ictrp_rpt set conditions_std  = 'Heart Failure' 
where  conditions  ilike 'Heart Failure%';

update ictrp.ictrp_rpt set conditions_std  = 'Stroke' 
where  conditions  ilike 'Stroke%'
or conditions ilike 'Acute stroke%'; -- 4370 updated

update ictrp.ictrp_rpt set conditions_std  = 'Myocardial'
where  conditions  ilike 'Myocardial%';

update ictrp.ictrp_rpt set conditions_std  = 'Pericarditis'
where  conditions  ilike 'Pericarditis%';

update ictrp.ictrp_rpt set conditions_std  = 'Multiple Myeloma' 
where  conditions  ilike 'Multiple Myeloma%';

update ictrp.ictrp_rpt set conditions_std  = 'Hypertension' 
where  conditions  ilike 'Hypertension%'
or conditions ilike 'Health Condition 1: I10- Essential (primary) hypertension%';

update ictrp.ictrp_rpt set conditions_std  = 'Coronary Artery Disease' 
where  conditions  ilike 'Coronary Artery Disease%';


update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the nervous system' 
where  conditions  ilike 'Diseases of the nervous system%'
or conditions ilike 'Autism Spectrum Disorde%';

update ictrp.ictrp_rpt set conditions_std  = 'Parkinson Disease' 
where  conditions  ilike 'Parkinson%'; -- 3624 updated

update ictrp.ictrp_rpt set conditions_std  = 'Alzheimer Disease' 
where  conditions  ilike 'Alzheimer%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Major Depressive Disorder' 
where  conditions  ilike 'Major Depressive Disorde%'
or conditions ilike 'Schizophrenia%';

update ictrp.ictrp_rpt set conditions_std  = 'Mental Issues' 
where  conditions  ilike 'Stress%'
or conditions ilike 'Depression%'
or conditions ilike 'Anxiety%'; 


update ictrp.ictrp_rpt set conditions_std  = 'Atopic Dermatitis' 
where  conditions  ilike 'Atopic Dermatitis%';


update ictrp.ictrp_rpt set conditions_std  = 'Pain' 
where  conditions  ilike 'Pain%'
or conditions ilike 'Chronic Pain%' ;

--- CONDITIONS END -----


-- populate source registry names

--  add new column name "source_register_cd_drvd"

ALTER TABLE ictrp.ictrp_rpt
ADD source_register_cd_drvd character varying;

update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = source_register_cd 
	from   ictrp.mst_source_register m
	where  d.trialid  like '%'||m.source_register_cd||'%' and source_register_cd_drvd is null; 

	update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = 'NTR' 
     where source_register_cd_drvd is null and trialid like 'NL%'; 
    
   	update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = 'REBEC' 
     where source_register_cd_drvd is null and trialid like 'RBR%'; 

   	update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = 'REPEC' 
     where source_register_cd_drvd is null and trialid like 'PER%'; 
    
  	update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = 'ChiCTR' 
     where source_register_cd_drvd is null and trialid like 'chictr%'; 
        
  	update ictrp.ictrp_rpt d
	   set source_register_cd_drvd = 'CRIS' 
     where source_register_cd_drvd is null and trialid like 'KCT%'; 
	 
-- source_register_cd_drvd end here.


--- update source_register_iso_cd start 

-- add new column "source_register_iso_cd"

ALTER TABLE ictrp.ictrp_rpt
ADD source_register_iso_cd character varying;

update ictrp.ictrp_rpt d
	   set source_register_iso_cd = iso_3_country_cd 
	from   ictrp.mst_source_register m
	where  m.source_register_cd = d.source_register_cd_drvd ; -- 735344 records updated

--- update source_register_iso_cd end. 

	
-- update the date formats as standard date time column data type 
-- # Date format standardization Start     

-- add two more columns here "date_registration_std", "date_enrollement_std"

ALTER TABLE ictrp.ictrp_rpt
ADD date_registration_std character varying;

ALTER TABLE ictrp.ictrp_rpt
ADD date_enrollement_std character varying;

-- srilanka
update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'SLCTR%' ;  -- 392 updated

-- india 
update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD-MM-YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD-MM-YYYY') 
where trialid like 'CTRI%' ; -- 37699 updated


-- Cuban Public Registry of Clinical Trials  ; -- need to exclude non-numeric data 
update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std = ( case when date_enrollement is not null then to_date(date_enrollement,'DD/MM/YYYY')  
	else null end )
	where  trialid like 'RPCEC%'  and date_enrollement  ~ '^[0-9].*' ;  -- 394 updated

-- IRCT
update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'IRCT%' ; -- 28253 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'TCTR%' ; -- 6077 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'NTR%' ; -- 7482 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'DRKS%' ; -- 12871 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'CRIS%' ; -- 0 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
 --  , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
-- format is not correct for date_enrollement .. 
where trialid like 'NCT%' ; -- 386730 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'LBCTR%' ; -- 116 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'ISRCTN%' ; -- 20989 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') -- "29/09/2017"
 --  , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
-- format is not correct for date_enrollement .. 
where trialid like 'JPRN%' ; -- 50464 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'REPEC%'; --- 0 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'ChiCTR%' or trialid like 'chictr%'; -- 40665 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'YYYY-MM-DD') 
   , date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'REBEC%'; -- 0 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'PACTR%'; -- 3120 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'EUCTR%'; -- 103221 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'ACTRN%'; -- 21211 updated

update ictrp.ictrp_rpt 
set  date_registration_std = to_date(date_registration,'YYYY-MM-DD') -- 6229 updated
  -- date_enrollement_std =  to_date(date_enrollement,'YYYY-MM-DD') 
where trialid like 'KCT%'; -- some format issues 

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'NL%'; -- 2335 updated

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'PE%'; -- 1958 updated  

update ictrp.ictrp_rpt 
set date_registration_std = to_date(date_registration,'DD/MM/YYYY') 
   , date_enrollement_std =  to_date(date_enrollement,'DD/MM/YYYY') 
where trialid like 'RB%'; -- 5137 updated

-- update '' dates trasnlated to 0001 year back to NULL . 
--update ictrp.ictrp_rpt set date_registration_std = null 
--where to_char(date_registration_std,'YYYY') ='0001'; -- some format issue

-- -- --- updated end . 
-- # Date format standardization End


---One more column addtion and updatation.
-- # Start : convert the Target size to Integer , Exclude nulls and 0 length strings

-- Add new column "target_size_std"

ALTER TABLE ictrp.ictrp_rpt
ADD target_size_std character varying;

update ictrp.ictrp_rpt
set target_size_std = cast (target_size AS BIGINT) 
where source_register_cd_drvd  in ('NCT','EUCTR','JPRN',
'CTRI','IRCT','ACTRN','ISRCTN','DRKS','NTR','CRIS','TCTR','REBEC','PACTR','REPEC','LBCTR') 
and length (target_size) > 0 and target_size  is not null and target_size  <> 'null'; 

-- # End 

-- to change the data type of columns date_registration_std and date_enrollement_std

ALTER TABLE ictrp.ictrp_rpt ALTER COLUMN date_registration_std TYPE DATE 
using to_date(date_registration_std, 'YYYY-MM-DD');

ALTER TABLE ictrp.ictrp_rpt ALTER COLUMN date_enrollement_std TYPE DATE 
using to_date(date_enrollement_std, 'YYYY-MM-DD');

--- Finished ---

-- ############# Transformation Ends Here ####################



-- ############# CTRI Update Starts Here ####################

/* This Script is only for updation of CTRI 
 * 
 */

update ictrp.ictrp_rpt set conditions_std  = 'Solid Tumors' 
where trialid like 'CTRI%' and
(conditions  ilike 'Advanced Solid Tumo%'
or conditions ilike 'Solid Tumo%' 
or conditions ilike 'Solid Tumor%'); 

update ictrp.ictrp_rpt set conditions_std  = 'O- Medical and Surgical' 
where trialid like 'CTRI%' and conditions  ilike '%O- Medical and Surgical%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Atrial Fibrillation' 
where trialid like 'CTRI%' and 
(conditions  ilike 'Atrial Fibrillation%'); 

update ictrp.ictrp_rpt set conditions_std  = 'Breast Cancer' 
where trialid like 'CTRI%' and 
conditions ilike '%Breast%';	

update ictrp.ictrp_rpt set conditions_std  = 'Cervical Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Cervical%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Rectal Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Rectal%';
 
update ictrp.ictrp_rpt set conditions_std  = 'Covid-19' 
where trialid like 'CTRI%' and  
(conditions  ilike '%Covid%19%' 
or conditions='COVID'
or conditions ilike 'SARS-CoV%'
or conditions ilike 'SARS-CoV-2'
or conditions ilike '%Coronavirus%');

update ictrp.ictrp_rpt set conditions_std  = 'Diabetes Mellitus' 
where trialid like 'CTRI%' and   conditions  ilike '%Diabetes%';

update ictrp.ictrp_rpt set conditions_std  = 'Gastric Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Gastric cance%';

update ictrp.ictrp_rpt set conditions_std  = 'Hepatocellular Carcinoma' 
where trialid like 'CTRI%' and   conditions  ilike '%Hepatocellular Carcinoma%';

update ictrp.ictrp_rpt set conditions_std  = 'Knee Osteoarthritis' 
where trialid like 'CTRI%' 
and (conditions ilike '%Osteoarthritis%' or conditions ilike '%Knee%') ; 


update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the musculo-skeletal system and connective tissue' 
where trialid like 'CTRI%' and   
(conditions  ilike '%musculo-skeletal%' or  conditions ilike '%musculoskeletal%');


update ictrp.ictrp_rpt set conditions_std  = 'Prostate Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Prostate Cance%'; 


update ictrp.ictrp_rpt set conditions_std  = 'Rheumatoid Arthritis' 
where trialid like 'CTRI%' and   conditions  ilike '%Rheumatoid Arthritis%'; 

/*
update ictrp.ictrp_rpt set conditions_std  = 'Healthy Volunteers' 
where trialid like 'CTRI%' and   
(or conditions  ilike  'Healthy'
or conditions ilike 'Healthy adult%' 
or conditions ilike  'Healthy Voluntee%'
or conditions ilike 'Healthy woman%' 
or conditions ilike  'Healthy person%' 
or conditions ilike 'Healthy individuals%' 
or conditions ilike 'Normal healthy volunteers%');-- 5811 updated
*/



update ictrp.ictrp_rpt set conditions_std  = 'Pancreatic Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Pancreatic Cance%'; 


update ictrp.ictrp_rpt set conditions_std  = 'Cancer' 
where trialid like 'CTRI%' and   conditions  ilike 'Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Neoplasms' 
where trialid like 'CTRI%' and   conditions  ilike 'Neoplasms%';

update ictrp.ictrp_rpt set conditions_std  = 'Analgesia & Anesthesia' 
where trialid like 'CTRI%' and   
(conditions ilike '%Analgesia%'
or conditions ilike '%Anesthesia%' 
or conditions ilike '%Anaesthesia'); 

update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the digestive system' 
where trialid like 'CTRI%' and   conditions  ilike '%Diseases of the digestive system%';

update ictrp.ictrp_rpt set conditions_std  = 'Gastroenteritis' 
where trialid like 'CTRI%' and   
(conditions  ilike '%Gastroenteritis%'
or conditions ilike '%Appendicitis%'
or conditions ilike '%Colitis%'
or conditions ilike '%Dysentery%'
or conditions ilike '%Enteritis%'
or conditions ilike '%Enterocolitis%'
or conditions ilike '%Esophagitis %'
or conditions ilike '%Gastritis%'
or conditions ilike '%Mucositis%'
or conditions ilike '%Proctitis%'
or conditions ilike '%Inflammatory Bowel%');

update ictrp.ictrp_rpt set conditions_std  = 'Bladder Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Bladder Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Diet' 
where trialid like 'CTRI%' and   conditions  ilike '%Diet%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Obesity' 
where trialid like 'CTRI%' and   conditions  ilike '%Obesity%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Liver Transplant' 
where trialid like 'CTRI%' and   conditions  ilike '%Liver Transplant%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Infertility' 
where trialid like 'CTRI%' and   conditions  ilike '%Infertility%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Lung Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Lung Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Non-Small Cell Lung Cancer' 
where trialid like 'CTRI%' and   conditions  ilike '%Non-small Cell Lung Cance%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Chronic Obstructive Pulmonary Disease' 
where trialid like 'CTRI%' and  
(conditions ilike '%Chronic Obstructive Pulmonary Disease%'
or conditions ilike '%Obstructive Pulmonary Disease%'
or conditions ilike '%COPD%'
or conditions ilike '%Asthma%');

update ictrp.ictrp_rpt set conditions_std  = 'Tuberculosis' 
where trialid like 'CTRI%' and  conditions  ilike '%Tuberculosis%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the circulatory system' 
where trialid like 'CTRI%' and  conditions ilike '%Diseases of the circulatory system%';

update ictrp.ictrp_rpt set conditions_std  = 'Heart Failure' 
where trialid like 'CTRI%' and   conditions  ilike '%Heart Failure%';

update ictrp.ictrp_rpt set conditions_std  = 'Stroke' 
where trialid like 'CTRI%' and   conditions  ilike '%Stroke%'
or conditions ilike 'Acute stroke%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Myocardial'
where trialid like 'CTRI%' and   conditions  ilike '%Myocardial%';

update ictrp.ictrp_rpt set conditions_std  = 'Pericarditis'
where trialid like 'CTRI%' and   conditions  ilike '%Pericarditis%';

update ictrp.ictrp_rpt set conditions_std  = 'Multiple Myeloma' 
where trialid like 'CTRI%' and   conditions  ilike '%Multiple Myeloma%';

update ictrp.ictrp_rpt set conditions_std  = 'Hypertension' 
where trialid like 'CTRI%' and   conditions  ilike '%Hypertension%';

update ictrp.ictrp_rpt set conditions_std  = 'Coronary Artery Disease' 
where trialid like 'CTRI%' and   conditions  ilike '%Coronary Artery Disease%';


update ictrp.ictrp_rpt set conditions_std  = 'Diseases of the nervous system' 
where trialid like 'CTRI%' and 
(conditions  ilike '%Diseases of the nervous system%'
or conditions ilike '%Autism Spectrum Disorde%');

update ictrp.ictrp_rpt set conditions_std  = 'Parkinson Disease' 
where trialid like 'CTRI%' and   conditions  ilike '%Parkinson%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Alzheimer Disease' 
where trialid like 'CTRI%' and   conditions  ilike '%Alzheimer%'; 

update ictrp.ictrp_rpt set conditions_std  = 'Major Depressive Disorder' 
where trialid like 'CTRI%' and   
(conditions  ilike '%Major Depressive Disorde%'
or conditions ilike '%Schizophrenia%');

update ictrp.ictrp_rpt set conditions_std  = 'Mental Issues' 
where trialid like 'CTRI%' and   
( conditions  ilike 'Stress%'
or conditions ilike 'Depression%'
or conditions ilike 'Anxiety%'); 

update ictrp.ictrp_rpt set conditions_std  = 'Atopic Dermatitis' 
where trialid like 'CTRI%' and   conditions  ilike '%Atopic Dermatitis%';

update ictrp.ictrp_rpt set conditions_std  = 'Pain' 
where trialid like 'CTRI%' and conditions  ilike '%Pain%';

-- ############# CTRI Update Ends Here ####################