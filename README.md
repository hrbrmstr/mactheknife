
# mactheknife

Various ‘macOS’-oriented Tools and Utilities

## Description

A set of tools/methods and data that are geared towards the ‘macOS’
ecosystem.

## NOTE

  - Uses `reticulate` so a working Python *3* implementation is needed.
    Consider setting `RETICULATE_PYTHON` to a valid, working Python 3
    installation if this package is not working for you.

## What’s Inside The Tin

The following functions are implemented:

  - `airport_scan`: Scan for available wireless network (requires Wi-Fi
    enabled Mac)
  - `kernel_state`: Retrieve kernel state information
  - `find_dsstore`: Find and optionally remove ‘.DS\_Store’ files on a
    locally-accessible filesystem
  - `read_dsstore`: Read a ‘.DS\_Store’ from a file/URL
  - `software_update_history`: Retrieve Software Update history
  - `sw_vers`: Retrieve macOS Operating System Version Information

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

    ## # A tibble: 1,175 x 2
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
    ## # ... with 1,165 more rows

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

    ##  list()

### “Software Update” History

``` r
software_update_history()
```

    ## # A tibble: 1,513 x 6
    ##    displayName                          displayVersion date                packageIdentifiers processName   contentType
    ##    <chr>                                <chr>          <dttm>              <list>             <chr>         <chr>      
    ##  1 Command Line Developer Tools for OS… 5.1.0.0        2014-10-14 19:06:45 <chr [2]>          softwareupda… <NA>       
    ##  2 Command Line Tools (OS X 10.9)       6.0            2014-10-14 19:06:45 <chr [2]>          softwareupda… <NA>       
    ##  3 CoreLSKD Configuration Data          8              2014-10-14 19:40:41 <chr [1]>          softwareupda… config-data
    ##  4 XProtectPlistConfigData              1.0            2014-10-14 19:40:41 <chr [1]>          softwareupda… config-data
    ##  5 Chinese Word List Update             3.2            2014-10-14 19:40:41 <chr [1]>          softwareupda… config-data
    ##  6 Gatekeeper Configuration Data        26.0           2014-10-14 19:40:41 <chr [1]>          softwareupda… config-data
    ##  7 Digital Camera RAW Compatibility Up… 5.07           2014-10-15 15:48:03 <chr [1]>          softwareupda… <NA>       
    ##  8 iBooks Update                        1.0.1          2014-10-15 15:48:03 <chr [2]>          softwareupda… <NA>       
    ##  9 iTunes                               11.4           2014-10-15 15:48:03 <chr [5]>          softwareupda… <NA>       
    ## 10 Keynote                              6.2.2          2014-10-15 15:48:21 <chr [1]>          storeagent    <NA>       
    ## # ... with 1,503 more rows

### macOS Version Info (short)

``` r
sw_vers()
```

    ## # A tibble: 1 x 3
    ##   ProductName ProductVersion BuildVersion
    ##   <chr>       <chr>          <chr>       
    ## 1 Mac OS X    10.13.5        17F45c

### Airport scan

``` r
airport_scan()
```

    ## Scanning for available wireless networks...

    ## # A tibble: 4 x 7
    ##   ssid         bssid              rssi channel ht    cc    security                
    ## * <chr>        <chr>             <int> <chr>   <chr> <chr> <chr>                   
    ## 1 NETGEAR79-5G 04:a1:51:2a:47:c5   -88 153,-1  Y     --    WPA2(PSK/AES/AES)       
    ## 2 RDN-100      56:d9:e7:7b:9e:25   -55 1       Y     --    WPA2(PSK,FT-PSK/AES/AES)
    ## 3 RDN-5G       46:d9:e7:7b:9e:25   -59 1       Y     --    WPA2(PSK,FT-PSK/AES/AES)
    ## 4 RDN-5G       46:d9:e7:b3:80:47   -23 11      Y     --    WPA2(PSK,FT-PSK/AES/AES)
