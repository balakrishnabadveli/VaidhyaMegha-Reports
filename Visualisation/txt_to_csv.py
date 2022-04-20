
# https://www.geeksforgeeks.org/writing-csv-files-in-python/
#Importing the libraries
import csv
import os
import argparse
import glob

# field names
fields_node = ['ID', 'Label', 'Attribute']
fields_edge = ["Source", "Target", "Attribute", "Type"]

# Line_Intervention = "Intervention\n"
# Line_Condition = "Condition\n"
# Line_Pubmed_Article ="Pubmed_Article\n"
#
# Attribute_Intervention = "Intervention"
# Attribute_Condition = "Condition"
# Attribute_Pubmed_Article ="Pubmed_Article"

Line_attribute_list = ["https://vaidhyamegha.com/named_edge/Intervention\n", "https://vaidhyamegha.com/named_edge/Condition\n", "https://vaidhyamegha.com/named_edge/Pubmed_Article\n"]
attribute_list = ["Intervention", "Condition", "Pubmed_Article"]

# This is always 1
Source_node_Id = 1

# Type column in edge
Type_Directed = "Directed"



# rows = [ ['Nikhil', 'COE', '2', '9.0'],
#          ['Sanchit', 'COE', '2', '9.1'],
#          ['Aditya', 'IT', '2', '9.3'],
#          ['Sagar', 'SE', '1', '9.5'],
#          ['Prateek', 'MCE', '3', '7.8'],
#          ['Sahil', 'EP', '2', '9.1']]

# Each Element is a list od [ID, Label, Attribute ]

# Function to write rows to csv file
def write_to_csv(fields, rows, filename):
    # writing to csv file
    with open(filename, 'w') as csvfile:
        # creating a csv writer object
        csvwriter = csv.writer(csvfile)

        # writing the fields
        csvwriter.writerow(fields)

        # writing the data rows
        csvwriter.writerows(rows)
    print(f"File {filename} Updated ")

def get_rows(txt_file):

    # data rows of csv file
    rows_node =[ ]
    rows_edge =[]

    # This will update
    Id_Counter = 2

    with open(txt_file, "r") as txtfile:

        # read lines of file
        lines = txtfile.readlines()

        # Iterate over each line and update each rows of nodes and edge
        for (i, line) in enumerate(lines):

            if i==0:
                # Update first with trial
                rows_node.append([1, line, 'trial'])

            #Check for Condition, Intervention and Pubmed_Article and update row.

            if line in Line_attribute_list:
                Label = lines[i+1]
                rows_node.append([Id_Counter, Label, attribute_list[Line_attribute_list.index(line)]])
                rows_edge.append([Source_node_Id, Id_Counter, attribute_list[Line_attribute_list.index(line)], Type_Directed])
                Id_Counter = Id_Counter+1
    return rows_node, rows_edge

ap = argparse.ArgumentParser()
ap.add_argument("-f", "--folder", required=True, help="path to folder")
args = vars(ap.parse_args())

present_dir = os.getcwd()
input_folder = args["folder"]

# directory of present week
file_dir = os.path.join(present_dir, input_folder)

node_csv_file = "_node.csv"
edge_csv_file = "_edge.csv"

for file in os.listdir(input_folder):

    if file.endswith(".txt"):

        txt_file = os.path.join(input_folder, file)

        os.path.splitext(txt_file)
        filePath_node = os.path.splitext(txt_file)[0] + node_csv_file
        filePath_edge = os.path.splitext(txt_file)[0] + edge_csv_file

        rows_node, rows_edge = get_rows(txt_file)
        write_to_csv(fields_node, rows_node, filePath_node)
        write_to_csv(fields_edge, rows_edge, filePath_edge)




