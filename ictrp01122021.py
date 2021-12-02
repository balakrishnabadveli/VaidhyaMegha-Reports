#!/usr/bin/env python
# coding: utf-8

# In[1]:


pwd


# In[2]:


import os 
os.chdir ('C:\ICTRP\python')


# In[3]:


pwd


# In[4]:


import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')

from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
from plotly.graph_objs import *

import plotly.express as px
import cufflinks as cf
init_notebook_mode()

import plotly.io as pio
pio.renderers

from datetime import datetime, timedelta, date


# In[5]:


cf.go_offline()


# In[6]:


path = "C:\ICTRP\python"


# In[7]:


pd.options.display.max_columns = None


# In[8]:


def check_df_udf (df):
    # Check Data Frame function 
    print ('==='*20)
    print ('=== Inside check_df_udf Function =====')
    print ('type(df) : ', type(df),'\n')
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')
    print ('df.info() : \n', df.info(),'\n')
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')
    print ('df.shape : \n', df.shape,'\n')
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')
    print ('df.describe() : \n ',df.describe())
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')
    print ('df.dtypes : \n ',df.dtypes,'\n\n')
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')
    print ('memory_usage : \n ',df.info(memory_usage='deep'),'\n\n')
    print('----- ---- ---- --------        ---- - -- - -- -- -- - - - -- - - - - -- - - -- - -    ')


# In[9]:


# Pass SqlQuery and  Empty Data Frame . it will execute the Sql Qury and result will be returned in the data frame 

def create_df_from_qry (sqlqry,df_desc = 'N'):

    # Ref : https://towardsdatascience.com/python-and-postgresql-how-to-access-a-postgresql-database-like-a-data-scientist-b5a9c5a0ea43

    # This Python script connects to a PostgreSQL database and utilizes Pandas to obtain data and create a data frame
    # A initialization and configuration file is used to protect the author's login credentials
    # Need to keep 2 files in the same directoty of python this notebook config.py , database.ini    
   
# chnage this file into local path of your path folder...

    import psycopg2
    # Import the 'config' funtion from the config.py file
    from a1 import config

    # Establish a connection to the database by creating a cursor object

    # Obtain the configuration parameters
    params = config()
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(**params)
    # Create a new cursor
    cur = conn.cursor()

    # A function that takes in a PostgreSQL query and outputs a pandas database 
    def create_pandas_table(sql_query, database = conn):
        table = pd.read_sql_query(sql_query, database)
        return table

    # Utilize the create_pandas_table function to create a Pandas data frame
    # Store the data as a variable
    df_param=pd.DataFrame()
    df_param = create_pandas_table(sqlqry)

    # Close the cursor and connection to so the server can allocate
    # bandwidth to other requests
    cur.close()
    conn.close()
    
    # check Data frame  and print the statements. 
    if df_desc == 'Y' : 
        check_df_udf (df_param)
    
    return df_param


# In[10]:


# Read the Postgres Data and make the Data frame here . 

df = create_df_from_qry("SELECT trialid,public_title,target_size_std,source_register_cd_drvd,date_registration_std,source_register_iso_cd  ,conditions FROM ictrp_rpt.ictrp_full_data ")


# In[11]:


df


# In[12]:


# Read the Postgres Data and make the Data frame here . 

df2 = create_df_from_qry("SELECT trialid,public_title,target_size_std,source_register_cd_drvd,date_registration_std,source_register_iso_cd  ,conditions FROM ictrp_rpt.ictrp_full_data ")


# In[13]:


df2


# In[25]:


def print_chart_to_pdf_udf (fig, filename) : 
    
    # fig          : figure name 
    # filename : to be printed as pdf , this name will be appended with timestamp and will be used as pdf file name . 
    
    # get the logo to be displayed from local .. this is not needed if you are getting from web url , like git. 
    from PIL import Image;
    img = Image.open('VaidhyaMegha_Logo_v1.png')

    # add the background image
    fig.add_layout_image(
        dict(
            #source="https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/vox.png",
            source=img,
            xref="paper", yref="paper",
            x=.03, y=1.05,
            sizex=0.2, sizey=0.2,
            xanchor="left", yanchor="bottom"
        )
    )


    fig.update_layout(
        autosize=False,
        width=1000,    height=700,
        margin=dict(        l=50,        r=50,        b=100,        t=100,        pad=4    ),
        paper_bgcolor="white",
    )    

    # adding time stamp to image name dynamically and prepare filename with folder path to export to . 
    dtm = datetime.now().strftime("%Y%m%d_%H%M%S")
    filenm = filename + '_' +dtm + '.pdf'
    filename = os.path.join(path, filenm)

    # export graph to pdf

    fig.write_image( filename ,width=1200,height=800,scale=1)


# In[26]:


# histogram for Source Register
fig_hist_srcReg = px.histogram(df2, x='source_register_cd_drvd',nbins=(50)  , template='presentation'
                               ,title='Total Trials per Source Register'
                               , color="source_register_cd_drvd"
                               ,labels = {'source_register_cd_drvd' : 'source register' })

fig_hist_srcReg.update_layout(
    autosize=False,
    width=1000,    height=700,
    margin=dict(        l=50,        r=50,        b=100,        t=100,        pad=4    ),
    paper_bgcolor="LightSteelBlue",
    showlegend=False  # No legend needed in this graph
    # ,legend_title_text='Trend' # legend name
    #title="Plot Title",
    # ,xaxis_title="Source Register"
    ,yaxis_title="Number of Trials" 
)

#fig_hist_srcReg.update_traces(textposition='outside')
# fig_hist_srcReg.update_layout(uniformtext_minsize=8, uniformtext_mode='hide')

fig_hist_srcReg.update_xaxes(categoryorder='total ascending',tickangle=45)

fig_hist_srcReg.update_xaxes(showline=True, linewidth=2, linecolor='black', mirror=True)
fig_hist_srcReg.update_yaxes(showline=True, linewidth=2, linecolor='black', mirror=True , ticklabelposition="inside top")

# # update layout properties
# fig.update_layout(
#     bargap=0.15,
#     bargroupgap=0.1,
#     barmode="stack",
#     hovermode="x",
#     margin=dict(r=20, l=300, b=75, t=125),
#     title=("Moving Up, Moving Down<br>" +
#            "<i>Percentile change in income between childhood and adulthood</i>"),
# )

#plot(fig_hist_srcReg)

# commented below code and added function to print to pdf

print_chart_to_pdf_udf (fig_hist_srcReg , 'Total Trials per Source Register' )

#     # get the logo to be displayed from local .. this is not needed if you are getting from web url , like git. 
#     from PIL import Image;
#     img = Image.open('VaidhyaMegha_Logo_v1.png')

#     # add the background image
#     fig_hist_srcReg.add_layout_image(
#         dict(
#             #source="https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/vox.png",
#             source=img,
#             xref="paper", yref="paper",
#             x=.03, y=1.05,
#             sizex=0.2, sizey=0.2,
#             xanchor="left", yanchor="bottom"
#         )
#     )


#     # adding time stamp to image name dynamically and prepare filename with folder path to export to . 
#     dtm = datetime.now().strftime("%Y%m%d_%H%M%S")
#     filenm = 'Total Trails per Source Register' + '_' +dtm + '.pdf'
#     filename = os.path.join(path, filenm)

#     # export graph to pdf

#     fig_hist_srcReg.write_image( filename ,width=1200,height=800,scale=1)

# show Graph Inline 
fig_hist_srcReg.show()

#fig_hist_srcReg.write_image("images\fig2.png",width=1200,height=800,scale=1)


# In[27]:


# Pie on Study Type

# Ready the DF on Query 
# Read the Postgres Data and make the Data frame here . 

# sqlqry = " select (case when study_type in ('Interventional clinical trial of medicinal product','interventional','Interventional study', \
# 'Interventional Study','Intervention','INTERVENTIONAL' ,'Interventional' \
# ) then 'Interventional' \
#  when study_type in ('OBSERVATIONAL','Observational','Observational study','Observational [Patient Registry]','observational','Observational Study') then 'Observational' \
#  when study_type in ('Cause','Cause/Relative factors study') then 'Cause' \
#  when study_type in ('Basic Science','Basic science') then 'Basic Science' \
#  when study_type in ('Health Services Research','Health services reaserch') then 'Health Services Research' \
#  when study_type in ('Other','Others,meta-analysis etc','','N/A','Unknown') or study_type is null then 'Others' \
# else study_type \
# end ) study_type_stnd  , count(*) \
# from ictrp_rpt.ictrp_full_data \
# group by study_type_stnd "

# : all other types other than interventional, observational are very less , they account to 1.5% so clubbed all of them under one category for simplicity

sqlqry = " select (case when study_type in ('Interventional clinical trial of medicinal product','interventional','Interventional study', 'Interventional Study','Intervention','INTERVENTIONAL' ,'Interventional') then 'Interventional'  when study_type in ('OBSERVATIONAL','Observational','Observational study','Observational [Patient Registry]','observational','Observational Study') then 'Observational'  else  'Others' end ) study_type_stnd  , count(*) from ictrp_rpt.ictrp_full_data group by study_type_stnd "

df_studytype_count = create_df_from_qry(sqlqry)


# Plot with above DF 
colors = ['lightgreen', 'mediumturquoise', 'darkorange']

fig = px.pie(df_studytype_count, values='count', names='study_type_stnd', title='Distribution of Study Types' ) 
fig.update_layout(title_x=0.45 ,   font=dict(
         size=16,
        color="RebeccaPurple"
    ))
fig.update_traces(textposition='inside', textinfo='percent+label' ,marker=dict(colors=colors, line=dict(color='#000000', width=2))                  ,textfont_size=16)

print_chart_to_pdf_udf (fig , 'Distribution of Study Types' )

fig.show()


# In[28]:


sqlqry = "select coalesce (conditions_std,conditions ) conditions_new, count(*)    count from ictrp_rpt.ictrp_full_data   where date_registration_std  > (now() - interval '730 DAYS') and conditions_std <> 'Not Applicable' group by conditions_new order by 2 desc limit 20"

df_conditions_count = create_df_from_qry(sqlqry)

# Plot with above DF 
colors = ['lightgreen', 'mediumturquoise', 'darkorange']

fig = px.pie(df_conditions_count, values='count', names='conditions_new', title='Top 10 Trial Conditions Since 2 years' ) 
fig.update_layout(title_x=0.45 ,   font=dict(
         size=16,
        color="RebeccaPurple"
    ))
fig.update_traces(textposition='inside', textinfo='percent+label' ,marker=dict(colors=colors, line=dict(color='#000000', width=2))                  ,textfont_size=20)

print_chart_to_pdf_udf (fig , 'Top 10 Trial Conditions Pie Chart Since 2 Years' )

fig.show()


# In[29]:


fig = px.bar(df_conditions_count,x='conditions_new' , y='count', title='Top 10 Trial Conditions Since 2 Years' ,
              color='conditions_new' 
            ,labels = {'conditions_new' : 'Conditions' } , height=400) 

fig.update_layout(title_x=0.45 ,   font=dict(
         size=16,
        color="RebeccaPurple"
    ))

fig.update_xaxes(categoryorder='total descending',tickangle=45)
print_chart_to_pdf_udf (fig , 'Top 10 Trial Conditions Since 2 Years' )

fig.show()


# In[30]:


fig = px.histogram(df2, x='date_registration_std', title="Trial Counts by Year and Month" ,  template='presentation'
                  , labels = {'date_registration_std' : 'Registered Date Year and Month' }) 
fig.update_traces(xbins_size="M1")
fig.update_layout(bargap=0.2,hovermode="x",title_x=0.5)
fig.update_yaxes(automargin=True)

fig.show()


# Added iso code in Colr to above plot 

# fig = px.histogram(df, x='Last Refreshed on', title="Covid-19 Trail Counts per Year and Month <br> <i> with Registry Color <i>" 
#                    ,template='presentation'
#                   , labels = {'Last Refreshed on' : 'Last Refreshed Year and Month' }
#                    ,color='source_register_iso3_cd') 
# fig.update_traces(xbins_size="M1")
# fig.update_layout(bargap=0.2,hovermode="x",title_x=0.5)
# fig.update_yaxes(automargin=True)

# fig.show()


# In[20]:


# Top 20 Conditions Per Registries per Condition Data PreParation : 

df_per_regtry = pd.DataFrame(df2[['source_register_iso_cd','source_register_cd_drvd']].value_counts())

# print dataframe columns
print("Before Index Reset Dataframe columns:", df_per_regtry.columns)

df_per_regtry.reset_index(inplace=True)

# print dataframe columns
print("After Index Reset Dataframe columns:", df_per_regtry.columns)

# change column name Category to Pet
df_per_regtry = df_per_regtry.rename(columns={0 : "count" })

# print dataframe columns
print("Dataframe columns after rename :", df_per_regtry.columns)

df_per_regtry


# In[ ]:




