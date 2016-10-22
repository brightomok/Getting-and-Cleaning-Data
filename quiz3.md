Ryan Tillis - R Programming - Data Science - Quiz 3 - Coursera
================
<a href="http://www.ryantillis.com"> Ryan Tillis </a>
June 15, 2016

R Programming Quiz 3
--------------------

This is Quiz 3 from the Data Scientist's toolbox course within the Data Science Specialization.

### Questions

<hr>
<font size="+2">1. </font> Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:

``` r
library(datasets)
data(iris)
```

A description of the dataset can be found by running

``` r
?iris
```

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

(Only enter the numeric result and nothing else.)

<hr>
<font size="+1">

-   7

</font>

<hr>
##### Explanation:

The which function creates an index for virginica species, the $ operator singles out the Sepal.Length column, then the mean and round function do the rest.

``` r
round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))
```

    ## [1] 7

<hr>
<font size="+2">2. </font> Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

<hr>
<font size="+1">

-   apply(iris\[, 1:4\], 2, mean)

</font>

<hr>
##### Explanation:

Using Apply to aggregate column means

``` r
apply(iris[, 1:4], 2, mean)
```

    ## Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    ##     5.843333     3.057333     3.758000     1.199333

<hr>
<font size="+2">3. </font> Load the 'mtcars' dataset in R with the following code

``` r
library(datasets)
data(mtcars)
```

There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running

``` r
?iris
```

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

<hr>
<font size="+1">

-   with(mtcars, tapply(mpg, cyl, mean))

-   sapply(split(mtcars*m**p**g*, *m**t**c**a**r**s*cyl), mean)

-   tapply(mtcars*m**p**g*, *m**t**c**a**r**s*cyl, mean)

</font>

<hr>
##### Explanation:

Different strokes

<hr>
``` r
with(mtcars, tapply(mpg, cyl, mean))
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

``` r
sapply(split(mtcars$mpg, mtcars$cyl), mean)
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

``` r
tapply(mtcars$mpg, mtcars$cyl, mean)
```

    ##        4        6        8 
    ## 26.66364 19.74286 15.10000

<hr>
<font size="+2">4. </font> Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)

<hr>
<font size="+1">

-   127

</font>

<hr>
##### Explanation:

Using the built in looping tapply function to aggregate and then round/abs.

Self-explanatory

``` r
new <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(new[3]-new[1]))
```

    ##   8 
    ## 127

<hr>
<font size="+2">5. </font> If you run

``` r
debug(ls)
```

What happens when you next call the 'ls' function?

<hr>
<font size="+1">

-   Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.

</font>

<hr>
##### Explanation:

Debug walks through each block of code to identify errors and bugs.

<hr>
Check out my website at: <http://www.ryantillis.com/>

<hr>
