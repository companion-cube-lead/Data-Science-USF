# Data Science @ USF     
![USF Logo](https://www.usf.edu/images/ucm/marketing/logos/email-sigs/bull-u-usf-240x60.png)

Welcome to the Data Science @ USF Student Org Official Github Page. The purpose and goals of this student organization is to promote the enterprise of data science in the undergraduate and undergraduate student body. Our Github Page will host repositories for the Kaggle competitions we will practice over the semester, and the different projects and workshops the organization will undertake. 

# Getting Started for New Students
The field of data science encompasses and benefits from the domain knowledge of other fields. Our org is open to any major but the tools of data science are consistent across the board. To get started in your journey, start off by downloading Python or R. These are not the only languages for data science, but they are among the most popular. 

| Language | Code Base | Recommended IDE/Notebook|
| --- | --- | --- | 
| Python |https://www.python.org/downloads/ |https://colab.research.google.com
| R |https://cran.r-project.org/mirrors.html |https://rstudio.com/products/rstudio/download/#download

# Getting started with R
## Useful Packages in R
R has a slew of useful packages for data science, among one of my favorites are
  - data.table for querying and munging data
  - ggpubr for visualization  
  - The CARET  library which serves as a unified interface for several machine learning models 
``` r
# to intall libraries in R, simply run the install.packages() function on the library you would like to download
> install.packages("data.table")
> install.packages("ggpubr")
# once you installed the library, run the library() function around the     package name, no quotes, to load and begin using them.
> library(data.table)
```
## Importing your dataset into Rstudio
Rstudio makes it easier for the lay-user to import a dataset into the r environment.
1. Hit the import dataset button and find the dataset downloaded unto your computer
![Import Data](https://support.rstudio.com/hc/article_attachments/360017333414/data-import-rstudio-overview.gif)
You can decide to change datatypes in this step as well
2. Rstudio will automatically store your imported dataset in a new variable name, usually it's the name of the file you imported
![Import Data](https://support.rstudio.com/hc/article_attachments/360018060413/Screen_Shot_2018-10-31_at_9.44.21_PM.png)

In the background, rstudio helps you call the read.csv() or read.txt() to help you place your dataframe into a variable name. This is done by calling the function and using the assign operator like so. 
``` r
mydata <- read.csv(file="c:/user/myoducments/mydata.csv", header=TRUE, sep=",")
# Now mydata holds my dataframe
```
In practice, getting the data to fit into a dataframe can be one of the most diffucult aspects of the data science lifecycle, however for our purposes it's good to begin here.

# Getting started with Python
Python is the most popular language for data science, its claim to fame are the popular packages for scientific computing it has available to it. Among the most popular are: 
- Pandas for querying and munging data
- Seaborn for visualization
- Sklearn for machine learning 

If you are using Google Collab, these packages are already loaded into the collab enviroment. No need to download them on your own. If you are not using Google Collab, use Pip to download the packages you need using the Python shell. 

``` Python
pip install pandas
```
 **Note:** If you downloaded Python using the anaconda distribution, you do not need to install Pandas seperately. 

## Importing your dataset into Google Collab
Google Collab works by running code in cells. 
1. To import your dataset into the environment, add a new cell
![Import Data](https://support.treasuredata.com/hc/article_attachments/360046279653/gcolabcodebox.png)
2. In the new cell, copy and run the following code: 
``` Python
from google.colab import files
uploaded = files.upload()
import io
```
**Note:** Run the code by hitting the play button in the code cell.
2. A prompt like the one below show pop up. Browse for your dataset on your computer and once you select it wait until it's uploaded to the environment.
![Import Data](https://cdn-images-1.medium.com/max/1000/1*y0svQW7PeSU92kYZLWciPw.png)

3. Run the following code to pass your CSV as a pandas dataframe. The name of the file being passed through the uploaded function must match the file name exactly.
``` Python
import pandas as pd
mydataframe = pd.read_csv(io.BytesIO(uploaded['myfile.csv']))
```
**Note:** If you close your notebook environment, the code cells will display the last code you ran in your last session. You will have to re-upload your dataset if you want to work on your notebook again.
## Celebration!
Congrats! You've imported your first dataset into your development environment. Notebooks are the preferred way for data scientists to develop a it makes it easy to reproduce and share their work. We are currently developing the repositories for the challanges we'll be undertaking throughout the year. Make sure to check back often for resources on how to tackle different datasets.


