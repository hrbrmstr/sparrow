
# sparrow

Temporary Shorcut For Reading Arrow/Parquet Bit Into R via ‘reticulate’

## Description

Work is being done to make Parquet/Arrow a first-class R citizen but –
until then – I don’t always want a Drill server round trip just to read
in some data and same goes for firing up a Spark instance (srsly). So,
this is a quick hack until the R packages are done.

## NOTE

**Requires** Python 3.5+, `pyarrow` and `pandas`.

## What’s Inside The Tin

The following functions are implemented:

  - `read_parquet`: Read in data from Parquet into an R data frame via
    ‘reticulate’

## Installation

``` r
devtools::install_github("hrbrmstr/sparrow")
```

## Usage

``` r
library(sparrow)

# current verison
packageVersion("sparrow")
```

    ## [1] '0.1.0'

``` r
read_parquet("/tmp/honeypot.parquet")
```

    ## # A tibble: 1,678,931 x 7
    ##       duration service proto ts                  src             src_country_code dport
    ##          <dbl> <chr>   <chr> <chr>               <chr>           <list>           <int>
    ##  1 121.        -       tcp   2018-01-23 19:55:09 154.70.142.5    <chr [1]>          445
    ##  2 108.        -       tcp   2018-01-23 20:02:54 46.29.195.27    <chr [1]>          445
    ##  3   0.0000380 -       tcp   2018-01-23 19:29:50 121.52.205.133  <chr [1]>          443
    ##  4  13.8       -       tcp   2018-01-23 20:07:03 199.227.118.42  <chr [1]>          445
    ##  5  17.4       -       tcp   2018-01-23 20:10:18 115.110.123.190 <chr [1]>          445
    ##  6  17.9       -       tcp   2018-01-23 20:14:02 221.132.113.69  <chr [1]>          445
    ##  7 117.        -       tcp   2018-01-23 20:14:47 201.238.247.234 <chr [1]>          445
    ##  8   2.22      ssh     tcp   2018-01-23 19:34:34 123.59.134.76   <chr [1]>           22
    ##  9  19.3       -       tcp   2018-01-23 20:19:05 185.120.222.35  <chr [1]>          445
    ## 10  27.7       -       tcp   2018-01-23 19:46:49 118.166.51.193  <chr [1]>          445
    ## # ... with 1,678,921 more rows

``` r
read_parquet("/tmp/honeypot.parquet", c("src", "duration"))
```

    ## # A tibble: 1,678,931 x 2
    ##    src                duration
    ##    <chr>                 <dbl>
    ##  1 154.70.142.5    121.       
    ##  2 46.29.195.27    108.       
    ##  3 121.52.205.133    0.0000380
    ##  4 199.227.118.42   13.8      
    ##  5 115.110.123.190  17.4      
    ##  6 221.132.113.69   17.9      
    ##  7 201.238.247.234 117.       
    ##  8 123.59.134.76     2.22     
    ##  9 185.120.222.35   19.3      
    ## 10 118.166.51.193   27.7      
    ## # ... with 1,678,921 more rows
