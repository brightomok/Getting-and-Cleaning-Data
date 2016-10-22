Ryan Tillis - Getting and Cleaning Data - Data Science - Quiz 2 - Coursera
================
<a href="http://www.ryantillis.com"> Ryan Tillis </a>
July 6, 2016

Getting and Cleaning Data Quiz 2
--------------------------------

This is Quiz 2 from the Getting and Cleaning Data course within the Data Science Specialization on Coursera. Topics include querying an API and SQL database, html scraping, and fixed width files.

### Questions

<hr>
<font size="+2">1. </font> Register an application with the Github API here <https://github.com/settings/applications>. Access the API to get information on your instructors repositories (hint: this is the url you want "<https://api.github.com/users/jtleek/repos>"). Use this data to find the time that the datasharing repo was created. What time was it created?

This tutorial may be useful (<https://github.com/hadley/httr/blob/master/demo/oauth2-github.r>). You may also need to run the code in the base R package and not R studio.

<hr>
<font size="+1"> <b>

-   2013-11-07T13:25:07Z

</b> </font>

<hr>
``` r
library(httr)

oauth_endpoints("github")

gitapp <- oauth_app("github",
  key = "e84aefedbce3a0690faf",
  secret = "bf589b8260cb6a26719b9cc64fa205d5da1abf26")

github_token <- oauth2.0_token(oauth_endpoints("github"), gitapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

library(jsonlite)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
repo <- json2[5,]
names(repo)
repo$created_at
```

<hr>
<font size="+2">2. </font> The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.

Download the American Community Survey data and load it into an R object called

acs

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv>

Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?

<hr>
<font size="+1"> <b>

-   sqldf("select pwgtp1 from acs where AGEP &lt; 50")

</b> </font>

<hr>
``` r
library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "quiz2data.csv")

acs <- read.csv("quiz2data.csv")

sqldf("select pwgtp1 from acs where AGEP < 50")
```

<hr>
<font size="+2">3. </font> Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
<hr>
<font size="+1"> <b>

-   sqldf("select distinct AGEP from acs")

</b> </font>

<hr>
``` r
sqldf("select distinct AGEP from acs")
```

<hr>
<font size="+2">4. </font> How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:

<http://biostat.jhsph.edu/~jleek/contact.html>

(Hint: the nchar() function in R may be helpful)

<hr>
<font size="+1"> <b>

-   45 31 7 25

</b> </font>

<hr>
``` r
require(httr);require(XML)
```

    ## Loading required package: httr

    ## Loading required package: XML

``` r
URL <- url("http://biostat.jhsph.edu/~jleek/contact.html")
lines <- readLines(URL)
close(URL)
c(nchar(lines[10]), nchar(lines[20]), nchar(lines[30]), nchar(lines[100]))
```

    ## [1] 45 31  7 25

<hr>
<font size="+2">5. </font> Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

<https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for>

Original source of the data: <http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for>

(Hint this is a fixed width file format)

<hr>
<font size="+1"> <b>

-   28893.3

</b> </font>

<hr>
``` r
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
widths <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
fixed <- read.fwf(url, widths, header = FALSE, skip = 4)
sum(fixed$V8)
```

<hr>
See more at: <http://www.ryantillis.com/>

<hr>
