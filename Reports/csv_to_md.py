
# https://cppsecrets.com/users/1102811497104117108109111104116975048484864103109971051084699111109/Convert-a-CSV-file-to-a-table-in-a-markdown-file.php

#Importing the libraries
import csv
import os
import argparse
import glob

def csv_to_md(csv_file_path, file_num):

    # list of .md files
    files = glob.glob(date_dir + '/*.md')
    target_md_file = files[0]

     # define type of delimiter
    type_del = ','

    # used encoding UTF-8 as we won't have to worry about errors while decoding contents of a csv file
    csv_dict = csv.DictReader(open(csv_file_path, encoding="UTF-8"),delimiter=type_del)

    # storing the content of csv file in a list_of_rows. Each row is a dict.
    list_of_rows = [dict_row for dict_row in csv_dict]

    # For Headers of the csv file.
    headers = list(list_of_rows[0].keys())

    # The below code block makes md_string as per the required format of a markdown file.
    md_string = " | "
    for header in headers:
        md_string += header+" |"

    md_string += "\n |"
    for i in range(len(headers)):
        md_string += "--- | "

    md_string += "\n"

    for i, row in enumerate(list_of_rows):
        md_string += " | "
        for header in headers:
            md_string += row[header]+" | "
        if i < len(list_of_rows):
            md_string += "\n"

    with open(target_md_file,'r',encoding='UTF-8') as file:
        data = file.readlines()

    # write data of sankey table 1
    if file_num == 0:
        data[60:80]= md_string
        with open(target_md_file, 'w', encoding='UTF-8') as file:
            file.writelines(data)

    # write data of sankey table 2
    elif file_num == 1:
        data[95:113] = md_string
        with open(target_md_file, 'w', encoding='UTF-8') as file:
            file.writelines(data)


ap = argparse.ArgumentParser()
ap.add_argument("-f", "--folder", required=True, help="path to folder")
args = vars(ap.parse_args())

# directory of present week
date_dir = os.path.join(os.getcwd(), args["folder"])

# directory of cvv_files inside present week directory
csv_dir = os.path.join(date_dir, 'csv_files')

# loop over sankey csv files
for i, file in enumerate(os.listdir(csv_dir)):
    file_path = os.path.join(csv_dir, file)
    csv_to_md(file_path, i)

