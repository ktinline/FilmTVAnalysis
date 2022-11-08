# TV and Film Analysis from Netflix Data 

Carrying out Excel and SQL analysis on Netflix Data obtained from Kaggle: https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies and then experimenting with visuals from this data on Power BI. 

I first used the titles.csv file and deleted rows that I was not interested in analysing (age certification, run time, release year). I checked for duplicates (there were none), and filted for blanks and removed any rows that had blank information. I sorted the imdb score data to check for any anomalies (i.e. any values above 10). 

I created a new Excel file using filtes to show the Top 10 movies (excluding TV shows) based on imdb score and produced a bar chart showing this data. 

I then imported the titles_blanks_and_unwanted_columns_removed.csv file into MySQL workbench and carried out analysis there - shown in my comments in the .sql files. 

I then visualised the data in Power BI. 

Ideas for further analysis: 
* Explore top TV show data and visualise this in Power BI 
* Visualise the top genres 
* Obtain data for other streaming platforms and consider which platform has the most highly rated shows and movies available. 

Further work carried out in Excel following the above analysis: 

* imported credits data as a second sheet as used VLOOKUP function to show the imdb score from sheet 1 against the character information in the credits sheet
* used COUNTIF function to calculate count of type (i.e. the number of movies and the number of shows in the data)
* used pivot tables 

