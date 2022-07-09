# Ricky Ponting's Test Career
## A Brief Statistical Analysis

![Ricky Ponting](/images/ponting_rm1.jpg)

### Role: Sole Author

## Project Goals

This project showcased developing skills learnt from Monash University in Data Analytics & Visualisation where I explored batting statistics from a cricket player’s Test match career.

Technologies used:
* MS SQL Server for data exploration and cleaning
* Tableau to create visualisations from the clean data
* Explore Machine Learning generated stats and plots via R & R Studio

Sources used:
* https://data.world/cclayford/cricinfo-statsguru-data
* https://www.espncricinfo.com/player/ricky-ponting-7133/bowling-batting-stats
* https://cran.r-project.org/web/packages/cricketr/index.html


## Data Exploration

The data for this project was sourced from data.world but can also be scraped from Cricinfo’s StatsGuru. The datasets from data.world are stored by Century. As Ponting debuted in 1995 and retired in 2012, I needed to merge the 20th and 21st Century Test stats datasets.

During initial exploration of the data, it was evident we could remove many unnecessary columns eg. bowling stats. We would of course remove all other players’ stats as well.

Some examples of code are shown here which helped clean the data.

![sql-query-examples](/images/sql-query-examples.PNG)

From two datasets numbering 116,000 & 208,000 rows, with 28 columns in each - this was cut down to 287 rows (total Test match innings) and 15 columns, in the end sticking with the columns shown here.

This was then exported to a new .csv where visualisations would be built off.

![query_union_runs](/images/query_union_runs.PNG)


## Data Visualisation in Tableau

Using Tableau, I created many visualisations including the below example which visualised the positive correlation between Batting Average & Runs Scored per year. Ponting's career Strike Rate remained high even through his lean periods indicating his positive strokeplay he was renowned for throughout his career.

![Dashboard_02](/images/Dashboard_02.PNG)

An interesting (or maybe not) analysis I picked up …

In 1999 Ricky Ponting ended up in a bar fight in Kings Cross which put his career at a crossroads & in jeopardy. Analysis shows his decision to clean up his image and strive to be better, resulted in him becoming the world's premier batsman.

![Bar_Fight](/images/Bar_Fight.PNG)


## Data Visualisation in R with cricketr

The cricketr package has many functions that perform different analyses on both batsmen and bowlers, including functions that plot the likelihood of runs for a batsman, relative run & strike rates of batsmen and relative performance & economy rate for bowlers.

The data for a particular player can be obtained with the getPlayerData() function to pull from ESPN CricInfo's Player index, in this case Ricky Ponting. Inspecting the page we can find the profile number for the player e.g. for Ricky Ponting this would be https://www.espncricinfo.com/player/ricky-ponting-7133. Ponting’s profile number of 7133 is what we need.

![R-package-ponting](/images/R-package-ponting.PNG)

Some interesting visualisations found are included below.

![Rplot-pie-chart-dismissals](/images/Rplot-pie-chart-dismissals.png)

![Rplot-moving-avg](/images/Rplot-moving-avg.png)

![Rplot-runs-scored-v-no-of-4s](/images/Rplot-runs-scored-v-no-of-4s.png)


## Machine Learning Examples in R with cricketr

### Future Runs forecast

90% of runs were used as the training set in this model, with 10% used as the test set. A Holt-Winters forecasting model is used to forecast future performance based on the 90% training set. The forecasted runs trend is plotted. The test set is also plotted to see how close the forecast and the actual matches.

In this case we expected Ponting to score quite heavily as he had done throughout his career, but the model did not anticipate a late-career form slump where Ponting’s average and runs output dropped significantly.

![Rplot-runs-forecast](/images/Rplot-runs-forecast.png)

### Predicting Runs given Balls Faced and Minutes at Crease

A multi-variate regression plane is fitted between Runs and Balls faced + Minutes at crease.

The fitted model is then used to predict the runs that the batsmen will score, given Balls faced and Minutes at crease. It can be seen Ponting will likely score quite positively due to his excellent career strike rate.

![Rconsole-predicting-runs-given-balls-faced-mins-at-crease](/images/Rconsole-predicting-runs-given-balls-faced-mins-at-crease.PNG)



Sam Walker © 2022