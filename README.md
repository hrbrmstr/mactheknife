
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
  - `get_app_info`: Retrieve iTunes info about a give app (via bundle
    id)
  - `kernel_state`: Retrieve kernel state information
  - `logger`: Log a message to the macOS logging system (searchable from
    Console.app)
  - `mdls`: Return a data frame of macOS Spotlight Metadata Attributes
    for the specified paths
  - `read_dsstore`: Read a .DS\_Store from a file/URL
  - `read_plist`: Read a macOS property list file
  - `resolve_alias`: Resolve macOS Alias Files to POSIX path strings
  - `software_update_history`: Retrieve Software Update history
  - `src_knowledgeC`: Source the ‘knowledgeC.db’ on the local system
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
## [1] '0.3.0'
```

### `mdls` info

``` r
res <- mdls(list.files(here::here("R"), full.names = TRUE))

res
## # A tibble: 20 x 27
##    kMDItemContentCrea… kMDItemContentCrea… kMDItemContentModi… kMDItemContentT… kMDItemContentT… kMDItemDateAdded   
##    <dttm>              <dttm>              <dttm>              <chr>            <list>           <dttm>             
##  1 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-04-30 00:29:39 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
##  2 2018-10-09 17:21:09 2018-10-09 00:00:00 2018-10-09 17:23:04 com.apple.rez-s… <chr [7]>        2018-10-09 17:21:09
##  3 2019-09-01 13:37:35 2019-09-01 00:00:00 2019-09-01 14:37:13 com.apple.rez-s… <chr [7]>        2019-09-01 13:37:35
##  4 2019-09-01 13:55:51 2019-09-01 00:00:00 2019-09-01 14:50:36 com.apple.rez-s… <chr [7]>        2019-09-01 13:55:51
##  5 2018-04-30 17:49:23 2018-04-30 00:00:00 2018-04-30 18:05:24 com.apple.rez-s… <chr [7]>        2018-04-30 17:49:23
##  6 2019-10-28 17:03:26 2019-10-28 00:00:00 2019-10-28 17:03:26 com.apple.rez-s… <chr [7]>        2019-10-28 17:03:26
##  7 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-04-30 00:29:39 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
##  8 2018-07-25 18:33:44 2018-07-25 00:00:00 2018-07-25 18:46:20 com.apple.rez-s… <chr [7]>        2018-07-25 18:33:44
##  9 2018-04-30 00:29:39 2018-04-30 00:00:00 2019-10-28 17:04:48 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 10 2020-02-11 19:26:20 2020-02-11 00:00:00 2020-02-11 19:50:05 com.apple.rez-s… <chr [7]>        2020-02-11 19:26:20
## 11 2019-06-02 13:21:57 2019-06-02 00:00:00 2019-06-02 13:21:57 com.apple.rez-s… <chr [7]>        2019-06-02 13:21:57
## 12 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-04-30 00:29:39 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 13 2018-07-06 16:38:09 2018-07-06 00:00:00 2018-07-06 16:38:09 com.apple.rez-s… <chr [7]>        2018-07-06 16:38:09
## 14 2019-06-02 13:21:57 2019-06-02 00:00:00 2019-06-02 13:21:57 com.apple.rez-s… <chr [7]>        2019-06-02 13:21:57
## 15 2019-10-28 17:04:25 2019-10-28 00:00:00 2019-10-28 17:05:37 com.apple.rez-s… <chr [7]>        2019-10-28 17:04:25
## 16 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-04-30 18:04:05 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 17 2018-04-30 00:29:39 2018-04-30 00:00:00 2019-09-01 13:55:00 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 18 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-07-06 16:35:04 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 19 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-04-30 00:29:39 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## 20 2018-04-30 00:29:39 2018-04-30 00:00:00 2018-07-06 16:33:59 com.apple.rez-s… <chr [7]>        2018-04-30 00:29:39
## # … with 21 more variables: kMDItemDateAdded_Ranking <dttm>, kMDItemDisplayName <chr>,
## #   kMDItemFSContentChangeDate <dttm>, kMDItemFSCreationDate <dttm>, kMDItemFSCreatorCode <int>,
## #   kMDItemFSFinderFlags <int>, kMDItemFSInvisible <lgl>, kMDItemFSIsExtensionHidden <lgl>, kMDItemFSLabel <int>,
## #   kMDItemFSName <chr>, kMDItemFSOwnerGroupID <int>, kMDItemFSOwnerUserID <int>, kMDItemFSSize <int>,
## #   kMDItemFSTypeCode <int>, kMDItemInterestingDate_Ranking <dttm>, kMDItemKind <chr>, kMDItemLogicalSize <int>,
## #   kMDItemPhysicalSize <int>, X_kMDItemDisplayNameWithExtensions <chr>, kMDItemContentModificationDate_Ranking <dttm>,
## #   kMDItemDocumentIdentifier <int>

dplyr::glimpse(res)
## Observations: 20
## Variables: 27
## $ kMDItemContentCreationDate             <dttm> 2018-04-30 00:29:39, 2018-10-09 17:21:09, 2019-09-01 13:37:35, 2019-0…
## $ kMDItemContentCreationDate_Ranking     <dttm> 2018-04-30, 2018-10-09, 2019-09-01, 2019-09-01, 2018-04-30, 2019-10-2…
## $ kMDItemContentModificationDate         <dttm> 2018-04-30 00:29:39, 2018-10-09 17:23:04, 2019-09-01 14:37:13, 2019-0…
## $ kMDItemContentType                     <chr> "com.apple.rez-source", "com.apple.rez-source", "com.apple.rez-source"…
## $ kMDItemContentTypeTree                 <list> [<"com.apple.rez-source", "public.source-code", "public.data", "publi…
## $ kMDItemDateAdded                       <dttm> 2018-04-30 00:29:39, 2018-10-09 17:21:09, 2019-09-01 13:37:35, 2019-0…
## $ kMDItemDateAdded_Ranking               <dttm> 2018-04-30, 2018-10-09, 2019-09-01, 2019-09-01, 2018-04-30, 2019-10-2…
## $ kMDItemDisplayName                     <chr> "airport-scan.R", "applescript.R", "check_sig.R", "check-notary.R", "f…
## $ kMDItemFSContentChangeDate             <dttm> 2018-04-30 00:29:39, 2018-10-09 17:23:04, 2019-09-01 14:37:13, 2019-0…
## $ kMDItemFSCreationDate                  <dttm> 2018-04-30 00:29:39, 2018-10-09 17:21:09, 2019-09-01 13:37:35, 2019-0…
## $ kMDItemFSCreatorCode                   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## $ kMDItemFSFinderFlags                   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## $ kMDItemFSInvisible                     <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
## $ kMDItemFSIsExtensionHidden             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, …
## $ kMDItemFSLabel                         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## $ kMDItemFSName                          <chr> "airport-scan.R", "applescript.R", "check_sig.R", "check-notary.R", "f…
## $ kMDItemFSOwnerGroupID                  <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
## $ kMDItemFSOwnerUserID                   <int> 502, 502, 502, 502, 502, 502, 502, 502, 502, 502, 502, 502, 502, 502, …
## $ kMDItemFSSize                          <int> 1812, 1593, 842, 1301, 1758, 919, 426, 378, 523, 1018, 246, 1713, 425,…
## $ kMDItemFSTypeCode                      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## $ kMDItemInterestingDate_Ranking         <dttm> 2018-04-30, 2018-10-09, 2019-09-01, 2019-09-01, 2018-04-30, 2019-10-2…
## $ kMDItemKind                            <chr> "Rez Source", "Rez Source", "Visual Studio Code - Insiders document", …
## $ kMDItemLogicalSize                     <int> 1812, 1593, 842, 1301, 1758, 919, 426, 378, 523, 1018, 246, 1713, 425,…
## $ kMDItemPhysicalSize                    <int> 4096, 4096, 4096, 4096, 4096, 4096, 4096, 4096, 4096, 4096, 4096, 4096…
## $ X_kMDItemDisplayNameWithExtensions     <chr> NA, "applescript.R", "check_sig.R", "check-notary.R", NA, "get-app-inf…
## $ kMDItemContentModificationDate_Ranking <dttm> NA, 2018-10-09, 2019-09-01, 2019-09-01, NA, 2019-10-28, NA, 2018-07-2…
## $ kMDItemDocumentIdentifier              <int> NA, 0, 0, 0, NA, 0, NA, 0, 0, 0, NA, NA, 0, NA, 0, NA, 0, NA, NA, NA
```

### Kernel state vars

``` r
kernel_state()
## # A tibble: 1,296 x 2
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
## # … with 1,286 more rows
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
## List of 38
##  $ : chr [1:21] "2018-asx-200" "2019-12-heisenberg-year-in-review" "2019-12-radiation" "2019-factset" ...
##  $ : chr "data"
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
##  $ : chr "data"
##  $ : chr "201912"
##  $ : chr "data"
##  $ : chr [1:2] "data" "working-final_files"
##  $ : chr "hars"
##  $ : chr(0) 
##  $ : chr "data"
##  $ : chr "R"
##  $ : chr "data"
##  $ : chr "R"
##  $ : chr [1:2] "data" "working-final_files"
##  $ : chr "figure-html"
##  $ : chr "data"
##  $ : chr "data"
##  $ : chr "data"
##  $ : chr [1:2] "data" "output"
##  $ : chr "R"
##  $ : chr [1:5] ".git" ".Rproj.user" "data" "output" ...
##  $ : chr "2020-01"
##  $ : chr(0) 
##  $ : chr(0) 
##  $ : chr [1:2] "data" "orig"
##  $ : chr [1:3] "MDR-CA-Slack-HAR-to-CSV.command" "MDR-CA-Slack-HAR-to-CSV.R" "slackhar2csv.Rproj"
##  $ : chr [1:36] "2010-11-05-raster.R" "2019-11-01-points.Rmd" "2019-11-02-lines.R" "2019-11-03-polygons.R" ...
##  $ : chr [1:3] "GISofThrones" "lake-data" "Shape"
##  $ : chr "13"
```

### “Software Update” History

``` r
software_update_history()
## # A tibble: 537 x 6
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
## # … with 527 more rows
```

### macOS Version Info (short)

``` r
sw_vers()
## # A tibble: 1 x 6
##   ProductName ProductVersion BuildVersion ProductFullName          Hardware KernelVersion
##   <chr>       <chr>          <chr>        <chr>                    <chr>    <chr>        
## 1 Mac OS X    10.15.4        19E224g      macOS Catalina (10.15.4) x86_64   19.4.0
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
## character(0)
## attr(,"status")
## [1] 1
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
##  4 CodeDirectory v             20500 size=2142 flags=0x10000(runtime) hashes=58+5 location=embedded
##  5 VersionPlatform             1                                                                   
##  6 VersionMin                  658944                                                              
##  7 VersionSDK                  659200                                                              
##  8 Hash type                   sha256 size=32                                                      
##  9 CandidateCDHash sha256      28de5b33fe3eebcbfae885a4dddfa751e28a4e43                            
## 10 CandidateCDHashFull sha256  28de5b33fe3eebcbfae885a4dddfa751e28a4e43425a7cc02f4268c544c6ff98    
## 11 Hash choices                sha256                                                              
## 12 CMSDigest                   28de5b33fe3eebcbfae885a4dddfa751e28a4e43425a7cc02f4268c544c6ff98    
## 13 CMSDigestType               2                                                                   
## 14 Page size                   4096                                                                
## 15 CDHash                      28de5b33fe3eebcbfae885a4dddfa751e28a4e43                            
## 16 Signature size              8967                                                                
## 17 Authority                   Developer ID Application: Bob Rudis (CBY22P58G8)                    
## 18 Authority                   Developer ID Certification Authority                                
## 19 Authority                   Apple Root CA                                                       
## 20 Timestamp                   Sep 21, 2019 at 08:44:46                                            
## 21 Info.plist entries          26                                                                  
## 22 TeamIdentifier              CBY22P58G8                                                          
## 23 Runtime Version             10.15.0                                                             
## 24 Sealed Resources version    2 rules=13 files=32                                                 
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

## mactheknife Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       22 | 0.96 | 399 | 0.92 |         127 | 0.74 |      169 | 0.74 |
| Rmd  |        1 | 0.04 |  36 | 0.08 |          44 | 0.26 |       59 | 0.26 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
