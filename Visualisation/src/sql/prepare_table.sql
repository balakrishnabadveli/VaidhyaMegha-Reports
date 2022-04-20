
--CREATE TABLE ictrp.test AS
--SELECT * FROM ictrp.ictrp_full_weekly_data;

--SELECT * FROM public.trial_article
--WHERE NOT pubmed_articles ='{}';

CREATE TABLE ictrp.trial_article (
id_key SERIAL, 
id varchar,
trial varchar,
pubmed_articles _int4
);


INSERT INTO ictrp.trial_article (id,trial,pubmed_articles)
select * FROM public.trial_article
WHERE NOT pubmed_articles ='{}';

ALTER TABLE ictrp.trial_article
ADD pubmed_articles_str character varying;


UPDATE ictrp.trial_article SET pubmed_articles_str = pubmed_articles;

update ictrp.trial_article  set pubmed_articles_str = trim( '{ }' from pubmed_articles_str);


--  Create kg_nodes table and update Columns 

CREATE TABLE ictrp.kg_nodes (
ID_ SERIAL,
Labels_ varchar UNIQUE
--Attribute_ varchar 
);

 -- insert trial_articles and pubmed_articles
INSERT INTO ictrp.kg_nodes (Labels_ )
SELECT trial FROM ictrp.trial_article  
union all
SELECT unnest(string_to_array(pubmed_articles_str, ',')) AS parts FROM ictrp.trial_article;

--  Create kg_edges table and update Columns 
CREATE TABLE ictrp.kg_edges (
--Source_Label varchar,
Source_ int,
Target_ SERIAL,
Target_Label varchar,
Type_ varchar
);

--  insert Source and pubmed_articles 
INSERT INTO ictrp.kg_edges (Source_, Target_Label )
SELECT id_key , unnest(string_to_array(pubmed_articles_str, ',')) FROM ictrp.trial_article;

-- Update Target by adding adding table size of trial_article 
UPDATE ictrp.kg_edges 
SET Target_ = Target_ + (select COUNT (*) from ictrp.trial_article) ;

UPDATE ictrp.kg_edges 
SET Type_ = 'Undirected';
--
ALTER TABLE  ictrp.kg_edges   
DROP COLUMN Target_Label;  

