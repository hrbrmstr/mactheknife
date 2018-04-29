
# mactheknife

Read ‘macOS’ .DS\_Store’ Files

## Description

A thin wrapper around the ‘Python’ ‘dsstore’ module
<https://github.com/gehaxelt/Python-dsstore> by ‘Sebastian Neef’.

## NOTE

  - This may turn into a broader “macOS hacking” package
  - Uses `reticulate` so a working Python implementation is needed

## What’s Inside The Tin

  - `read_dsstore`: Read a ‘.DS\_Store’ file

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

## Built-in data

``` r
read_dsstore(
  path = system.file("extdat", "DS_Store.ctf", package = "mactheknife")
)
```

    ## [1] "favicon.ico"     "flag"            "static"          "templates"       "vulnerable.py"   "vulnerable.wsgi"

## My “~/projects” folder (use your own dir as an example)

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
