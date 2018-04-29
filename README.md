
# mactheknife

Various ‘macOS’-oriented Tools and Utilities

## Description

A set of tools/methods and data that are geared towards the ‘macOS’
ecosystem.

## NOTE

  - Uses `reticulate` so a working Python implementation is needed

## What’s Inside The Tin

  - `kernel_state`: Retrieve kernel state information
  - `read_dsstore`: Read a ‘.DS\_Store’ from a file/URL
  - `software_update_history`: Retrieve Software Update history
  - `sw_vers`: Retrieve macOS Operating System Version Information

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

### Kernel state vars

``` r
kernel_state()
```

    ## # A tibble: 1,217 x 2
    ##    setting               value                        
    ##    <chr>                 <chr>                        
    ##  1 user.cs_path          /usr/bin:/bin:/usr/sbin:/sbin
    ##  2 user.bc_base_max      99                           
    ##  3 user.bc_dim_max       2048                         
    ##  4 user.bc_scale_max     99                           
    ##  5 user.bc_string_max    1000                         
    ##  6 user.coll_weights_max 2                            
    ##  7 user.expr_nest_max    32                           
    ##  8 user.line_max         2048                         
    ##  9 user.re_dup_max       255                          
    ## 10 user.posix2_version   200112                       
    ## # ... with 1,207 more rows

### `.DS_Store` example

Using built-in data

``` r
read_dsstore(
  path = system.file("extdat", "DS_Store.ctf", package = "mactheknife")
)
```

    ## [1] "favicon.ico"     "flag"            "static"          "templates"       "vulnerable.py"   "vulnerable.wsgi"

### From a URL

A URL I should not have let a `.DS_Store` file lying around
    in

``` r
read_dsstore("https://rud.is/books/21-recipes/.DS_Store")
```

    ## [1] "06-Creating-a-Graph-of-Retweet-Relationships_files"    "07-Visualizing-a-Graph-of-Retweet-Relationships_files"
    ## [3] "20-Visualizing-Geodata-with-a-Dorling-Cartogram_files" "libs"

### A Directory of`.DS_Store`s

A larger example using my “~/projects” folder (use your own dir as an
example).

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

### “Software Update” History

``` r
software_update_history()
```

    ## # A tibble: 590 x 6
    ##    displayName                   displayVersion date                packageIdentifiers processName     contentType
    ##    <chr>                         <chr>          <dttm>              <list>             <chr>           <chr>      
    ##  1 Chinese Word List Update      5.7            2017-01-23 16:01:55 <chr [1]>          softwareupdated config-data
    ##  2 MRT Configuration Data        1.14           2017-01-23 16:02:53 <chr [1]>          softwareupdated config-data
    ##  3 Gatekeeper Configuration Data 107            2017-01-23 16:02:55 <chr [1]>          softwareupdated config-data
    ##  4 XProtectPlistConfigData       1.0            2017-01-23 16:03:16 <chr [1]>          softwareupdated config-data
    ##  5 iTunes                        12.5.4         2017-01-23 16:04:43 <chr [5]>          softwareupdated <NA>       
    ##  6 GarageBand                    10.1.3         2017-01-23 16:06:48 <chr [1]>          storedownloadd  <NA>       
    ##  7 OneDrive                      17.3.6725      2017-01-23 16:06:54 <chr [1]>          storedownloadd  <NA>       
    ##  8 Table Tool                    1.1.2          2017-01-23 16:06:55 <chr [1]>          storedownloadd  <NA>       
    ##  9 Degrees Pro                   4.2.1          2017-01-23 16:06:56 <chr [1]>          storedownloadd  <NA>       
    ## 10 WordService                   2.8.1          2017-01-23 16:06:57 <chr [1]>          storedownloadd  <NA>       
    ## # ... with 580 more rows

### macOS Version Info (short)

``` r
sw_vers()
```

    ## # A tibble: 1 x 3
    ##   ProductName ProductVersion BuildVersion
    ##   <chr>       <chr>          <chr>       
    ## 1 Mac OS X    10.12.6        16G1405
