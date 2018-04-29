
# mactheknife

Various ‘macOS’-oriented Tools and Utilities

## Description

A set of tools/methods and data that are geared towards the ‘macOS’
ecosystem.

## NOTE

  - Uses `reticulate` so a working Python implementation is needed

## What’s Inside The Tin

  - `read_dsstore`: Read a ‘.DS\_Store’ from a file/URL

The following functions are implemented:

## Installation

``` r
devtools::install_github("hrbrmstr/mactheknife")
```

## Usage

``` r
library(mactheknife)

# current verison
packageVersion("mactheknife")
```

    ## [1] '0.1.0'

## `.DS_Store` example using built-in data

``` r
read_dsstore(
  path = system.file("extdat", "DS_Store.ctf", package = "mactheknife")
)
```

    ## [1] "favicon.ico"     "flag"            "static"          "templates"       "vulnerable.py"   "vulnerable.wsgi"

## A URL I should not have let a `.DS_Store` file lying around in

``` r
read_dsstore("https://rud.is/books/21-recipes/.DS_Store")
```

    ## [1] "06-Creating-a-Graph-of-Retweet-Relationships_files"    "07-Visualizing-a-Graph-of-Retweet-Relationships_files"
    ## [3] "20-Visualizing-Geodata-with-a-Dorling-Cartogram_files" "libs"

## `.DS_Store` larger example using my “~/projects” folder (use your own dir as an example)

``` r
library(magrittr)

list.files(
  path = "~/projects", pattern = "\\.DS_Store", 
  all.files=TRUE, recursive = TRUE, full.names = TRUE
) %>% 
  lapply(read_dsstore) -> x

str(x)
```

    ## List of 21
    ##  $ : chr [1:20] "2017-dashboard" "2017-tlapd" "cataps" "congress-privacy" ...
    ##  $ : chr "greenery-palettes"
    ##  $ : chr "data"
    ##  $ : chr "data"
    ##  $ : chr(0) 
    ##  $ : chr(0) 
    ##  $ : chr(0) 
    ##  $ : chr "packrat"
    ##  $ : chr "lib"
    ##  $ : chr "x86_64-apple-darwin15.6.0"
    ##  $ : chr "3.4.0"
    ##  $ : chr(0) 
    ##  $ : chr "data"
    ##  $ : chr "lyme"
    ##  $ : chr "packrat"
    ##  $ : chr "lib"
    ##  $ : chr "x86_64-apple-darwin15.6.0"
    ##  $ : chr "3.4.1"
    ##  $ : chr "plots"
    ##  $ : chr [1:2] "top-1m.csv" "top-1m.csv.zip"
    ##  $ : chr(0)
