
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/mactheknife.svg?branch=master)](https://travis-ci.org/hrbrmstr/mactheknife)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/mactheknife/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/mactheknife)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

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
  - `applescript`: Execute AppleScript and Return Results
  - `check_notarization`: Check application notarization info
  - `check_sig`: Check application signature/notarization information
  - `find_dsstore`: Find and optionally remove .DS\_Store files on a
    locally-accessible filesystem
  - `kernel_state`: Retrieve kernel state information
  - `logger`: Log a message to the macOS logging system (searchable from
    Console.app)
  - `read_dsstore`: Read a .DS\_Store from a file/URL
  - `read_plist`: Read a macOS property list file
  - `resolve_alias`: Resolve macOS Alias Files to POSIX path strings
  - `software_update_history`: Retrieve Software Update history
  - `sw_vers`: Retrieve macOS Operating System Version Information
  - `system_profile`: Report system hardware and software configuration

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/mactheknife.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/mactheknife")
# or
remotes::install_gitlab("hrbrmstr/mactheknife")
# or
remotes::install_bitbucket("hrbrmstr/mactheknife")
# or
remotes::install_github("hrbrmstr/mactheknife")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(mactheknife)

# current verison
packageVersion("mactheknife")
## [1] '0.2.0'
```

### Kernel state vars

``` r
kernel_state()
## # A tibble: 1,294 x 2
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
## # … with 1,284 more rows
```

### `.DS_Store` example

Using built-in data

``` r
read_dsstore(
  path = system.file("extdat", "DS_Store.ctf", package = "mactheknife")
)
## [1] "favicon.ico"     "flag"            "static"          "templates"       "vulnerable.py"   "vulnerable.wsgi"
```

### From a URL

A URL I should not have let a `.DS_Store` file lying around in

``` r
read_dsstore("https://rud.is/books/21-recipes/.DS_Store")
##  [1] "00-About-the-Author.md"                                        
##  [2] "01-Introduction.md"                                            
##  [3] "01-Using-OAuth.md"                                             
##  [4] "02-Diving-In.md"                                               
##  [5] "02-Trending-Topics.md"                                         
##  [6] "03-Extracting-Tweet-Entities.md"                               
##  [7] "04-Searching-for-Tweets.md"                                    
##  [8] "05-Extracting-a-Retweets-Origins.md"                           
##  [9] "06-Creating-a-Graph-of-Retweet-Relationships.md"               
## [10] "06-Creating-a-Graph-of-Retweet-Relationships_files"            
## [11] "07-Visualizing-a-Graph-of-Retweet-Relationships.md"            
## [12] "07-Visualizing-a-Graph-of-Retweet-Relationships_files"         
## [13] "08-Twitter-Streaming-API.md"                                   
## [14] "09-Making-Robust-Twitter-Requests.md"                          
## [15] "10-Harvesting-Tweets.md"                                       
## [16] "11-Creating-a-Tag-Cloud-from-Tweet-Entities.md"                
## [17] "12-Summarizing-Link-Targets.md"                                
## [18] "13-Harvesting-Friends-and-Followers.md"                        
## [19] "14-Performing-Setwise-Operations.md"                           
## [20] "15-Resolving-User-Profile-Information.md"                      
## [21] "16-Crawling-Followers-to-Approximate-Potential-Influence.md"   
## [22] "16-Crawling-Followers-to-Approximate-Potential-Influence_files"
## [23] "17-Analyzing-Friendship-Relationships-such-as-FoF.md"          
## [24] "18-Analyzing-Friendship-Cliques.md"                            
## [25] "19-Analyzing-Authors-in-Subs.md"                               
## [26] "20-Visualizing-Geodata-with-a-Dorling-Cartogram.md"            
## [27] "20-Visualizing-Geodata-with-a-Dorling-Cartogram_files"         
## [28] "21-Geocoding-Locations-From-Profiles.md"                       
## [29] "21-recipes-for-mining-twitter-with-rtweet.docx"                
## [30] "21-recipes-for-mining-twitter-with-rtweet.epub"                
## [31] "21-recipes-for-mining-twitter-with-rtweet.pdf"                 
## [32] "22-Visualising-Intersecting-Follower-Sets-with-UpsetR.md"      
## [33] "22-Visualising-Intersecting-Follower-Sets-with-UpsetR_files"   
## [34] "data"                                                          
## [35] "figures"                                                       
## [36] "index.html"                                                    
## [37] "index.md"                                                      
## [38] "libs"                                                          
## [39] "search_index.json"                                             
## [40] "style.css"
```

### A Directory of`.DS_Store`s

A larger example using my “\~/projects” folder (use your own dir as an
example).

``` r
library(magrittr)

list.files(
  path = "~/projects", pattern = "\\.DS_Store", 
  all.files = TRUE, recursive = TRUE, full.names = TRUE
) %>% 
  lapply(read_dsstore) -> x

str(x)
## List of 10
##  $ : chr [1:4] "figures" "python" "R" "support"
##  $ : chr [1:4] "data" "figures" "python" "R"
##  $ : chr(0) 
##  $ : chr(0) 
##  $ : chr(0) 
##  $ : chr [1:3] "data" "figures" "R"
##  $ : chr(0) 
##  $ : chr(0) 
##  $ : chr(0) 
##  $ : chr(0)
```

### “Software Update” History

``` r
software_update_history()
## # A tibble: 203 x 6
##    displayName                   displayVersion date                packageIdentifiers processName     contentType
##    <chr>                         <chr>          <dttm>              <list>             <chr>           <chr>      
##  1 XProtectPlistConfigData       2103           2019-06-03 22:18:20 <chr [2]>          softwareupdated config-data
##  2 Gatekeeper Configuration Data 167            2019-06-03 22:18:20 <chr [2]>          softwareupdated config-data
##  3 Microsoft Excel               <NA>           2019-06-04 10:35:20 <chr [1]>          installer       <NA>       
##  4 Microsoft PowerPoint          <NA>           2019-06-04 10:35:53 <chr [1]>          installer       <NA>       
##  5 Microsoft Word                <NA>           2019-06-04 10:36:22 <chr [1]>          installer       <NA>       
##  6 OneDrive                      19.062.0331    2019-06-04 11:34:51 <chr [1]>          appstoreagent   <NA>       
##  7 MindNode                      6.0.3          2019-06-05 19:50:41 <chr [1]>          storedownloadd  <NA>       
##  8 MindNode                      6.0.3          2019-06-06 00:50:26 <chr [1]>          appstoreagent   <NA>       
##  9 Tweetbot                      3.3            2019-06-06 00:50:56 <chr [1]>          appstoreagent   <NA>       
## 10 Microsoft Excel               <NA>           2019-06-06 00:52:53 <chr [1]>          installer       <NA>       
## # … with 193 more rows
```

### macOS Version Info (short)

``` r
sw_vers()
## # A tibble: 1 x 6
##   ProductName ProductVersion BuildVersion ProductFullName        Hardware KernelVersion
##   <chr>       <chr>          <chr>        <chr>                  <chr>    <chr>        
## 1 Mac OS X    10.15          19A546d      macOS Catalina (10.15) x86_64   19.0.0
```

### Applescript

``` r
res <- applescript('
tell application "Music" 
  set r_name to name of current track
  set r_artist to artist of current track
end
return "artist=" & r_artist & "\ntrack=" & r_name
')

print(res)
## [1] "artist=NICO Touches the Walls" "track=Hologram"
```

### App info

``` r
check_sig("/Applications/RSwitch.app") %>% 
  print(n=nrow(.))
## # A tibble: 25 x 2
##    key                         value                                                               
##    <chr>                       <chr>                                                               
##  1 Executable                  /Applications/RSwitch.app/Contents/MacOS/RSwitch                    
##  2 Identifier                  is.rud.bob.RSwitch                                                  
##  3 Format                      app bundle with Mach-O thin (x86_64)                                
##  4 CodeDirectory v             20500 size=1342 flags=0x10000(runtime) hashes=33+5 location=embedded
##  5 VersionPlatform             1                                                                   
##  6 VersionMin                  658944                                                              
##  7 VersionSDK                  659200                                                              
##  8 Hash type                   sha256 size=32                                                      
##  9 CandidateCDHash sha256      efa512a9daabfb9402af8a91697f008b89ffa81e                            
## 10 CandidateCDHashFull sha256  efa512a9daabfb9402af8a91697f008b89ffa81ea014452821e39a5365d80fe6    
## 11 Hash choices                sha256                                                              
## 12 CMSDigest                   efa512a9daabfb9402af8a91697f008b89ffa81ea014452821e39a5365d80fe6    
## 13 CMSDigestType               2                                                                   
## 14 Page size                   4096                                                                
## 15 CDHash                      efa512a9daabfb9402af8a91697f008b89ffa81e                            
## 16 Signature size              8968                                                                
## 17 Authority                   Developer ID Application: Bob Rudis (CBY22P58G8)                    
## 18 Authority                   Developer ID Certification Authority                                
## 19 Authority                   Apple Root CA                                                       
## 20 Timestamp                   Sep 1, 2019 at 08:46:41                                             
## 21 Info.plist entries          26                                                                  
## 22 TeamIdentifier              CBY22P58G8                                                          
## 23 Runtime Version             10.15.0                                                             
## 24 Sealed Resources version    2 rules=13 files=26                                                 
## 25 Internal requirements count 1 size=212

check_notarization("/Applications/RSwitch.app")
## # A tibble: 4 x 2
##   key         value                                           
##   <chr>       <chr>                                           
## 1 application /Applications/RSwitch.app                       
## 2 status      accepted                                        
## 3 source      Notarized Developer ID                          
## 4 origin      Developer ID Application: Bob Rudis (CBY22P58G8)
```

## macthekinfe Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       19 | 0.95 | 329 | 0.91 |         103 | 0.72 |      149 | 0.73 |
| Rmd  |        1 | 0.05 |  33 | 0.09 |          40 | 0.28 |       54 | 0.27 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
