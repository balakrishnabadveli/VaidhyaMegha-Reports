

# Installation of Gephi 
- Commands to install java 
```
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt update
sudo apt install openjdk-8-jdk openjdk-8-jre
```

- Download Gephi
```
wget ---shoow-progress https://github.com/gephi/gephi/releases/download/v0.9.2/gephi-0.9.2-linux.tar.gz
```

- Unzip 
```
tar xzf gephi-0.9.2-linux.tar.gz
/gephi-0.9.2/bin/gephi
```


# Problems encountered while opening gephi tool :
![Exception](images/Exception_at_openning.png)

## Soluton: 
- Change the version of java to 11 by using following comand
```
sudo update-alternatives --config java
```
![Solution](images/java_version_change.png)

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export PATH=$JAVA_HOME/bin:$PATH

## Issue : Unable to see graph and showing intialising :
### Solution : 
- Go to : "path_to/ gephi 0.9.2/etc/gephi.conf"
- Update jdkhome to jdkhome="/usr/lib/jvm/java-8-openjdk-amd64"


https://github.com/gephi/gephi/issues/2081
https://github.com/gephi/gephi/issues/2189
https://archlinux.org/packages/community/any/gephi/

## Issue : Failed to write core dump. Core dumps have been disabled :

This error was occured while Enabling Show_Lables in Gephi tool.

### Solution :

Execute below command in terminal
```commandline
ulimit -c unlimited
```
Reference : [here](https://stackoverflow.com/questions/28982396/failed-to-write-core-dump-core-dumps-have-been-disabled)

- SIGSEGV : SigSegV means a signal for memory access violation, trying to read or write from/to a memory area that your process does not have access to.In computing, a segmentation fault or access violation is a fault, or failure condition, raised by hardware with memory protection, notifying an operating system the software has attempted to access a restricted area of memory.

## Issue : Tool closed abruptly : 

This issue wil raise while opening saved workspace or while editing the graph.
### Solution :
Execute below command in terminal
```
export LIBGL_ALWAYS_SOFTWARE=1
```
Check whether set to 1 or not by using following command
```
echo $LIBGL_ALWAYS_SOFTWARE
```
Reference : 
1) [here](https://unix.stackexchange.com/questions/1437/what-does-libgl-always-indirect-1-actually-do) and 
2) [here](https://x.cygwin.com/docs/ug/using-glx.html)


# Import Data

- File formats :  GEXF, GDF, GML, GraphML, Pajek NET files,  UCINET DL, Excel and CSV files.
- To import the files, go to the Data Laboratory tab -> Import Spreadsheet button

## Import Data from CSV files :
 Need to prepare two files 
 - one containing nodes and their attributes.
 - another containing an edge list and edge attributes.

 ###  nodes list CSV file :
 
 - The nodes file should at least have the columns "Id" and "Label."  "Id" should be uniques. 
 - The node table can also include attributes. Attributes offer a way for you to distinguish between nodes by categorizing data by, for example, color, size, or age.


### edge list CSV file :

- Have atleast 3 columns "Source", "Target", and "Type". 

- "Source" and "Target" refers to nodes that are listed in nodes.csv file. "Type" refers to how the two nodes are connected for example like Directed or Undirected. 

- In the edges table, can also add a column to define the weightedness for each relationship. Weight gives the option to show the importance of certain relationships by giving them a numerical weight. 

 # Process 

- After opening Tool, select "New Project" --> Data laboratory --> Import Spreadsheet --> Navigate to csv files location of nodes and edges and select files .
- Change Layout to change view of graph.






# References: 
[here](https://libguides.brown.edu/gephi#:~:text=Nodes%3A%20the%20nodes%20file%20tells,are%20related%20(or%20connected).)

